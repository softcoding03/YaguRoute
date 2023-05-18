package com.baseball.service.game.impl;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import com.baseball.service.game.GameCrawlingDao;

public class GameCrawlingDaoImpl implements GameCrawlingDao {

	public GameCrawlingDaoImpl() {
		System.out.println(this.getClass().getName());
	}
	
	public void addThisYearGameSchedule() {
		String WEB_DRIVER_ID = "web.driver.chrome.driver";
		String WEB_DRIVER_PATH = "/chromedriver_win32/chromedriver.exe";
		
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
		
		ChromeOptions ops = new ChromeOptions();
		ops.setCapability("ignoreProtectedModeSettings", true);//Driver SetUp ( 셀레니움을 막는 것을 방지 )
		ops.addArguments("--remote-allow-origins=*");
		ops.addArguments("headless");
		ops.addArguments("--no-sandbox");
		ops.addArguments("--disable-dev-shm-usage");
		ops.addArguments("ignore-certificate-errors");
		
		String url = "https://sports.news.naver.com/kbaseball/schedule/index?date=20230518&month=03&year=2023&teamCode=";
		WebDriver driver = new ChromeDriver(ops);
		
	}

}
