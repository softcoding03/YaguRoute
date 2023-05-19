package com.baseball.test.game;

import java.util.ArrayList;
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
import com.baseball.service.game.GameDao;

@SpringBootTest
public class GameTests {

	public GameTests() {
		// TODO Auto-generated constructor stub
	}
	
	@Autowired
	@Qualifier("gamDao")
	GameDao gameDao;
	
	@Test
	public void getTeamInfoByTeamName() {
		String teamName = "두산";
		Team testTeam = gameDao.getTeamInfoByTeamName(teamName);
		
		System.out.println(testTeam);
	}
	
	//@Test
	public void addThisYearGameSchedule() {
		String WEB_DRIVER_ID = "webdriver.chrome.driver";
		String WEB_DRIVER_PATH = "/chromedriver_win32/chromedriver.exe";
		
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
		
		ChromeOptions ops = new ChromeOptions();
		ops.setCapability("ignoreProtectedModeSettings", true);//Driver SetUp ( 셀레니움을 막는 것을 방지 )
		ops.addArguments("--remote-allow-origins=*");
		ops.addArguments("headless");
		ops.addArguments("--no-sandbox");
		ops.addArguments("--disable-dev-shm-usage");
		ops.addArguments("ignore-certificate-errors");
		
		String url = "https://sports.news.naver.com/kbaseball/schedule/index?date=20230518&month=05&year=2023&teamCode=";
		WebDriver driver = new ChromeDriver(ops);
		driver.get(url);
		
		List<WebElement> monthDayCount = driver.findElements(By.cssSelector("#calendarWrap > div:not(.nogame,.nogame2)"));
		
		List<Game> monthGameList = new ArrayList<>();
		for(WebElement dayGame : monthDayCount) {
			
			Game game = new Game();
			
			String date = dayGame.findElement(By.cssSelector(".td_date strong")).getText();
			game.setGameDate(date);
			
			int state = 0;
			for(WebElement oneGame : dayGame.findElements(By.cssSelector("tr"))) {
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
				System.out.println(oneGame.findElement(By.cssSelector(".td_hour")).getText());
				System.out.println(oneGame.findElement(By.cssSelector(".team_lft")).getText().trim());
				System.out.println(oneGame.findElement(By.cssSelector(".td_score")).getText());
				System.out.println(oneGame.findElement(By.cssSelector(".team_rgt")).getText().trim());
				System.out.println(state+"\n");
				
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
