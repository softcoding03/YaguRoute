package com.baseball.common.config;

import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.Semaphore;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.mysql.cj.jdbc.Driver;

@Configuration
public class ChromeDriverConfig {
	
	private final int poolSize = 20; // 풀의 크기를 설정합니다.
	private final Semaphore semaphore = new Semaphore(poolSize);
	private final Queue<WebDriver> availableDrivers = new ConcurrentLinkedQueue<>();

	@Bean(destroyMethod = "destroy")
	public ChromeDriverPool chromeDriverPool() {
		return new ChromeDriverPool();
	}
	
	public class ChromeDriverPool implements DisposableBean{
		private WebDriver tmpDriver;
		
		public WebDriver acquireWebDriver() throws InterruptedException{
			semaphore.acquire();
			WebDriver driver = availableDrivers.poll();
			if(driver == null) {
				driver = createNewWebDriver();
			}
			
			return driver;
		}
		
		public void releaseWebDriver(WebDriver driver) {
			availableDrivers.offer(driver);
			semaphore.release();
		}
		
		private WebDriver createNewWebDriver() {
			String WEB_DRIVER_ID = "webdriver.chrome.driver";
			String WEB_DRIVER_PATH = "src/main/resources/chromedriver_win32/chromedriver.exe";
			String WEB_DRIVER_LINUX_PATH ="/usr/local/tomcat/webapps/ROOT/WEB-INF/classes/chromedriver_linux64/chromedriver";
			
			System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
			ChromeOptions ops = new ChromeOptions();
			ops.setCapability("ignoreProtectedModeSettings", true);
			ops.addArguments("--remote-allow-origins=*");
			ops.addArguments("headless");
			ops.addArguments("--no-sandbox");
			ops.addArguments("--disable-dev-shm-usage");
			ops.addArguments("ignore-certificate-errors");
			return new ChromeDriver(ops);
		}
		
		public void destroy() {
			if(tmpDriver != null) {
				tmpDriver.close();
			}
		}
	}
	

}
