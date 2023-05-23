package com.baseball.service.game.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.jni.Time;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.baseball.common.domain.Team;
import com.baseball.service.domain.Game;
import com.baseball.service.domain.GamePreview;
import com.baseball.service.domain.GameRecord;
import com.baseball.service.domain.Hitter;
import com.baseball.service.domain.Pitcher;
import com.baseball.service.game.GameCrawlingDao;
import com.baseball.service.game.GameDao;
import com.baseball.service.game.GameService;

@Component
public class GameCrawlingDaoImpl implements GameCrawlingDao {
	
	@Autowired
	@Qualifier("gameDao")
	private GameDao gameDao;

	public GameCrawlingDaoImpl() {
		System.out.println(this.getClass().getName());
	}
	
	//현재 모든 연도 모든 게임 가져오기
	public List<Game> getThisYearGameSchedule() throws Exception {
		
		List<Game> thisYearGameList = new ArrayList<>();
		
		SimpleDateFormat dateFromat = new SimpleDateFormat("yyyy.MM.dd");
		SimpleDateFormat strFromat = new SimpleDateFormat("yyyyMMdd");
		
		String WEB_DRIVER_ID = "webdriver.chrome.driver";
		String WEB_DRIVER_PATH = "/chromedriver_win32/chromedriver.exe";
		
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
		
		ChromeOptions ops = new ChromeOptions();
		ops.setCapability("ignoreProtectedModeSettings", true);
		ops.addArguments("--remote-allow-origins=*");
		ops.addArguments("headless");
		ops.addArguments("--no-sandbox");
		ops.addArguments("--disable-dev-shm-usage");
		ops.addArguments("ignore-certificate-errors");
		
		WebDriver orderDriver = new ChromeDriver(ops);
		WebDriver driver = new ChromeDriver(ops);
		
		orderDriver.get("https://sports.news.naver.com/kbaseball/schedule/index");
		
		orderDriver.findElement(By.xpath("//*[@id=\"_currentYearButton\"]")).click();
		List<WebElement> yearList = orderDriver.findElements(By.cssSelector("#_yearList > li"));
		
		orderDriver.findElement(By.xpath("//*[@id=\"_currentMonthButton\"]")).click();
		List<WebElement> monthList = orderDriver.findElements(By.cssSelector("#_monthList > li"));
		
		for(WebElement year : yearList) {
			for(WebElement mon : monthList) {
				System.out.println(mon.getText()+year.getText()+"");
				
				String url = "https://sports.news.naver.com/kbaseball/schedule/index?date=20230520&month="+mon.getText()+"&year="+year.getText()+"&teamCode=";
				
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
						if(nowYear.equals("2021") && (date.equals("5.8") || date.equals("5.9")) && game.getGameTime().equals("14:00")) {
							continue;
						}
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
							thisYearGameList.add(game);
						}
						System.out.println(game);
						
					}
				}
			}
		}
		driver.close();
		orderDriver.close();
		
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
		
		String WEB_DRIVER_ID = "webdriver.chrome.driver";
		String WEB_DRIVER_PATH = "/chromedriver_win32/chromedriver.exe";
		
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
		
		ChromeOptions ops = new ChromeOptions();
		ops.setCapability("ignoreProtectedModeSettings", true);
		ops.addArguments("--remote-allow-origins=*");
		ops.addArguments("headless");
		ops.addArguments("--no-sandbox");
		ops.addArguments("--disable-dev-shm-usage");
		ops.addArguments("ignore-certificate-errors");
		ops.addArguments("--start-maximized");
		
		String base_url = "https://m.sports.naver.com/game/"+game.getGameCode()+"/record";
		WebDriver driver = new ChromeDriver(ops);
		driver.get(base_url);
		Thread.sleep(900);
		//경기 이닝
		WebElement gameScoreInfo = driver.findElement(By.className("ScoreBox_round__1sOLq"));//스코어보드
		List<WebElement> scoreInnings = gameScoreInfo.findElements(By.cssSelector("thead th"));
		for(int i =1; i<scoreInnings.size();i++) {
			innings.add(scoreInnings.get(i).getText());
		}
		gameRecord.setInnings(innings);
		
		// 경기 스코어
		List<WebElement> homeAwayScore = gameScoreInfo.findElements(By.cssSelector("tbody td"));
		
		for(int i=0; i<homeAwayScore.size()/2;i++) {
			awayScoreList.add(homeAwayScore.get(i).getText());
		}
		for(int i=homeAwayScore.size()/2; i<homeAwayScore.size();i++) {
			homeScoreList.add(homeAwayScore.get(i).getText());
		}
		System.out.println(innings+"\n"+awayScoreList+"\n"+homeScoreList);
		gameRecord.setAwayScoreList(awayScoreList);
		gameRecord.setHomeScoreList(homeScoreList);
		
		//팀 경기 기록 조회
		WebElement gameScoreResultInfo = driver.findElement(By.className("ScoreBox_result__3atD0"));
		
		List<WebElement> homeAwayResultScore = gameScoreResultInfo.findElements(By.cssSelector("tbody td"));
		
		for(int i=0; i<homeAwayResultScore.size()/2;i++) {
			awayRecord.add(homeAwayResultScore.get(i).getText());
		}
		for(int i=homeAwayResultScore.size()/2; i<homeAwayResultScore.size();i++) {
			homeRecord.add(homeAwayResultScore.get(i).getText());
		}
		System.out.println(awayRecord+"\n"+homeRecord);
		gameRecord.setAwayRecord(awayRecord);
		gameRecord.setHomeRecord(homeRecord);
		
		//승리, 세이브 등 타이틀을 가지는 투스
		List<WebElement> indexLi = driver.findElements(By.cssSelector("div.PitcherList_comp_pitcher_list__3XCW2 li.PitcherList_pitcher_area__2By9l"));
		for(WebElement titleIndex :indexLi) {
			Pitcher titlePitcher = new Pitcher();
			titlePitcher.setPitcherImage(titleIndex.findElement(By.tagName("img")).getAttribute("src").split("[?]")[0]);
			String[] titleSplit = titleIndex.getText().split("[\n]");
			titlePitcher.setTitle(titleSplit[0]);
			titlePitcher.setPitcherName(titleSplit[1]);
			titlePitcher.setInnings(titleSplit[2].split("[닝]")[1]);
			titlePitcher.setGetHit(titleSplit[3].split("[타자]")[1]);
			titlePitcher.setMyLostScore(titleSplit[3].split("[책]")[1]);
			titlePitcherList.add(titlePitcher);
		}
		gameRecord.setTitlePitcher(titlePitcherList);
		
		List<WebElement> homeHitterRecord = driver.findElements(By.cssSelector(".PlayerRecord_record_table__19F6_.PlayerRecord_type_batter__1rHnm tbody tr"));
		List<WebElement> homeHitterName = driver.findElements(By.cssSelector(".PlayerRecord_player_list__2-BCl.PlayerRecord_type_batter__1rHnm li .PlayerRecord_name__1W_c0"));
		
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
		
		List<WebElement> homePitcherRecord = driver.findElements(By.cssSelector(".PlayerRecord_record_table__19F6_.PlayerRecord_type_pitcher__1TYaz tbody tr"));
		List<WebElement> homePitcherName = driver.findElements(By.cssSelector(".PlayerRecord_player_list__2-BCl.PlayerRecord_type_pitcher__1TYaz li .PlayerRecord_name__1W_c0"));
		
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
		
		driver.findElement(By.cssSelector(".PlayerRecord_tab__3DKLH[aria-selected=false]")).click();
		
		List<WebElement> awayHitterRecord = driver.findElements(By.cssSelector(".PlayerRecord_record_table__19F6_.PlayerRecord_type_batter__1rHnm tbody tr"));
		List<WebElement> awayHitterName = driver.findElements(By.cssSelector(".PlayerRecord_player_list__2-BCl.PlayerRecord_type_batter__1rHnm li .PlayerRecord_name__1W_c0"));
		
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
		
		List<WebElement> awayPitcherRecord = driver.findElements(By.cssSelector(".PlayerRecord_record_table__19F6_.PlayerRecord_type_pitcher__1TYaz tbody tr"));
		List<WebElement> awayPitcherName = driver.findElements(By.cssSelector(".PlayerRecord_player_list__2-BCl.PlayerRecord_type_pitcher__1TYaz li .PlayerRecord_name__1W_c0"));
		
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
		
		return gameRecord;
	}
	
	//GamePreview
	public GamePreview getGameCrawlingPreview(Game game) {
		
		String WEB_DRIVER_ID = "webdriver.chrome.driver";
		String WEB_DRIVER_PATH = "/chromedriver_win32/chromedriver.exe";
		
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
		
		ChromeOptions ops = new ChromeOptions();
		ops.setCapability("ignoreProtectedModeSettings", true);
		ops.addArguments("--remote-allow-origins=*");
		ops.addArguments("headless");
		ops.addArguments("--no-sandbox");
		ops.addArguments("--disable-dev-shm-usage");
		ops.addArguments("ignore-certificate-errors");
		
		return null;
	}
	//GameRecord
	public Team getTeamCrawlingInfo(Team team) {
		
		String WEB_DRIVER_ID = "webdriver.chrome.driver";
		String WEB_DRIVER_PATH = "/chromedriver_win32/chromedriver.exe";
		
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
		
		ChromeOptions ops = new ChromeOptions();
		ops.setCapability("ignoreProtectedModeSettings", true);
		ops.addArguments("--remote-allow-origins=*");
		ops.addArguments("headless");
		ops.addArguments("--no-sandbox");
		ops.addArguments("--disable-dev-shm-usage");
		ops.addArguments("ignore-certificate-errors");
		
		WebDriver driver = new ChromeDriver(ops);
		
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
		return team;
	}

}
