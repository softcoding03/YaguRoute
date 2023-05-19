package com.baseball.test.game;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
	public void addThisYearGameSchedule() throws Exception{
		
		SimpleDateFormat dateFromat = new SimpleDateFormat("yyyy.MM.dd");
		SimpleDateFormat strFromat = new SimpleDateFormat("yyyyMMdd");
		
		String WEB_DRIVER_ID = "webdriver.chrome.driver";
		String WEB_DRIVER_PATH = "/chromedriver_win32/chromedriver.exe";
		
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
		
		ChromeOptions ops = new ChromeOptions();
		ops.setCapability("ignoreProtectedModeSettings", true);//Driver SetUp ( �����Ͽ��� ���� ���� ���� )
		ops.addArguments("--remote-allow-origins=*");
		ops.addArguments("headless");
		ops.addArguments("--no-sandbox");
		ops.addArguments("--disable-dev-shm-usage");
		ops.addArguments("ignore-certificate-errors");
		
		String url = "https://sports.news.naver.com/kbaseball/schedule/index?date=20230519&month=05&year=2015&teamCode=";
		WebDriver driver = new ChromeDriver(ops);
		driver.get(url);
		
		List<WebElement> monthDayCount = driver.findElements(By.cssSelector("#calendarWrap > div:not(.nogame,.nogame2)"));
		String nowYear = driver.findElement(By.xpath("//*[@id=\"_currentYearButton\"]/em")).getText().split("[\n]")[1];
		
		List<Game> monthGameList = new ArrayList<>();
		
		for(WebElement dayGame : monthDayCount) {
			
			String date = dayGame.findElement(By.cssSelector(".td_date strong")).getText();
			
			int state = 0;
			
			for(WebElement oneGame : dayGame.findElements(By.cssSelector("tr"))) {
				
				Game game = new Game();
				
				game.setGameDate(date);
				game.setGameYear(nowYear);
				
				if(oneGame.findElement(By.cssSelector("td:nth-child(2)")).getAttribute("class").contains("add_state") || oneGame.findElement(By.cssSelector("td:nth-child(3)")).getAttribute("class").contains("add_state")) {
					state = 3;
				}else {
					if(oneGame.findElement(By.cssSelector("td a")).getAttribute("href").contains("video")) {
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
				if(oneGame.findElement(By.cssSelector(".team_lft")).getText().trim().equals("넥센") || oneGame.findElement(By.cssSelector(".team_rgt")).getText().trim().equals("넥센")){
					teamName = "키움";
				}else if(oneGame.findElement(By.cssSelector(".team_lft")).getText().trim().equals("SK") || oneGame.findElement(By.cssSelector(".team_rgt")).getText().trim().equals("SK")){
					teamName = "SSG";
				}else {
					teamName = oneGame.findElement(By.cssSelector(".team_lft")).getText().trim();
				}
				game.setAwayTeam(gameService.getTeamInfoByTeamName(teamName));
				
				if(oneGame.findElement(By.cssSelector(".team_rgt")).getText().trim().equals("넥센") || oneGame.findElement(By.cssSelector(".team_rgt")).getText().trim().equals("넥센")){
					teamName = "키움";
				}else if(oneGame.findElement(By.cssSelector(".team_rgt")).getText().trim().equals("SK") || oneGame.findElement(By.cssSelector(".team_rgt")).getText().trim().equals("SK")){
					teamName = "SSG";
				}else {
					teamName = oneGame.findElement(By.cssSelector(".team_rgt")).getText().trim();
				}
				game.setHomeTeam(gameService.getTeamInfoByTeamName(teamName));
				game.setGameScore(oneGame.findElement(By.cssSelector(".td_score")).getText());
				game.setGameCode(strFromat.format(dateFromat.parse(nowYear+"."+game.getGameDate()))+game.getAwayTeam().getTeamCode()+game.getHomeTeam().getTeamCode()+"0"+nowYear);
				System.out.println(game);
			}
		}
		
//		List<WebElement> test = new ArrayList<>();
//		for(int i=1; i<=monthDayCount.size();i++) {
//			test.add(driver.findElement(By.xpath("//*[@id=\"calendarWrap\"]/div["+i+"]/table/tbody")));
//			System.out.println(test.get(i-1).getText()+"\n\n");
//		}
		
		
		
		
		
		
		
		
		driver.quit();
	}

}
