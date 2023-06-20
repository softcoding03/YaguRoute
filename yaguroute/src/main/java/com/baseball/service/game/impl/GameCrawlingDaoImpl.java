package com.baseball.service.game.impl;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeDriverService;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.baseball.common.config.ChromeDriverConfig.ChromeDriverPool;
import com.baseball.common.domain.Team;
import com.baseball.service.domain.Game;
import com.baseball.service.domain.GamePreview;
import com.baseball.service.domain.GameRecord;
import com.baseball.service.domain.Hitter;
import com.baseball.service.domain.Pitcher;
import com.baseball.service.domain.Player;
import com.baseball.service.game.GameCrawlingDao;
import com.baseball.service.game.GameDao;

@Repository
public class GameCrawlingDaoImpl implements GameCrawlingDao {
	
	@Autowired
	private ChromeDriverPool chromeDriverPool;
	
	@Autowired
	@Qualifier("gameDao")
	private GameDao gameDao;

	public GameCrawlingDaoImpl() {
		System.out.println(this.getClass());
	}
	
	//오늘의 경기 정보
	public List<Game> getTodayGameSchedule(){
		
		List<Game> thisDateGameList = new ArrayList<>();
		
		SimpleDateFormat dateFromat = new SimpleDateFormat("yyyy.MM.dd");
		SimpleDateFormat strFromat = new SimpleDateFormat("yyyyMMdd");
		
		/*String WEB_DRIVER_ID = "webdriver.chrome.driver";
		String WEB_DRIVER_PATH = "src/main/resources/chromedriver_win32/chromedriver.exe";
		
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
		
		ChromeOptions ops = new ChromeOptions();
		ops.setCapability("ignoreProtectedModeSettings", true);
		ops.addArguments("--remote-allow-origins=*");
		ops.addArguments("headless");
		ops.addArguments("--no-sandbox");
		ops.addArguments("--disable-dev-shm-usage");
		ops.addArguments("ignore-certificate-errors");
		
		WebDriverdriver = new ChromeDriver(ops);*/
		WebDriver driver = null;
		try{
			driver = chromeDriverPool.acquireWebDriver();
			
			driver.get("https://sports.news.naver.com/kbaseball/schedule/index");
			
			WebElement todayGame = driver.findElement(By.cssSelector("#calendarWrap > div.selected"));
//			WebElement todayGame = driver.findElement(By.cssSelector("#calendarWrap > div:nth-child(18)"));
			if(!todayGame.getAttribute("class").contains("nogame")) {
				String date = todayGame.findElement(By.cssSelector("table > tbody > tr:nth-child(1) > td:nth-child(1) > span.td_date > strong")).getText();
				
				int state = 0;
				
				String nowYear = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy"));
				
				for(WebElement oneGame : todayGame.findElements(By.cssSelector("table > tbody > tr"))) {
					
					Game game = new Game();
					
					game.setGameDate(nowYear+"."+date);
					
					if(oneGame.findElement(By.cssSelector("td:nth-child(3) span,td:nth-child(4) span")).getAttribute("class").contains("cancel") 
							|| oneGame.findElement(By.cssSelector("td:nth-child(2),td:nth-child(3)")).getAttribute("class").contains("add_state")) 
					{
						state = 3;
					}else {
						if(oneGame.findElement(By.cssSelector("td a")).getAttribute("href").contains("record")) {
							state = 2;
						}else if(oneGame.findElement(By.cssSelector("td a")).getAttribute("href").contains("preview")){
							state = 0;
						}else {
							state = 1;
						}
					}
					game.setGameStatusCode(String.valueOf(state));
					
					game.setGameTime(oneGame.findElement(By.cssSelector(".td_hour")).getText());
					
					String teamName="";
					if(oneGame.findElement(By.cssSelector(".team_lft")).getText().trim().equals("나눔") 
							|| oneGame.findElement(By.cssSelector(".team_lft")).getText().trim().equals("드림")
							|| oneGame.findElement(By.cssSelector(".team_lft")).getText().trim().equals("웨스턴")
							|| oneGame.findElement(By.cssSelector(".team_lft")).getText().trim().equals("이스턴")
							|| oneGame.findElement(By.cssSelector(".team_lft")).getText().trim().equals("서군")
							|| oneGame.findElement(By.cssSelector(".team_lft")).getText().trim().equals("동군")){
						continue;
					}else {
						teamName = oneGame.findElement(By.cssSelector(".team_lft")).getText().trim();
					}
					game.setAwayTeam(gameDao.getTeamInfoByTeamName(teamName));
					
					if(oneGame.findElement(By.cssSelector(".team_lft")).getText().trim().equals("나눔") 
							|| oneGame.findElement(By.cssSelector(".team_lft")).getText().trim().equals("드림")
							|| oneGame.findElement(By.cssSelector(".team_lft")).getText().trim().equals("웨스턴")
							|| oneGame.findElement(By.cssSelector(".team_lft")).getText().trim().equals("이스턴")
							|| oneGame.findElement(By.cssSelector(".team_lft")).getText().trim().equals("서군")
							|| oneGame.findElement(By.cssSelector(".team_lft")).getText().trim().equals("동군")){
						continue;
					}else {
						teamName = oneGame.findElement(By.cssSelector(".team_rgt")).getText().trim();
					}
					game.setHomeTeam(gameDao.getTeamInfoByTeamName(teamName));
					
					game.setGameScore(oneGame.findElement(By.cssSelector(".td_score")).getText());
					if(game.getGameStatusCode().equals("2")) {
						String[] scoreTmp = game.getGameScore().split("[:]");
						if(scoreTmp[0].equals(scoreTmp[1])) {
							game.setGameStatusCode("4");
						}
						game.setWinningTeamCode((Integer.parseInt(scoreTmp[0]) < Integer.parseInt(scoreTmp[1])?game.getHomeTeam().getTeamCode():(Integer.parseInt(scoreTmp[0]) > Integer.parseInt(scoreTmp[1])?game.getAwayTeam().getTeamCode():null)));
					}
					String gameTmp = strFromat.format(dateFromat.parse(game.getGameDate()))+game.getAwayTeam().getTeamCode()+game.getHomeTeam().getTeamCode()+"0"+(Integer.parseInt(nowYear)<=2015?"":nowYear);
					
					game.setGameCode(gameTmp);
					thisDateGameList.add(game);
					}
				}else {
				return null;
			}
		}catch(Exception e) {
			System.out.println(e);
		} finally {
			if(driver != null) {
				chromeDriverPool.releaseWebDriver(driver);
			}
		}
		return thisDateGameList;
	}
	
	//현재 모든 연도 모든 게임 가져오기
	public List<Game> getThisYearGameSchedule() throws Exception {
		
		List<Game> thisYearGameList = new ArrayList<>();
		
		SimpleDateFormat dateFromat = new SimpleDateFormat("yyyy.MM.dd");
		SimpleDateFormat strFromat = new SimpleDateFormat("yyyyMMdd");
		WebDriver driver = null;
		WebDriver orderDriver = null;
		WebDriver monthDriver = null;
		try{
			driver = chromeDriverPool.acquireWebDriver();
			orderDriver = chromeDriverPool.acquireWebDriver();
			monthDriver = chromeDriverPool.acquireWebDriver();
			/*WebDriver driver = new ChromeDriver(ops);*/
			
			orderDriver.get("https://sports.news.naver.com/kbaseball/schedule/index");
			
			orderDriver.findElement(By.xpath("//*[@id=\"_currentYearButton\"]")).click();
			List<WebElement> yearList = orderDriver.findElements(By.cssSelector("#_yearList > li"));
			
			for(WebElement year : yearList) {
				monthDriver.get("https://sports.news.naver.com/kbaseball/schedule/index?date=20230612&month=03&year="+year.getText()+"&teamCode=");
				monthDriver.findElement(By.xpath("//*[@id=\"_currentMonthButton\"]")).click();
				List<WebElement> monthList = monthDriver.findElements(By.cssSelector("#_monthList > li"));
				for(WebElement mon : monthList) {
					System.out.println(year.getText()+" "+mon.getText());
					
					String url = "https://sports.news.naver.com/kbaseball/schedule/index?date=20230612&month="+mon.getText()+"&year="+year.getText()+"&teamCode=";
					
					driver.get(url);
					
					List<WebElement> monthDayCount = driver.findElements(By.cssSelector("#calendarWrap > div:not(.nogame,.nogame2)"));
					String nowYear = year.getText();
					
					for(WebElement dayGame : monthDayCount) {
						
						String date = dayGame.findElement(By.cssSelector(".td_date strong")).getText();
	
						int state = 0;
						
						for(WebElement oneGame : dayGame.findElements(By.cssSelector("tr"))) {
							
							Game game = new Game();
							
							game.setGameDate(nowYear+"."+date);
							
							if(oneGame.findElement(By.cssSelector("td:nth-child(3) span")).getAttribute("class").contains("cancel") 
									|| oneGame.findElement(By.cssSelector("td:nth-child(4) span")).getAttribute("class").contains("cancel") 
									|| oneGame.findElement(By.cssSelector("td:nth-child(2)")).getAttribute("class").contains("add_state")
									|| oneGame.findElement(By.cssSelector("td:nth-child(3)")).getAttribute("class").contains("add_state")) {
								state = 3;
							}else {
								if(oneGame.findElement(By.cssSelector("td a")).getAttribute("href").contains("record")) {
									state = 2;
								}else if(oneGame.findElement(By.cssSelector("td a")).getAttribute("href").contains("preview")){
									state = 0;
								}else {
									state = 1;
								}
							}
							game.setGameStatusCode(String.valueOf(state));
							
							game.setGameTime(oneGame.findElement(By.cssSelector(".td_hour")).getText());
							
							String teamName="";
							if(oneGame.findElement(By.cssSelector(".team_lft")).getText().trim().equals("넥센")){
								teamName = "키움";
							}else if(oneGame.findElement(By.cssSelector(".team_lft")).getText().trim().equals("SK")){
								teamName = "SSG";
							}else if(oneGame.findElement(By.cssSelector(".team_lft")).getText().trim().equals("나눔") 
									|| oneGame.findElement(By.cssSelector(".team_lft")).getText().trim().equals("드림")
									|| oneGame.findElement(By.cssSelector(".team_lft")).getText().trim().equals("웨스턴")
									|| oneGame.findElement(By.cssSelector(".team_lft")).getText().trim().equals("이스턴")
									|| oneGame.findElement(By.cssSelector(".team_lft")).getText().trim().equals("서군")
									|| oneGame.findElement(By.cssSelector(".team_lft")).getText().trim().equals("동군")){
								continue;
							}else {
								teamName = oneGame.findElement(By.cssSelector(".team_lft")).getText().trim();
							}
							game.setAwayTeam(gameDao.getTeamInfoByTeamName(teamName));
							
							if(oneGame.findElement(By.cssSelector(".team_rgt")).getText().trim().equals("넥센") || oneGame.findElement(By.cssSelector(".team_rgt")).getText().trim().equals("넥센")){
								teamName = "키움";
							}else if(oneGame.findElement(By.cssSelector(".team_rgt")).getText().trim().equals("SK") || oneGame.findElement(By.cssSelector(".team_rgt")).getText().trim().equals("SK")){
								teamName = "SSG";
							}else if(oneGame.findElement(By.cssSelector(".team_lft")).getText().trim().equals("나눔") 
									|| oneGame.findElement(By.cssSelector(".team_lft")).getText().trim().equals("드림")
									|| oneGame.findElement(By.cssSelector(".team_lft")).getText().trim().equals("웨스턴")
									|| oneGame.findElement(By.cssSelector(".team_lft")).getText().trim().equals("이스턴")
									|| oneGame.findElement(By.cssSelector(".team_lft")).getText().trim().equals("서군")
									|| oneGame.findElement(By.cssSelector(".team_lft")).getText().trim().equals("동군")){
								continue;
							}else {
								teamName = oneGame.findElement(By.cssSelector(".team_rgt")).getText().trim();
							}
							game.setHomeTeam(gameDao.getTeamInfoByTeamName(teamName));
							game.setGameScore(oneGame.findElement(By.cssSelector(".td_score")).getText());
							String gameTmp = strFromat.format(dateFromat.parse(game.getGameDate()))+game.getAwayTeam().getTeamCode()+game.getHomeTeam().getTeamCode()+"0"+(Integer.parseInt(nowYear)<=2015?"":nowYear);
							if(gameDao.getGameInfo(gameTmp) != null) {
								continue;
							}else {
								game.setGameCode(gameTmp);
								System.out.println(game);
								gameDao.addGame(game);
								thisYearGameList.add(game);
							}
						}
					}
				}
			}
		}catch(Exception e) {
			System.out.println(e);
		} finally {
			if(driver != null) {
				chromeDriverPool.releaseWebDriver(driver);
			}
			if(orderDriver != null) {
				chromeDriverPool.releaseWebDriver(orderDriver);
			}
		}
		return thisYearGameList;
		
	}
	
	//GameRecord
	public GameRecord getGameCrawlingRecord(Game game) throws Exception{
		
		GameRecord gameRecord = new GameRecord();
		List<Pitcher> titlePitcherList = new ArrayList<>();
		List<String> innings = new ArrayList<>();
		List<String> homeScoreList = new ArrayList<>();
		List<String> awayScoreList = new ArrayList<>();
		List<String> homeRecord = new ArrayList<>();
		List<String> awayRecord = new ArrayList<>();
		List<Pitcher> homePitcherList = new ArrayList<>();
		List<Hitter> homeHitterList = new ArrayList<>();
		List<Pitcher> awayPitcherList = new ArrayList<>();
		List<Hitter> awayHitterList = new ArrayList<>();
		
		gameRecord.setGameInfo(game);
		WebDriver driver = null;
		try{
			driver = chromeDriverPool.acquireWebDriver();
			
			//#content > div > aside > div > div.MyTicket_comp_my_ticket__1NhMv.is_unfold.is_get_ticket > div > div.MyTicket_title_area__835u5 > button.MyTicket_button_tooltip__LNiRW
			//#content > div > aside > div > div.MyTicket_comp_my_ticket__1NhMv.is_unfold.is_get_ticket > div > div.MyTicket_title_area__835u5 > button
			//#content > div > aside > div > div.MyTicket_comp_my_ticket__1NhMv.is_unfold.is_get_ticket > div > div.MyTicket_title_area__835u5 > div.MyTicketTooltip_comp_myticket_tooltip__1VKqf > div > button
			String base_url = "https://m.sports.naver.com/game/"+game.getGameCode()+"/record";
			
			driver.get(base_url);
			Thread.sleep(500);
			//#content > div > div > div.MyTicket_comp_my_ticket__1NhMv.is_unfold.is_get_ticket > div > div.MyTicket_title_area__835u5 > button
			if(driver.findElements(By.cssSelector("#content > div > div div.MyTicket_comp_my_ticket__1NhMv.is_unfold.is_get_ticket")).size()!=0) {
				if(driver.findElement(By.cssSelector("#content > div > div div.MyTicket_comp_my_ticket__1NhMv.is_unfold.is_get_ticket > div > div.MyTicket_title_area__835u5 > button.MyTicket_button_tooltip__LNiRW")).getAttribute("aria-pressed").equals("true")) {
					//#content > div > aside > div > div.MyTicket_comp_my_ticket__1NhMv.is_unfold.is_get_ticket > div > div.MyTicket_title_area__835u5 > div.MyTicketTooltip_comp_myticket_tooltip__1VKqf > div > button
					driver.findElement(By.cssSelector("#content > div > div div.MyTicket_comp_my_ticket__1NhMv > div > div.MyTicket_title_area__835u5 > div.MyTicketTooltip_comp_myticket_tooltip__1VKqf > div > button")).click();
				}
			}
			//경기 이닝
			//#content > div > div.Home_main_section__y9jR4 > section.Home_game_head__3EEZZ > div.ScoreBox_comp_score_box__1jaYr > div > div.ScoreBox_round__1sOLq > table
			//#content > div > div.Home_main_section__y9jR4 > section.Home_game_head__3EEZZ > div.ScoreBox_comp_score_box__1jaYr > div > div.ScoreBox_round__1sOLq > table
			List<WebElement> scoreInnings = driver.findElements(By.cssSelector("#content > div > div.Home_main_section__y9jR4 > section.Home_game_head__3EEZZ div.ScoreBox_comp_score_box__1jaYr > div > div.ScoreBox_round__1sOLq > table thead th"));
			
			for(int i =1; i<scoreInnings.size();i++) {
				innings.add(scoreInnings.get(i).getText());
			}
			gameRecord.setInnings(innings);
			//실시간 경기 스코어
			//#content > div > div.Home_main_section__y9jR4 > section.Home_game_head__3EEZZ > div.MatchBox_comp_match_box__1oRmr.MatchBox_type_finished__1kK4- > div.MatchBox_home__MPL6D > div.MatchBox_score_area__2bf1P
			//#content > div > div.Home_main_section__y9jR4 > section.Home_game_head__3EEZZ > div.MatchBox_comp_match_box__1oRmr.MatchBox_type_finished__1kK4- > div.MatchBox_away__1rDsC > div.MatchBox_score_area__2bf1P
			game.setGameScore(driver.findElement(By.cssSelector("#content > div > div.Home_main_section__y9jR4 > section.Home_game_head__3EEZZ div.MatchBox_comp_match_box__1oRmr.MatchBox_type_finished__1kK4- > div.MatchBox_home__MPL6D > div.MatchBox_score_area__2bf1P")).getText().split("[\\n]")[1]+" : "
			+driver.findElement(By.cssSelector("#content > div > div.Home_main_section__y9jR4 > section.Home_game_head__3EEZZ div.MatchBox_comp_match_box__1oRmr.MatchBox_type_finished__1kK4- > div.MatchBox_away__1rDsC > div.MatchBox_score_area__2bf1P")).getText().split("[\\n]")[1]);
	
			// 경기 스코어
			List<WebElement> homeAwayScore = driver.findElements(By.cssSelector("#content > div > div.Home_main_section__y9jR4 > section.Home_game_head__3EEZZ div.ScoreBox_comp_score_box__1jaYr > div > div.ScoreBox_round__1sOLq > table tbody td"));
			
			for(int i=0; i<homeAwayScore.size()/2;i++) {
				awayScoreList.add(homeAwayScore.get(i).getText());
			}
			for(int i=homeAwayScore.size()/2; i<homeAwayScore.size();i++) {
				homeScoreList.add(homeAwayScore.get(i).getText());
			}
			gameRecord.setAwayScoreList(awayScoreList);
			gameRecord.setHomeScoreList(homeScoreList);
			//팀 경기 기록 조회
			//#content > div > div.Home_main_section__y9jR4 > section.Home_game_head__3EEZZ > div.ScoreBox_comp_score_box__1jaYr > div > div.ScoreBox_result__3atD0
			List<WebElement> homeAwayResultScore = driver.findElements(By.cssSelector("#content > div > div.Home_main_section__y9jR4 > section.Home_game_head__3EEZZ div.ScoreBox_comp_score_box__1jaYr > div > div.ScoreBox_result__3atD0 table > tbody > tr > td"));
			
			for(int i=0; i<homeAwayResultScore.size()/2;i++) {
				awayRecord.add(homeAwayResultScore.get(i).getText());
			}
			for(int i=homeAwayResultScore.size()/2; i<homeAwayResultScore.size();i++) {
				homeRecord.add(homeAwayResultScore.get(i).getText());
			}
			gameRecord.setAwayRecord(awayRecord);
			gameRecord.setHomeRecord(homeRecord);
			
			if(game.getGameStatusCode().equals("2")) {
				//승리, 세이브 등 타이틀을 가지는 투수
				// > div > div.PitcherList_comp_pitcher_list__3XCW2 > div > div > ul > li.PitcherList_pitcher_area__2By9l
				List<WebElement> indexLi = driver.findElements(By.cssSelector("#content > div > div.Home_main_section__y9jR4 > section.Home_game_panel__97L_8 > div.Home_game_contents__35IMT div > div.PitcherList_comp_pitcher_list__3XCW2 > div > div > ul > li.PitcherList_pitcher_area__2By9l"));
				for(WebElement titleIndex :indexLi) {
					Pitcher titlePitcher = new Pitcher();
					//#content > div > div.Home_main_section__y9jR4 > section.Home_game_panel__97L_8 > div.Home_game_contents__35IMT > div > div.PitcherList_comp_pitcher_list__3XCW2 > div > div > ul > li:nth-child(1) > 
					List<WebElement> imgTmp = titleIndex.findElements(By.tagName("img"));
					if(imgTmp.size() != 0) {
						titlePitcher.setPitcherImage(imgTmp.get(0).getAttribute("src").split("[?]")[0]);
					}else {
						titlePitcher.setPitcherImage("/images/game/emptyPlayerImage.png");
					}
					String[] titleSplit = titleIndex.getText().split("[\n]");
					titlePitcher.setTitle(titleSplit[0]);
					titlePitcher.setPitcherName(titleSplit[1]);
					titlePitcher.setInnings(titleSplit[2].split("[닝]")[1]);
					titlePitcher.setGetHit(titleSplit[3].split("[타자]")[1]);
					titlePitcher.setMyLostScore(titleSplit[3].split("[책]")[1]);
					titlePitcherList.add(titlePitcher);
				}
				gameRecord.setTitlePitcher(titlePitcherList);
			}
			
			//#content > div > div.Home_main_section__y9jR4 > section.Home_game_panel__97L_8 > div.Home_game_contents__35IMT > div > div.TeamVS_comp_team_vs__fpu3N > div.TeamVS_detail_area__1Owqz > table > tbody > tr:nth-child(1)
			/*
			List<WebElement> teamRecord = homeGamePanel.findElements(By.cssSelector("div.Home_game_contents__35IMT > div > div.TeamVS_comp_team_vs__fpu3N > div.TeamVS_detail_area__1Owqz > table > tbody > tr"));

			
			game.getAwayTeam().setHit(teamRecord.get(0).findElements(By.cssSelector("td")).get(0).getText());
			game.getAwayTeam().setHomerun(teamRecord.get(1).findElements(By.cssSelector("td")).get(0).getText());
			game.getAwayTeam().setSteal(teamRecord.get(2).findElements(By.cssSelector("td")).get(0).getText());
			game.getAwayTeam().setStrikeOut(teamRecord.get(3).findElements(By.cssSelector("td")).get(0).getText());
			game.getAwayTeam().setDoubleLife(teamRecord.get(4).findElements(By.cssSelector("td")).get(0).getText());
			game.getAwayTeam().setError(teamRecord.get(5).findElements(By.cssSelector("td")).get(0).getText());
			
			game.getHomeTeam().setHit(teamRecord.get(0).findElements(By.cssSelector("td")).get(1).getText());
			game.getHomeTeam().setHomerun(teamRecord.get(1).findElements(By.cssSelector("td")).get(1).getText());
			game.getHomeTeam().setSteal(teamRecord.get(2).findElements(By.cssSelector("td")).get(1).getText());
			game.getHomeTeam().setStrikeOut(teamRecord.get(3).findElements(By.cssSelector("td")).get(1).getText());
			game.getHomeTeam().setDoubleLife(teamRecord.get(4).findElements(By.cssSelector("td")).get(1).getText());
			game.getHomeTeam().setError(teamRecord.get(5).findElements(By.cssSelector("td")).get(1).getText());
			*/
			
			//#content > div > div > section.Home_game_panel__97L_8 > div.Home_game_contents__35IMT > div > div.PlayerRecord_comp_player_record__1tI5G.type_kbo > div.PlayerRecord_tabpanel__3GYt9 > div:nth-child(1) > div.PlayerRecord_scroll_area__2KZOU > div > div > table > tbody > tr
			//#content > div > div > section.Home_game_panel__97L_8 > div.Home_game_contents__35IMT > div > div.PlayerRecord_comp_player_record__1tI5G.type_kbo > div.PlayerRecord_tabpanel__3GYt9 > div:nth-child(1) > div.PlayerRecord_player_list_area__gbho3 > ul > li > a > span.PlayerRecord_name__1W_c0
			//선수기록
			List<WebElement> homeHitterRecord = driver.findElements(By.cssSelector("#content > div > div.Home_main_section__y9jR4 > section.Home_game_panel__97L_8 > div.Home_game_contents__35IMT div > div.PlayerRecord_comp_player_record__1tI5G.type_kbo > div.PlayerRecord_tabpanel__3GYt9 div:nth-child(1) > div.PlayerRecord_scroll_area__2KZOU > div > div > table > tbody > tr"));
			List<WebElement> homeHitterName = driver.findElements(By.cssSelector("#content > div > div.Home_main_section__y9jR4 > section.Home_game_panel__97L_8 > div.Home_game_contents__35IMT div > div.PlayerRecord_comp_player_record__1tI5G.type_kbo > div.PlayerRecord_tabpanel__3GYt9 div:nth-child(1) > div.PlayerRecord_player_list_area__gbho3 > ul > li > a > span.PlayerRecord_name__1W_c0"));
			
			for(int i=0;i<homeHitterRecord.size();i++) {
				if(homeHitterRecord.get(i).getAttribute("class").equals("PlayerRecord_type_sum__bKbUH")) {
					break;
				}
				Hitter hitter = new Hitter();
				
				String[] hitterRecord = homeHitterRecord.get(i).getText().split("[ ]");
	
				hitter.setHitterName(homeHitterName.get(i).getText());
				hitter.setAtBat(hitterRecord[0]);
				hitter.setGetScore(hitterRecord[1]);
				hitter.setHits(hitterRecord[2]);
				hitter.setRBI(hitterRecord[3]);
				hitter.setHomeRun(hitterRecord[4]);
				hitter.setWalk(hitterRecord[5]);
				hitter.setStrikeOut(hitterRecord[6]);
				hitter.setBattingAvg(hitterRecord[7]);
				
				homeHitterList.add(hitter);
				
			}
			gameRecord.setHomeHitterList(homeHitterList);
			
			//#content > div > div > section.Home_game_panel__97L_8 > div.Home_game_contents__35IMT > div > div.PlayerRecord_comp_player_record__1tI5G.type_kbo > div.PlayerRecord_tabpanel__3GYt9 > div:nth-child(2) > div.PlayerRecord_player_list_area__gbho3 > ul > li:nth-child(1) > a > span
			//#content > div > div > section.Home_game_panel__97L_8 > div.Home_game_contents__35IMT > div > div.PlayerRecord_comp_player_record__1tI5G.type_kbo > div.PlayerRecord_tabpanel__3GYt9 > div:nth-child(2) > div.PlayerRecord_scroll_area__2KZOU > div > div > table > tbody > tr:nth-child(1)
			List<WebElement> homePitcherRecord = driver.findElements(By.cssSelector("#content > div > div.Home_main_section__y9jR4 > section.Home_game_panel__97L_8 > div.Home_game_contents__35IMT div > div.PlayerRecord_comp_player_record__1tI5G.type_kbo > div.PlayerRecord_tabpanel__3GYt9 div:nth-child(2) > div.PlayerRecord_scroll_area__2KZOU > div > div > table > tbody > tr"));
			List<WebElement> homePitcherName = driver.findElements(By.cssSelector("#content > div > div.Home_main_section__y9jR4 > section.Home_game_panel__97L_8 > div.Home_game_contents__35IMT div > div.PlayerRecord_comp_player_record__1tI5G.type_kbo > div.PlayerRecord_tabpanel__3GYt9 div:nth-child(2) > div.PlayerRecord_player_list_area__gbho3 > ul > li > a > span"));
			
			for(int i=0;i<homePitcherRecord.size();i++) {
				if(homePitcherRecord.get(i).getAttribute("class").equals("PlayerRecord_type_sum__bKbUH")) {
					break;
				}
				Pitcher pitcher = new Pitcher();
				
				String[] pitcherRecord = homePitcherRecord.get(i).getText().split("[ ]");
				int tmp=0;
				if(pitcherRecord.length == 16)
					tmp=1;
				pitcher.setPitcherName(homePitcherName.get(i).getText());
				pitcher.setInnings(pitcherRecord[0]+((pitcherRecord.length == 16)?pitcherRecord[1]:""));
				pitcher.setGetHit(pitcherRecord[1+tmp]); 
				pitcher.setTotalLostScore(pitcherRecord[2+tmp]); 
				pitcher.setMyLostScore(pitcherRecord[3+tmp]);; 
				pitcher.setWalk(pitcherRecord[4+tmp]); 
				pitcher.setStrikeOut(pitcherRecord[5+tmp]);
				pitcher.setGetHomerun(pitcherRecord[6+tmp]);
				pitcher.setAgainstHitter(pitcherRecord[7+tmp]); 
				pitcher.setAtBat(pitcherRecord[8+tmp]); 
				pitcher.setPitchingCount(pitcherRecord[9+tmp]); 
				
				homePitcherList.add(pitcher);
			}
			gameRecord.setHomePitcherList(homePitcherList);
			
			driver.findElement(By.cssSelector(".PlayerRecord_tab__3DKLH[aria-selected=\"false\"]")).click();
			
			List<WebElement> awayHitterRecord = driver.findElements(By.cssSelector("#content > div > div.Home_main_section__y9jR4 > section.Home_game_panel__97L_8 > div.Home_game_contents__35IMT div > div.PlayerRecord_comp_player_record__1tI5G.type_kbo > div.PlayerRecord_tabpanel__3GYt9 div:nth-child(1) > div.PlayerRecord_scroll_area__2KZOU > div > div > table > tbody > tr"));
			List<WebElement> awayHitterName = driver.findElements(By.cssSelector("#content > div > div.Home_main_section__y9jR4 > section.Home_game_panel__97L_8 > div.Home_game_contents__35IMT div > div.PlayerRecord_comp_player_record__1tI5G.type_kbo > div.PlayerRecord_tabpanel__3GYt9 div:nth-child(1) > div.PlayerRecord_player_list_area__gbho3 > ul > li > a > span.PlayerRecord_name__1W_c0"));
			
			for(int i=0;i<awayHitterRecord.size();i++) {
				if(awayHitterRecord.get(i).getAttribute("class").equals("PlayerRecord_type_sum__bKbUH")) {
					break;
				}
				Hitter hitter = new Hitter();
				
				String[] hitterRecord = awayHitterRecord.get(i).getText().split("[ ]");
	
				hitter.setHitterName(awayHitterName.get(i).getText());
				hitter.setAtBat(hitterRecord[0]);
				hitter.setGetScore(hitterRecord[1]);
				hitter.setHits(hitterRecord[2]);
				hitter.setRBI(hitterRecord[3]);
				hitter.setHomeRun(hitterRecord[4]);
				hitter.setWalk(hitterRecord[5]);
				hitter.setStrikeOut(hitterRecord[6]);
				hitter.setBattingAvg(hitterRecord[7]);
				
				awayHitterList.add(hitter);
				
			}
			gameRecord.setAwayHitterList(awayHitterList);
			
			List<WebElement> awayPitcherRecord = driver.findElements(By.cssSelector("#content > div > div.Home_main_section__y9jR4 > section.Home_game_panel__97L_8 > div.Home_game_contents__35IMT div > div.PlayerRecord_comp_player_record__1tI5G.type_kbo > div.PlayerRecord_tabpanel__3GYt9 div:nth-child(2) > div.PlayerRecord_scroll_area__2KZOU > div > div > table > tbody > tr"));
			List<WebElement> awayPitcherName = driver.findElements(By.cssSelector("#content > div > div.Home_main_section__y9jR4 > section.Home_game_panel__97L_8 > div.Home_game_contents__35IMT div > div.PlayerRecord_comp_player_record__1tI5G.type_kbo > div.PlayerRecord_tabpanel__3GYt9 div:nth-child(2) > div.PlayerRecord_player_list_area__gbho3 > ul > li > a > span"));
			
			for(int i=0;i<awayPitcherRecord.size();i++) {
				if(awayPitcherRecord.get(i).getAttribute("class").equals("PlayerRecord_type_sum__bKbUH")) {
					break;
				}
				Pitcher pitcher = new Pitcher();
				
				String[] pitcherRecord = awayPitcherRecord.get(i).getText().split("[ ]");
				int tmp=0;
				if(pitcherRecord.length == 16)
					tmp=1;
				pitcher.setPitcherName(awayPitcherName.get(i).getText());
				pitcher.setInnings(pitcherRecord[0]+((pitcherRecord.length == 16)?pitcherRecord[1]:""));
				pitcher.setGetHit(pitcherRecord[1+tmp]); 
				pitcher.setTotalLostScore(pitcherRecord[2+tmp]); 
				pitcher.setMyLostScore(pitcherRecord[3+tmp]);; 
				pitcher.setWalk(pitcherRecord[4+tmp]); 
				pitcher.setStrikeOut(pitcherRecord[5+tmp]);
				pitcher.setGetHomerun(pitcherRecord[6+tmp]);
				pitcher.setAgainstHitter(pitcherRecord[7+tmp]); 
				pitcher.setAtBat(pitcherRecord[8+tmp]); 
				pitcher.setPitchingCount(pitcherRecord[9+tmp]); 
				
				awayPitcherList.add(pitcher);
			}
			gameRecord.setAwayPitcherList(awayPitcherList);
		}catch(Exception e) {
			System.out.println(e);
		} finally {
			if(driver != null) {
				chromeDriverPool.releaseWebDriver(driver);
			}
		}
		return gameRecord;
	}
	
	//GamePreview
	public GamePreview getGameCrawlingPreview(Game game) throws Exception{
		
		GamePreview gamePreview = new GamePreview();
		
		
		/*String WEB_DRIVER_ID = "webdriver.chrome.driver";
		String WEB_DRIVER_PATH = "src/main/resources/chromedriver_win32/chromedriver.exe";
		
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
		
		ChromeOptions ops = new ChromeOptions();
		ops.setCapability("ignoreProtectedModeSettings", true);
		ops.addArguments("--remote-allow-origins=*");
		ops.addArguments("headless");
		ops.addArguments("--no-sandbox");
		ops.addArguments("--disable-dev-shm-usage");
		ops.addArguments("ignore-certificate-errors");
		
		WebDriver driver = new ChromeDriver(ops);*/
		WebDriver driver = null;
		try{
			driver = chromeDriverPool.acquireWebDriver();
		String base_url = "https://m.sports.naver.com/game/"+game.getGameCode()+"/preview";
		driver.get(base_url);
		Thread.sleep(300);
		//양팀정보
		WebElement teamPower = driver.findElement(By.className("TeamPower_comp_team_power___LgWg"));
		
		WebElement awayRecord = teamPower.findElement(By.cssSelector(".TeamPower_away_team__2KuN1 .TeamPower_record_area__BqzSJ"));
		game.getAwayTeam().setTeamRanking(awayRecord.findElement(By.cssSelector(".TeamPower_rank__1hMAz")).getText().substring(0,1));
		game.getAwayTeam().setWinCount(Integer.parseInt(awayRecord.findElements(By.cssSelector(".TeamPower_result__3y6nW")).get(0).getText().split("승")[0]));
		game.getAwayTeam().setTieCount(Integer.parseInt(awayRecord.findElements(By.cssSelector(".TeamPower_result__3y6nW")).get(1).getText().split("무")[0]));
		game.getAwayTeam().setLoseCount(Integer.parseInt(awayRecord.findElements(By.cssSelector(".TeamPower_result__3y6nW")).get(2).getText().split("패")[0]));
		
		WebElement homeRecord = teamPower.findElement(By.cssSelector(".TeamPower_home_team__2Ztj7 .TeamPower_record_area__BqzSJ"));
		game.getHomeTeam().setTeamRanking(homeRecord.findElement(By.cssSelector(".TeamPower_rank__1hMAz")).getText().substring(0,1));
		game.getHomeTeam().setWinCount(Integer.parseInt(homeRecord.findElements(By.cssSelector(".TeamPower_result__3y6nW")).get(0).getText().split("승")[0]));
		game.getHomeTeam().setTieCount(Integer.parseInt(homeRecord.findElements(By.cssSelector(".TeamPower_result__3y6nW")).get(1).getText().split("무")[0]));
		game.getHomeTeam().setLoseCount(Integer.parseInt(homeRecord.findElements(By.cssSelector(".TeamPower_result__3y6nW")).get(2).getText().split("패")[0]));
		
		List<WebElement> teamPowerTable = teamPower.findElements(By.cssSelector(".TeamPower_power_info_table__gM4Gi tbody tr"));
		game.getAwayTeam().setLastFiveGameGrade(teamPowerTable.get(0).findElements(By.cssSelector("td")).get(0).getText());
		game.getHomeTeam().setLastFiveGameGrade(teamPowerTable.get(0).findElements(By.cssSelector("td")).get(1).getText());
		game.getAwayTeam().setWinRate(teamPowerTable.get(1).findElements(By.cssSelector("td")).get(0).getText());
		game.getHomeTeam().setWinRate(teamPowerTable.get(1).findElements(By.cssSelector("td")).get(1).getText());
		game.getAwayTeam().setTeamBattingAvg(teamPowerTable.get(2).findElements(By.cssSelector("td")).get(0).getText());
		game.getHomeTeam().setTeamBattingAvg(teamPowerTable.get(2).findElements(By.cssSelector("td")).get(1).getText());
		game.getAwayTeam().setTeamLostScoreAvg(teamPowerTable.get(3).findElements(By.cssSelector("td")).get(0).getText());
		game.getHomeTeam().setTeamLostScoreAvg(teamPowerTable.get(3).findElements(By.cssSelector("td")).get(1).getText());
		game.getAwayTeam().setHeadToHeadRecord(teamPowerTable.get(4).findElements(By.cssSelector("td")).get(0).getText());
		game.getHomeTeam().setHeadToHeadRecord(teamPowerTable.get(4).findElements(By.cssSelector("td")).get(1).getText());
		
		Hitter awayKeyPlayer = new Hitter();
		Hitter homeKeyPlayer = new Hitter();
		Pitcher awayStartingPitcher = new Pitcher();
		Pitcher homeStartingPitcher = new Pitcher();
		
		if(driver.findElements(By.className("StartPlayer_comp_player_table__1TGqp")).size() == 0) {
			
			
			WebElement keyPlayer = driver.findElement(By.className("PlayerVS_comp_player_info__e3Joz"));
			List<WebElement> keyPlayerRecord = driver.findElements(By.cssSelector(".TopPlayer_comp_player_table__1wL5X tbody tr"));
			
			WebElement awayPlayer = keyPlayer.findElement(By.className("PlayerVS_away_team__6AbC_"));
			awayKeyPlayer.setHitterImage(awayPlayer.findElement(By.cssSelector(".PlayerVS_profile__3JaOB img")).getAttribute("src").split("[?]")[0]);
			awayKeyPlayer.setHitterName(awayPlayer.findElement(By.cssSelector(".PlayerVS_name__2LQg_")).getText());
			awayKeyPlayer.setBattingAvg(keyPlayerRecord.get(0).findElements(By.cssSelector("td")).get(0).getText());
			awayKeyPlayer.setHits(keyPlayerRecord.get(1).findElements(By.cssSelector("td")).get(0).getText());
			awayKeyPlayer.setHomeRun(keyPlayerRecord.get(2).findElements(By.cssSelector("td")).get(0).getText());
			awayKeyPlayer.setRBI(keyPlayerRecord.get(3).findElements(By.cssSelector("td")).get(0).getText());
			awayKeyPlayer.setLastFiveGameRecord(keyPlayerRecord.get(5).findElements(By.cssSelector("td")).get(0).getText());	
			
			WebElement homePlayer = keyPlayer.findElement(By.className("PlayerVS_home_team__rY7Xa"));
			homeKeyPlayer.setHitterImage(homePlayer.findElement(By.cssSelector(".PlayerVS_profile__3JaOB img")).getAttribute("src").split("[?]")[0]);
			homeKeyPlayer.setHitterName(homePlayer.findElement(By.cssSelector(".PlayerVS_name__2LQg_")).getText());
			homeKeyPlayer.setBattingAvg(keyPlayerRecord.get(0).findElements(By.cssSelector("td")).get(1).getText());
			homeKeyPlayer.setHits(keyPlayerRecord.get(1).findElements(By.cssSelector("td")).get(1).getText());
			homeKeyPlayer.setHomeRun(keyPlayerRecord.get(2).findElements(By.cssSelector("td")).get(1).getText());
			homeKeyPlayer.setRBI(keyPlayerRecord.get(3).findElements(By.cssSelector("td")).get(1).getText());
			homeKeyPlayer.setLastFiveGameRecord(keyPlayerRecord.get(5).findElements(By.cssSelector("td")).get(1).getText());
			
			gamePreview.setAwayKeyPlayer(awayKeyPlayer);
			gamePreview.setHomeKeyPlayer(homeKeyPlayer);
			
			
		}else {
			
			
			List<WebElement> keyPlayer = driver.findElements(By.className("PlayerVS_comp_player_info__e3Joz"));
			
			List<WebElement> startPitcherRecord = driver.findElements(By.cssSelector(".StartPlayer_comp_player_table__1TGqp tbody tr"));
			
			WebElement awayPitcher = keyPlayer.get(0).findElement(By.className("PlayerVS_away_team__6AbC_"));
			awayStartingPitcher.setPitcherImage(awayPitcher.findElement(By.cssSelector(".PlayerVS_profile__3JaOB img")).getAttribute("src").split("[?]")[0]);
			awayStartingPitcher.setPitcherName(awayPitcher.findElement(By.cssSelector(".PlayerVS_name__2LQg_")).getText());
			awayStartingPitcher.setWin(startPitcherRecord.get(0).findElements(By.cssSelector("td")).get(0).getText());
			awayStartingPitcher.setInnings(startPitcherRecord.get(1).findElements(By.cssSelector("td")).get(0).getText());
			awayStartingPitcher.setMyLostScore(startPitcherRecord.get(2).findElements(By.cssSelector("td")).get(0).getText());
			
			WebElement homePitcher = keyPlayer.get(0).findElement(By.className("PlayerVS_home_team__rY7Xa"));
			homeStartingPitcher.setPitcherImage(homePitcher.findElement(By.cssSelector(".PlayerVS_profile__3JaOB img")).getAttribute("src").split("[?]")[0]);
			homeStartingPitcher.setPitcherName(homePitcher.findElement(By.cssSelector(".PlayerVS_name__2LQg_")).getText());
			homeStartingPitcher.setWin(startPitcherRecord.get(0).findElements(By.cssSelector("td")).get(1).getText());
			homeStartingPitcher.setInnings(startPitcherRecord.get(1).findElements(By.cssSelector("td")).get(1).getText());
			homeStartingPitcher.setMyLostScore(startPitcherRecord.get(2).findElements(By.cssSelector("td")).get(1).getText());
			
			List<WebElement> keyPlayerRecord = driver.findElements(By.cssSelector(".TopPlayer_comp_player_table__1wL5X tbody tr"));
			
			WebElement awayPlayer = keyPlayer.get(1).findElement(By.className("PlayerVS_away_team__6AbC_"));
			awayKeyPlayer.setHitterImage(awayPlayer.findElement(By.cssSelector(".PlayerVS_profile__3JaOB img")).getAttribute("src").split("[?]")[0]);
			awayKeyPlayer.setHitterName(awayPlayer.findElement(By.cssSelector(".PlayerVS_name__2LQg_")).getText());
			awayKeyPlayer.setBattingAvg(keyPlayerRecord.get(0).findElements(By.cssSelector("td")).get(0).getText());
			awayKeyPlayer.setHits(keyPlayerRecord.get(1).findElements(By.cssSelector("td")).get(0).getText());
			awayKeyPlayer.setHomeRun(keyPlayerRecord.get(2).findElements(By.cssSelector("td")).get(0).getText());
			awayKeyPlayer.setRBI(keyPlayerRecord.get(3).findElements(By.cssSelector("td")).get(0).getText());
			awayKeyPlayer.setLastFiveGameRecord(keyPlayerRecord.get(5).findElements(By.cssSelector("td")).get(0).getText());	
			
			WebElement homePlayer = keyPlayer.get(1).findElement(By.className("PlayerVS_home_team__rY7Xa"));
			homeKeyPlayer.setHitterImage(homePlayer.findElement(By.cssSelector(".PlayerVS_profile__3JaOB img")).getAttribute("src").split("[?]")[0]);
			homeKeyPlayer.setHitterName(homePlayer.findElement(By.cssSelector(".PlayerVS_name__2LQg_")).getText());
			homeKeyPlayer.setBattingAvg(keyPlayerRecord.get(0).findElements(By.cssSelector("td")).get(1).getText());
			homeKeyPlayer.setHits(keyPlayerRecord.get(1).findElements(By.cssSelector("td")).get(1).getText());
			homeKeyPlayer.setHomeRun(keyPlayerRecord.get(2).findElements(By.cssSelector("td")).get(1).getText());
			homeKeyPlayer.setRBI(keyPlayerRecord.get(3).findElements(By.cssSelector("td")).get(1).getText());
			homeKeyPlayer.setLastFiveGameRecord(keyPlayerRecord.get(5).findElements(By.cssSelector("td")).get(1).getText());
			
			gamePreview.setAwayKeyPlayer(awayKeyPlayer);
			gamePreview.setHomeKeyPlayer(homeKeyPlayer);
			gamePreview.setAwayStartingPitcher(awayStartingPitcher);
			gamePreview.setHomeStartingPitcher(homeStartingPitcher);
			
		}
		
		gamePreview.setGameInfo(game);
		}catch(Exception e) {
			System.out.println(e);
		} finally {
			if(driver != null) {
				chromeDriverPool.releaseWebDriver(driver);
			}
		}
		return gamePreview;
	}
	
	//TeamRecord
	public Team getTeamCrawlingInfo(Team team) {
		
		/*String WEB_DRIVER_ID = "webdriver.chrome.driver";
		String WEB_DRIVER_PATH = "src/main/resources/chromedriver_win32/chromedriver.exe";
		
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
		
		ChromeOptions ops = new ChromeOptions();
		ops.setCapability("ignoreProtectedModeSettings", true);
		ops.addArguments("--remote-allow-origins=*");
		ops.addArguments("headless");
		ops.addArguments("--no-sandbox");
		ops.addArguments("--disable-dev-shm-usage");
		ops.addArguments("ignore-certificate-errors");
		
		WebDriver driver = new ChromeDriver(ops);*/
		WebDriver driver = null;
		try{
			driver = chromeDriverPool.acquireWebDriver();
		driver.get("https://sports.news.naver.com/kbaseball/record/index?category=kbo");
		
		WebElement teamRanking = driver.findElement(By.xpath("//*[@id=\"regularTeamRecordList_table\"]"));
		for(WebElement teamInfo : teamRanking.findElements(By.cssSelector("tr"))) {
			if(teamInfo.findElement(By.cssSelector("td.tm")).getText().equals(team.getTeamNickName())) {
				String[] splitInfo = teamInfo.getText().split("[\n]");
				team.setTeamRanking(splitInfo[0]);
				String[] splitDetailInfo = splitInfo[2].split("[ ]");
				team.setEndGameCount(Integer.parseInt(splitDetailInfo[0]));
				team.setWinCount(Integer.parseInt(splitDetailInfo[1]));
				team.setLoseCount(Integer.parseInt(splitDetailInfo[2]));
				team.setTieCount(Integer.parseInt(splitDetailInfo[3]));
				team.setWinRate(splitDetailInfo[4]);
				team.setLastTenMatch(splitDetailInfo[9]);
			}
		}
		}catch(Exception e) {
			System.out.println(e);
		} finally {
			if(driver != null) {
				chromeDriverPool.releaseWebDriver(driver);
			}
		}
		return team;
	}
	
	//GameLineUp
	public Map<String, List<Player>> getGameCrawlingLineup(Game game) throws Exception{
		
		List<Player> awayPlayer = new ArrayList<>();
		List<Player> homePlayer = new ArrayList<>();
		
		/*String WEB_DRIVER_ID = "webdriver.chrome.driver";
		String WEB_DRIVER_PATH = "src/main/resources/chromedriver_win32/chromedriver.exe";
		
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
		
		ChromeOptions ops = new ChromeOptions();
		ops.setCapability("ignoreProtectedModeSettings", true);
		ops.addArguments("--remote-allow-origins=*");
		ops.addArguments("headless");
		ops.addArguments("--no-sandbox");
		ops.addArguments("--disable-dev-shm-usage");
		ops.addArguments("ignore-certificate-errors");
		
		WebDriver driver = new ChromeDriver(ops);*/
		WebDriver driver = null;
		Map<String, List<Player>> map = new HashMap<>();
		try{
			driver = chromeDriverPool.acquireWebDriver();
		String base_url = "https://m.sports.naver.com/game/"+game.getGameCode()+"/lineup";
		driver.get(base_url);
		Thread.sleep(300);
		
		WebElement awayPlayerUl = driver.findElements(By.cssSelector(".Lineup_lineup_area__2aNOv")).get(0);
		for(WebElement awayPlayerLi : awayPlayerUl.findElements(By.cssSelector(".Lineup_lineup_item__32s4M"))) {
			Player playerTmp = new Player();
			playerTmp.setPlayerImage(awayPlayerLi.findElement(By.cssSelector(".Lineup_image__1uP9b img")).getAttribute("src").split("[?]")[0]);
			playerTmp.setPlayerName(awayPlayerLi.findElement(By.cssSelector(".Lineup_name__jV19m")).getText());
			playerTmp.setPlayerPosition(awayPlayerLi.findElement(By.cssSelector(".Lineup_position__265hb")).getText());
			awayPlayer.add(playerTmp);
		}
		
		WebElement homePlayerUl = driver.findElements(By.cssSelector(".Lineup_lineup_area__2aNOv")).get(1);
		for(WebElement homePlayerLi : homePlayerUl.findElements(By.cssSelector(".Lineup_lineup_item__32s4M"))) {
			Player playerTmp = new Player();
			playerTmp.setPlayerImage(homePlayerLi.findElement(By.cssSelector(".Lineup_image__1uP9b img")).getAttribute("src").split("[?]")[0]);
			playerTmp.setPlayerName(homePlayerLi.findElement(By.cssSelector(".Lineup_name__jV19m")).getText());
			playerTmp.setPlayerPosition(homePlayerLi.findElement(By.cssSelector(".Lineup_position__265hb")).getText());
			homePlayer.add(playerTmp);
		}
		
		
		map.put("homePlayerList", homePlayer);
		map.put("awayPlayerList", awayPlayer);
		}catch(Exception e) {
			System.out.println(e);
		} finally {
			if(driver != null) {
				chromeDriverPool.releaseWebDriver(driver);
			}
		}
		return map;
	}

}
