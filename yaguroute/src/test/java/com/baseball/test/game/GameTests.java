package com.baseball.test.game;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.baseball.common.domain.Team;
import com.baseball.service.domain.Game;
import com.baseball.service.game.GameService;

@SpringBootTest
public class GameTests {

	public GameTests() {
		// TODO Auto-generated constructor stub
	}
	
	@Autowired
	@Qualifier("gameServiceImpl")
	private GameService gameService;
	
	//@Test
	public void getTeamInfoByTeamName() throws Exception{
		String teamName = "두산";
		Team testTeam = gameService.getTeamInfoByTeamName(teamName);
		
		System.out.println(testTeam);
	}
	
	//@Test
	public void getGameInfo() throws Exception{
		
		Game game =  gameService.getGameInfo("20230313HTHH02023");
		System.out.println(game);
	}
	
	@Test
	public void getGameScheduleList() throws Exception{
		
		Map<String,String> map = new HashMap<>();
		String date = "2023-06";
		String teamCode = "OB";
		List<Game> list = gameService.getGameScheduleList(date,teamCode);
		for(Game tmp : list) {
			System.out.println(tmp);
		}
	}
		
	//@Test
	public void updateGameState() throws Exception{
		String date = "2023.5.20";
		Game game = new Game();
		game.setGameStatusCode("0");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
		game.setGameDate(dateFormat.format(dateFormat.parse(date)));
		System.out.println(dateFormat.format(dateFormat.parse(date)));
		gameService.updateGameState(game);
	}
	
	//@Test
	public void addGame() throws Exception{
		Game game = new Game();
		game.setGameCode("20100731SKSS02010");
		
		Team homeTeam = new Team();
		homeTeam.setTeamCode("SS");
		game.setHomeTeam(homeTeam);
		
		Team awayTeam = new Team();
		awayTeam.setTeamCode("SK");
		game.setAwayTeam(awayTeam);
		
		game.setGameDate("7.31");
		game.setGameTime("18:30");
		game.setGameStatusCode("2");
		game.setGameScore("4:8");
		
		gameService.addThisYearGameSchedule(game);
	}
	
	//@Test
	public void addThisYearGameSchedule() throws Exception{
		
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
						game.setAwayTeam(gameService.getTeamInfoByTeamName(teamName));
						
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
						game.setHomeTeam(gameService.getTeamInfoByTeamName(teamName));
						game.setGameScore(oneGame.findElement(By.cssSelector(".td_score")).getText());
						String gameTmp = strFromat.format(dateFromat.parse(game.getGameDate()))+game.getAwayTeam().getTeamCode()+game.getHomeTeam().getTeamCode()+"0"+(Integer.parseInt(nowYear)<=2015?"":nowYear);
						if(gameService.getGameInfo(gameTmp) != null) {
							continue;
						}else {
							game.setGameCode(gameTmp);
							gameService.addThisYearGameSchedule(game);
						}
						System.out.println(game);
						
					}
				}
			}
		}
		driver.close();
		orderDriver.close();
		
//		List<WebElement> test = new ArrayList<>();
//		for(int i=1; i<=monthDayCount.size();i++) {
//			test.add(driver.findElement(By.xpath("//*[@id=\"calendarWrap\"]/div["+i+"]/table/tbody")));
//			System.out.println(test.get(i-1).getText()+"\n\n");
//		}
		
		
		
		
		
		
		
		
		
	}

}
