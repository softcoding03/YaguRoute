package com.baseball.test.player;

import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.baseball.service.domain.Player;
import com.baseball.service.player.PlayerService;

import junit.framework.Assert;


@SpringBootTest
public class PlayerTests {
	
	@Autowired
	@Qualifier("playerServiceImpl")
	private PlayerService playerService;
	
	//@Test
	public void addPlayer() throws Exception{
		Player player = new Player();
		player.setBattingAvg(2.5);
		player.setEra(3);
		player.setHitter(5);
		player.setHomeRun(8);
		player.setPlayerBirth("19990845");
		player.setPlayerHeight(180);
		player.setPlayerId("12345");
		player.setPlayerImage("C://windows/images/player.png");
		player.setPlayerName("영의지");
		player.setPlayerNumber(7);
		player.setPlayerPosition("외야수");
		player.setPlayerSalary(4000);
		player.setPlayerWeight(78);
		player.setStolenBase(5);
		player.setTeamCode("SK");
		player.setThreeOut(6);
		System.out.println(player);
		playerService.addPlayer(player);
	}
	
	//@Test
	public void testGetPlayer() throws Exception{
		Player player = new Player();
		player = playerService.getPlayer("12345");
		System.out.println(player);
	}
	@Test
	public void addPlayer_with_crawling() throws Exception{
		
		System.setProperty("webdriver.chorme.driver", "/chromedriver_win32/chromedriver.exe");
		WebDriver driver = new ChromeDriver();
		driver.get("https://www.koreabaseball.com/Player/Search.aspx");
		System.out.println("왜 안돌아가");
		ChromeOptions options = new ChromeOptions();
		options.setExperimentalOption("useAutomationExtension", false);
		options.addArguments("disable-infobars");
		options.addArguments("start-maximized");
		options.addArguments("--disable-extensions");
		options.addArguments("--disable-gpu");
		options.addArguments("--disable-dev-shm-usage");
		options.addArguments("--no-sandbox");
		
		Thread.sleep(2000);
		WebElement element1 = driver.findElement(By.id("cphContents_cphContents_cphContents_ddlTeam"));
		element1.click();
		System.out.println("11111111111111111");
		Thread.sleep(2000);
		
		
	}
	
	
}	
