package com.baseball.test.player;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.URL;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.interactions.Actions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.baseball.common.domain.Search;
import com.baseball.service.domain.Player;
import com.baseball.service.domain.User;
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
		
//		playerService.dropForeignKey();
//		playerService.deletePlayer();
//		playerService.addForeignKey();
		
		Player player = new Player(); // 선수 인스턴스 생성
		
		/* 1. 셀레니움 사용 위한 인스턴스 생성하기 */
		String WEB_DRIVER_ID = "webdriver.chrome.driver";
		String WEB_DRIVER_PATH = "C:\\chromeDriver\\chromedriver.exe";
		
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
		
		ChromeOptions ops = new ChromeOptions();
		ops.setCapability("ignoreProtectedModeSettings", true);
		ops.addArguments("--remote-allow-origins=*");
		ops.addArguments("headless");
		ops.addArguments("--no-sandbox");
		ops.addArguments("--disable-dev-shm-usage");
		ops.addArguments("ignore-certificate-errors");
		
		WebDriver driver = new ChromeDriver(ops);
		Actions actions = new Actions(driver);
		driver.get("https://www.koreabaseball.com/Player/Search.aspx"); // 셀레니움 사용할 사이트 입력
		
		/* 3. ---진짜 시작--- [선택박스 창 클릭] */
		Thread.sleep(2000);
		WebElement element1 = driver.findElement(By.id("cphContents_cphContents_cphContents_ddlTeam"));
		element1.click();
		Thread.sleep(2000);
		
	    // 현재 윈도우 핸들 저장
	    String originalWindowHandle = driver.getWindowHandle();
		
		/* 4. Option 갯수 출력하기 */
		for(int k = 2; k <= 11; k++) {
			
			/* 4. 팀 선택 */
			Thread.sleep(2000);
			WebElement option = driver.findElement(By.xpath("//*[@id=\"cphContents_cphContents_cphContents_ddlTeam\"]/option["+k+"]"));
			System.out.println("선택한 팀 : "+option.getText());
			option.click();
			Thread.sleep(2000);
			
			/* 5. 페이지 쪽수 세기*/
			WebElement pageCount = driver.findElement(By.xpath("//*[@id=\"cphContents_cphContents_cphContents_udpRecord\"]/div[2]/div"));
			Thread.sleep(2000);
			String numbers = pageCount.getText();
			double number = (numbers.length()+1)/2;
			int x = (int)Math.ceil(number);
			System.out.println("총 페이지 : "+x+"페이지");
			
			/* 6. 페이지 쪽수 넘기기 */
			for(int j = 1; j <= x; j++) {
			WebElement page = driver.findElement(By.xpath("//*[@id=\"cphContents_cphContents_cphContents_ucPager_btnNo"+j+"\"]"));
			page.click();
			Thread.sleep(2000);
			
			/* 페이지 인원 수 몇 명인지 확인 */
			List<WebElement> test1 = driver.findElements(By.xpath("//*[@id=\"cphContents_cphContents_cphContents_udpRecord\"]/div[2]/table/tbody/tr"));
			int playerList = test1.size();
			System.out.println("현재 페이지 인원수 : "+playerList+"명");
			
			for(int i = 1; i <= playerList; i++) { // 선수 몇 명인지 나타냄.

			/* 5. 선수 선택 */		
			System.out.println("선수를 클릭합니다.");
			WebElement playerSc = driver.findElement(By.xpath("//*[@id=\"cphContents_cphContents_cphContents_udpRecord\"]/div[2]/table/tbody/tr["+i+"]/td[2]/a"));
			actions.keyDown(Keys.CONTROL).click(playerSc).keyUp(Keys.CONTROL).perform();
			Thread.sleep(2000); 
			
		        // 새로운 윈도우 핸들 탐색
		        for (String windowHandle : driver.getWindowHandles()) {
		        		
		            if (!windowHandle.equals(originalWindowHandle)) {
		                driver.switchTo().window(windowHandle);
		                
		             // playerId(선수 아이디) 구하기
		                String id = driver.getCurrentUrl();
		                Pattern pattern = Pattern.compile("playerId=(\\d+)");
						Matcher matcher = pattern.matcher(id);
						String playerIdSearch = "";
						if (matcher.find()) {
						    playerIdSearch = matcher.group(1);
						    System.out.println(playerIdSearch); // 출력 결과 예시 : playerId = "50705"
						}
						
						/// 00000. ---선수 아이디 집어넣을 데이터 삽입---
						
						/* 새 창에서 선수의 링크에 Futures가 포함되어있는지 확인하기 */
						if(id.contains("Futures")) {
							
			                /* ★★★ 새 창에서 선수 정보 저장하기 ★★★ */
							Thread.sleep(2000); 
							
							/// 0. 구단 코드
							WebElement teamCode1 = driver.findElement(By.xpath("//*[@id=\"h4Team\"]"));
							String teamCode = teamCode1.getText().split(" ")[0].trim();
							String teamCoding = "";
							
							if (teamCode.equals("LG")) teamCoding = "LG";
							else if (teamCode.equals("SSG")) teamCoding = "SS";
							else if (teamCode.equals("롯데")) teamCoding = "LT";
							else if (teamCode.equals("두산")) teamCoding = "OB";
							else if (teamCode.equals("NC")) teamCoding = "NC";
							else if (teamCode.equals("KIA")) teamCoding = "HT";
							else if (teamCode.equals("삼성")) teamCoding = "SS";
							else if (teamCode.equals("키움") || teamCode.equals("고양")) teamCoding = "WO";
							else if (teamCode.equals("한화")) teamCoding = "HH";
							else if (teamCode.equals("KT")) teamCoding = "KT";
							
							System.out.println("0. 구단 코드 : "+teamCoding);
							
							player.setTeamCode(teamCoding);
							
							/// 1. 선수 아이디
							String playerId = playerIdSearch; // playerId를 String에서 int로 변환
							System.out.println("1. 선수 아이디 : "+playerId);
							player.setPlayerId(playerId);
							/// 2. 선수 이름
			                WebElement playerName = driver.findElement(By.id("cphContents_cphContents_cphContents_ucPlayerProfile_lblName"));
			    			System.out.println("2. 선수 이름 : "+playerName.getText());
			    			player.setPlayerName(playerName.getText().trim());
							/// 3. 선수 등번호
			    			WebElement playerNumber = driver.findElement(By.id("cphContents_cphContents_cphContents_ucPlayerProfile_lblBackNo"));
			    			System.out.println("3. 선수 등번호 : "+playerNumber.getText());
			    			
			    			// 선수 등번호가 없을 경우를 대비한 로직
			    			String Numbering = playerNumber.getText();
							Integer playerNumbering;
							
							if(Numbering == "" || Numbering == null || Numbering == " ") {
								playerNumbering = 0;
								player.setPlayerNumber(playerNumbering);
							}
							else {
								playerNumbering = Integer.parseInt(Numbering);
								player.setPlayerNumber(playerNumbering);
							}
							
			    			/// 4. 선수 포지션
			    			WebElement playerPosition = driver.findElement(By.id("cphContents_cphContents_cphContents_ucPlayerProfile_lblPosition"));
			    			String playerPositioning = playerPosition.getText().split("\\s*\\(.*")[0].trim();
			    			System.out.println("4. 선수 포지션 : "+playerPositioning);
			    			player.setPlayerPosition(playerPositioning);
			    			/// 5. 선수 생년월일[숫자만 추출하여 만든다.]
			    			WebElement playerBirth = driver.findElement(By.id("cphContents_cphContents_cphContents_ucPlayerProfile_lblBirthday"));
			    			String date = playerBirth.getText().replaceAll("[^0-9]","").trim();
			    			System.out.println("5. 선수 생년월일 : "+date);
			    			player.setPlayerBirth(date);
			    			/// 6. 선수 연봉
			    			int playerSalaring = 0;
			    			WebElement playerSalary = driver.findElement(By.id("cphContents_cphContents_cphContents_ucPlayerProfile_lblSalary"));
			   
			    			if(playerSalary.getText().contains("-") || playerSalary.getText().contains(" ") || playerSalary.getText().isEmpty()) {
								playerSalaring = 0; 
								System.out.println("선수가 돈이 없습니다.");
								System.out.println("6. 선수 연봉 : "+playerSalaring);
								player.setPlayerSalary(playerSalaring);
							}
			    			
							else if(playerSalary.getText().contains("달러")){
								System.out.println("달러 니거..");
								playerSalaring = ((Integer.parseInt(playerSalary.getText().replaceAll("[^\\d-]+", ""))*1323)/1000);
								System.out.println("6. 선수 연봉 : "+playerSalaring);
			    				player.setPlayerSalary(playerSalaring);
							}
			    			
							else {
								System.out.println("간코쿠진 데스");
								playerSalaring = Integer.parseInt(playerSalary.getText().replaceAll("[^\\d-]+", ""));
			    				System.out.println("6. 선수 연봉 : "+playerSalaring);
				    			player.setPlayerSalary(playerSalaring);
							}
			    			
			    			/// 7. 선수 신장
			    			WebElement playerHeight = driver.findElement(By.id("cphContents_cphContents_cphContents_ucPlayerProfile_lblHeightWeight"));
			    			int playerHeighting = Integer.parseInt(playerHeight.getText().split("cm/")[0].trim());
			    			System.out.println("7. 선수 신장 : "+playerHeighting);
			    			player.setPlayerHeight(playerHeighting);
			    			/// 8. 선수 몸무게
			    			WebElement playerWeight = driver.findElement(By.id("cphContents_cphContents_cphContents_ucPlayerProfile_lblHeightWeight"));
			    			String parsingweight = playerWeight.getText().split("/")[1].trim();
			    			int playerWeighting = Integer.parseInt(parsingweight.split("kg")[0].trim());
			    			System.out.println("8. 선수 몸무게 : "+playerWeighting);
			    			player.setPlayerWeight(playerWeighting);
			    			// 9. 선수 이미지 
			    			String playerImage = "https://lgcxydabfbch3774324.cdn.ntruss.com/KBO_IMAGE/person/middle/2023/"+playerId+".jpg";
			    			
			    			URL url = null;
			    			InputStream in = null;
			    			FileOutputStream out = null;
			    			String playerPath = null;
			    			
			    			try {
			    				
			    				url = new URL(playerImage);
			    				in = url.openStream();
			    			
				    			playerPath = "C:/images/"+playerId+".png";	
				    			out = new FileOutputStream(playerPath);
				    			
			    			while (true) {
			                    // 루프를 돌면서 이미지데이터를 읽어들이게 됩니다.
			                    int data = in.read();

			                    // 데이터값이 -1이면 루프를 종료하고 나오게 됩니다.
			                    if (data == -1) {
			                        break;
			                    }

			                    // 읽어들인 이미지 데이터값을 컴퓨터 또는 서버공간에 저장하게 됩니다.
			                    out.write(data);
			                }
			    			
			    			in.close();
			    			out.close();
			    			
			    			}catch (Exception e) {
								// TODO: handle exception
			    				e.printStackTrace();
			    				playerPath = "‪C:/images/NA.png";
							}finally {
					            // 만일 에러가 발생해서 클로즈가 안됐을 가능성이 있기에
					            // NULL값을 체크후 클로즈 처리를 합니다.
					            if (in != null) {
					                in.close();
					            }
					            if (out != null) {
					                out.close();
					            }
					        } // end of finally
			    			player.setPlayerImage(playerPath);
			    			System.out.println("9. 선수 이미지 경로 : "+playerPath);
			    			
			    			/// 111111. ---선수이름 집어넣을 데이터 삽입---
			    			/// 222222. ---선수 등번호 집어넣을 데이터 삽입--- (등번호 없는 선수는... 데이터 가져와서 등번호에 0~9의 값이 존재하지 않으면 그냥 0으로 하기)
			    			/// 333333. ---구단코드 집어넣을 데이터 삽입--- (구단코드는 모두 표준화하기 한화 -> HH)
			    			/// 444444. ---선수 포지션 집어넣을 데이터 삽입--- (선수 포지션은 "내야수(우투우타)" 에서 "(" 전까지 자르기)
			    			/// 555555. ---선수 생년월일 집어넣을 데이터 삽입--- ( 선수 생년월일은 "19990814" 형태로 저장하기)
			    			/// 666666. ---선수 몸무게 집어넣을 데이터 삽입--- (신장과 몸무게가 같이 있으므로... split써서 사용하기)
			    			/// 777777. ---선수 신장 집어넣을 데이터 삽입--- (얘도 위와 같음)
			    			/// 888888. ---선수 연봉 집어넣을 데이터 삽입---
			    			/// 999999. ---선수 이미지 집어넣을 데이터 삽입---
			    			
			    			/* 선수 기록 크롤링 ... 만약 타자라면?... 1 : [타자클릭하기] */
			    			WebElement isTaza = driver.findElement(By.xpath("//*[@id=\"cphContents_cphContents_cphContents_ucPlayerProfile_lblPosition\"]"));
			    			if (isTaza.getText().contains("내야수") || isTaza.getText().contains("외야수") || isTaza.getText().contains("포수")) {
				    			
				    			/// ---ERA(평균자책점)그냥 값 0으로 입력하기---
			    				
			    				player.setEra(0);
			    				
				                WebElement tazaClick = driver.findElement(By.xpath("//*[@id=\"contents\"]/div/div[1]/div[2]/ul/li[1]/a"));
				                tazaClick.click(); // 타자 클릭! 
				                System.out.println("타자 클릭완료");
				                Thread.sleep(2000);
				                
				    			/* Futures에 있는 선수 정보에서 기록이 없는 선수일 때... */
				    			WebElement emptyInfo = driver.findElement(By.xpath("//*[@id=\"contents\"]/div/div[2]/div[2]/table/tbody/tr/td"));
				    			if(emptyInfo.getText().contains("기록이")) {
				    				
				    				System.out.println("타자의 데이터가 존재하지 않는다.");
				    				
				    				player.setBattingAvg(0);
				    				player.setHitter(0);
				    				player.setHomeRun(0);
				    				player.setStolenBase(0);
				    				player.setThreeOut(0);
				    				
				    				/// ---BAVF(타율)---
				    				/// ---H(안타)---
				    				/// ---HR(홈런)---
				    				/// ---SB(도루)---
				    				/// ---THREEOUT(삼진아웃)---
				    				/// 모두 0값 입력!!!
				    				
				    				playerService.addPlayer(player);
				    				
				    			}
				    			
				    			else {
				    				
				    				System.out.println("타자의 데이터가 존재한다.");
				    				/// 1. 타율(BAVF)
				    				float battingAvg = 0;
				    				WebElement bavf = driver.findElement(By.xpath("//*[@id=\"contents\"]/div/div[2]/div[2]/table/tbody/tr/td[2]"));
				    				System.out.println("11. 타율 : "+bavf.getText());
				    				if(bavf.getText().contains("-")) {
				    					battingAvg = 0;
				    					player.setBattingAvg(battingAvg);
				    				}
				    				else {
				    					battingAvg = Float.parseFloat(bavf.getText());
					    				player.setBattingAvg(battingAvg);
				    				}
				    				/// 2. 안타(H)
				    				WebElement hit = driver.findElement(By.xpath("//*[@id=\"contents\"]/div/div[2]/div[2]/table/tbody/tr/td[6]"));
				    				System.out.println("12. 안타 : "+hit.getText());
				    				int hitter = Integer.parseInt(hit.getText());
				    				player.setHitter(hitter);
				    				/// 3. 홈런(HR)
				    				WebElement homerun = driver.findElement(By.xpath("//*[@id=\"contents\"]/div/div[2]/div[2]/table/tbody/tr/td[9]"));
				    				System.out.println("13. 홈런 : "+homerun.getText());
				    				int hr = Integer.parseInt(homerun.getText());
				    				player.setHomeRun(hr);
				    				/// 4. 도루(SB)
				    				WebElement stolenBase = driver.findElement(By.xpath("//*[@id=\"contents\"]/div/div[2]/div[2]/table/tbody/tr/td[11]"));
				    				System.out.println("14. 도루 : "+stolenBase.getText());
				    				int sb = Integer.parseInt(stolenBase.getText());
				    				player.setStolenBase(sb);
				    				/// 5. 삼진(THREEOUT)
				    				WebElement threeout = driver.findElement(By.xpath("//*[@id=\"contents\"]/div/div[2]/div[2]/table/tbody/tr/td[14]"));
				    				System.out.println("15. 삼진아웃 : "+threeout.getText());
				    				int tr = Integer.parseInt(threeout.getText());
				    				player.setThreeOut(tr);
				    				
				    				/// ---BAVF(타율)---
				    				/// ---H(안타)---
				    				/// ---HR(홈런)---
				    				/// ---SB(도루)---
				    				/// ---THREEOUT(삼진아웃)---
				    				/// 데이터 입력하기 
				    				
				    				playerService.addPlayer(player);
				    				
				    			}// end of else[기록이 있는지 없는지 구별]
				    			
			    			}else { // 정확하게는 투수 일 때...
			    				WebElement toosooClick = driver.findElement(By.xpath("//*[@id=\"contents\"]/div/div[1]/div[2]/ul/li[2]/a"));
			    				toosooClick.click();
			    				
			    				player.setBattingAvg(0);
			    				player.setHitter(0);
			    				player.setHomeRun(0);
			    				player.setStolenBase(0);
			    				
			    				/// ---BAVF(타율)---
			    				/// ---H(안타)---
			    				/// ---HR(홈런)---
			    				/// ---SB(도루)---
			    				// 위 데이터 모두 0 입력하기
			    				
			    				WebElement emptyInfo = driver.findElement(By.xpath("//*[@id=\"contents\"]/div/div[2]/div[2]/table/tbody/tr/td"));
			    				if(emptyInfo.getText().contains("기록이")) {
			    					
			    					player.setThreeOut(0);
			    					player.setEra(0);
			    					
			    					/// ---THREEOUT(삼진아웃)---
			    					/// ---ERA(평균자책점)---
			    					// 위 데이터 모두 0 입력하기
			    					playerService.addPlayer(player);
			    					
			    				}
			    				else { // 데이터가 존재할 때...
			    					
			    					/// 1. 삼진아웃
			    					Thread.sleep(1000);
			    					WebElement threeout = driver.findElement(By.xpath("//*[@id=\"contents\"]/div/div[2]/div[2]/table/tbody/tr/td[14]"));
			    					System.out.println("삼진 아웃 : "+threeout.getText());
			    					int tr = Integer.parseInt(threeout.getText());
			    					player.setThreeOut(tr);
			    					
			    					/// 2. 평균자책점
			    					WebElement era = driver.findElement(By.xpath("//*[@id=\"contents\"]/div/div[2]/div[2]/table/tbody/tr/td[2]"));
			    					System.out.println("평균 자책점 : " + era.getText());
			    					float eraa;
			    					if(era.getText() == "-") {
			    						eraa = 0;
			    						player.setEra(eraa);
			    					}
			    					else {
			    					eraa = Float.parseFloat(era.getText());
			    					player.setEra(eraa);
			    					
			    					}
			    					
			    					playerService.addPlayer(player);
			    					
			    					/// ---THREEOUT(삼진아웃)---
			    					/// ---ERA(평균자책점)---
			    					
			    				}// end of else[데이터 기록이 존재 할 때...]
			    			}// end of else[타자인지 투수인지 구별]
			    			
							}// Record..
						else {
								Thread.sleep(2000);
								/// 0. 선수 구단코드
								WebElement teamCode1 = driver.findElement(By.xpath("//*[@id=\"h4Team\"]"));
								String teamCode = teamCode1.getText().split(" ")[0].trim();
								String teamCoding = "";
								
								if (teamCode.equals("LG")) teamCoding = "LG";
								else if (teamCode.equals("SSG")) teamCoding = "SS";
								else if (teamCode.equals("롯데")) teamCoding = "LT";
								else if (teamCode.equals("두산")) teamCoding = "OB";
								else if (teamCode.equals("NC")) teamCoding = "NC";
								else if (teamCode.equals("KIA")) teamCoding = "HT";
								else if (teamCode.equals("삼성")) teamCoding = "SS";
								else if (teamCode.equals("키움")) teamCoding = "WO";
								else if (teamCode.equals("한화")) teamCoding = "HH";
								else if (teamCode.equals("KT")) teamCoding = "KT";
								
								System.out.println("0. 구단코드 : " + teamCoding);
								
								/// 1. 선수 아이디
								String playerId = playerIdSearch; // playerId를 String에서 int로 변환
								System.out.println("1. 선수 아이디 : "+playerId);
								player.setPlayerId(playerId);
								/// 2. 선수 이름
								WebElement playerName = driver.findElement(By.xpath("//*[@id=\"cphContents_cphContents_cphContents_playerProfile_lblName\"]"));
								System.out.println("2. 선수 이름 : "+playerName.getText());
								player.setPlayerName(playerName.getText());
								/// 3. 선수 등번호
								WebElement playerNumber = driver.findElement(By.xpath("/html/body/form/div[3]/section/div/div/div[2]/div[1]/div[1]/ul/li[2]/span"));
								System.out.println("3. 선수 등번호 : "+playerNumber.getText());
								String Numbering = playerNumber.getText();
								Integer playerNumbering;
								
								if(Numbering == "" || Numbering == null) {
									playerNumbering = 0;
									System.out.println("선수 등번호가 없습니다."+playerNumbering);
									player.setPlayerNumber(playerNumbering);
								}
								else {
									playerNumbering = Integer.parseInt(Numbering);
									System.out.println("선수 등번호가 있습니다. "+playerNumbering);
									player.setPlayerNumber(playerNumbering);
								}
								
								/// 4. 선수 포지션
								WebElement playerPosition = driver.findElement(By.xpath("//*[@id=\"cphContents_cphContents_cphContents_playerProfile_lblPosition\"]"));
								String playerPositioning = playerPosition.getText().split("\\s*\\(.*")[0].trim();
				    			System.out.println("4. 선수 포지션 : "+playerPositioning);
				    			player.setPlayerPosition(playerPositioning);
				    			
								/// 5. 선수 생년월일
								WebElement playerBirth = driver.findElement(By.xpath("//*[@id=\"cphContents_cphContents_cphContents_playerProfile_lblBirthday\"]"));
								String date = playerBirth.getText().replaceAll("[^0-9]","").trim();
				    			System.out.println("5. 선수 생년월일 : "+date);
				    			player.setPlayerBirth(date);
								/// 6. 선수 연봉
				    			int playerSalaring = 0;
								WebElement playerSalary = driver.findElement(By.xpath("//*[@id=\"cphContents_cphContents_cphContents_playerProfile_lblSalary\"]"));
								
								if(playerSalary.getText().contains("-") || playerSalary.getText().contains(" ") || playerSalary.getText().isEmpty()) {
									playerSalaring = 0; 
									System.out.println("6. 선수 연봉 : "+playerSalaring);
									player.setPlayerSalary(playerSalaring);
								}
								else if(playerSalary.getText().contains("달러")){
									playerSalaring = ((Integer.parseInt(playerSalary.getText().replaceAll("[^\\d-]+", ""))*1323)/1000);
									System.out.println("6. 선수 연봉 : "+playerSalaring);
				    				player.setPlayerSalary(playerSalaring);
								}
								else {
									playerSalaring = Integer.parseInt(playerSalary.getText().replaceAll("[^\\d-]+", ""));
				    				System.out.println("6. 선수 연봉 : "+playerSalaring);
					    			player.setPlayerSalary(playerSalaring);
								}
								/// 7. 선수 신장
								WebElement playerHeight = driver.findElement(By.xpath("//*[@id=\"cphContents_cphContents_cphContents_playerProfile_lblHeightWeight\"]"));
								int playerHeighting = Integer.parseInt(playerHeight.getText().split("cm/")[0].trim());
				    			System.out.println("7. 선수 신장 : "+playerHeighting);
				    			player.setPlayerHeight(playerHeighting);
								/// 8. 선수 몸무게
								WebElement playerWeight = driver.findElement(By.xpath("//*[@id=\"cphContents_cphContents_cphContents_playerProfile_lblHeightWeight\"]"));
								String parsingweight = playerWeight.getText().split("/")[1].trim();
				    			int playerWeighting = Integer.parseInt(parsingweight.split("kg")[0].trim());
				    			System.out.println("8. 선수 몸무게 : "+playerWeighting);
				    			player.setPlayerWeight(playerWeighting);
								/// 9. 선수 이미지
				    			String playerImage = "https://lgcxydabfbch3774324.cdn.ntruss.com/KBO_IMAGE/person/middle/2023/"+playerId+".jpg";
				    			
				    			URL url = null;
				    			InputStream in = null;
				    			FileOutputStream out = null;
				    			String playerPath = null;
				    			
				    			try {
				    				
				    				url = new URL(playerImage);
				    				in = url.openStream();
				    			
					    			playerPath = "C:/images/"+playerId+".png";	
					    			out = new FileOutputStream(playerPath);
					    			
				    			while (true) {
				                    // 루프를 돌면서 이미지데이터를 읽어들이게 됩니다.
				                    int data = in.read();

				                    // 데이터값이 -1이면 루프를 종료하고 나오게 됩니다.
				                    if (data == -1) {
				                        break;
				                    }

				                    // 읽어들인 이미지 데이터값을 컴퓨터 또는 서버공간에 저장하게 됩니다.
				                    out.write(data);
				                }
				    			
				    			in.close();
				    			out.close();
				    			
				    			}catch (Exception e) {
									// TODO: handle exception
				    				e.printStackTrace();
				    				playerPath = "C:/images/NA.png";
				    				out = new FileOutputStream(playerPath);
								}finally {
						            // 만일 에러가 발생해서 클로즈가 안됐을 가능성이 있기에
						            // NULL값을 체크후 클로즈 처리를 합니다.
						            if (in != null) {
						                in.close();
						            }
						            if (out != null) {
						                out.close();
						            }
						        } // end of finally
				    			player.setPlayerImage(playerPath);
				    			System.out.println("9. 선수 이미지 경로 : "+playerPath);
				    			
//								// 선수의 모든 정보 출력..
//								WebElement playerInfo = driver.findElement(By.xpath("//*[@id=\"contents\"]/div[2]/div[1]/div[1]/ul"));
//								System.out.println(playerInfo.getText());
								
								/// 111111. ---선수이름 집어넣을 데이터 삽입---
				    			/// 222222. ---선수 등번호 집어넣을 데이터 삽입--- (등번호 없는 선수는... 데이터 가져와서 등번호에 0~9의 값이 존재하지 않으면 그냥 0으로 하기)
				    			/// 333333. ---구단코드 집어넣을 데이터 삽입--- (구단코드는 모두 표준화하기 한화 -> HH)
				    			/// 444444. ---선수 포지션 집어넣을 데이터 삽입--- (선수 포지션은 "내야수(우투우타)" 에서 "(" 전까지 자르기)
				    			/// 555555. ---선수 생년월일 집어넣을 데이터 삽입--- ( 선수 생년월일은 "19990814" 형태로 저장하기)
				    			/// 666666. ---선수 몸무게 집어넣을 데이터 삽입--- (신장과 몸무게가 같이 있으므로... split써서 사용하기)
				    			/// 777777. ---선수 신장 집어넣을 데이터 삽입--- (얘도 위와 같음)
				    			/// 888888. ---선수 연봉 집어넣을 데이터 삽입---
				    			/// 999999. ---선수 이미지 집어넣을 데이터 삽입---
								
									WebElement isTaza = driver.findElement(By.xpath("//*[@id=\"cphContents_cphContents_cphContents_playerProfile_lblPosition\"]"));
									if (isTaza.getText().contains("내야수") || isTaza.getText().contains("외야수") || isTaza.getText().contains("포수")) {
										
										/// ---ERA(평균자책점)그냥 값 0으로 입력하기---
										player.setEra(0);
										
										System.out.println("Record[타자 클릭 완료]");
										WebElement tazaClick = driver.findElement(By.xpath("//*[@id=\"contents\"]/div[2]/div[1]/div[2]/ul/li[1]/a"));
										tazaClick.click();
										
										Thread.sleep(1000);
										WebElement emptyInfo = driver.findElement(By.xpath("//*[@id=\"contents\"]/div[2]/div[2]/div[2]/table/tbody/tr/td"));
						    			if(emptyInfo.getText().contains("기록이")) {
						    				System.out.println("타자의 데이터가 존재하지 않는다.");
						    				
						    				player.setBattingAvg(0);
						    				player.setHitter(0);
						    				player.setHomeRun(0);
						    				player.setStolenBase(0);
						    				player.setThreeOut(0);
						    				
						    				/// ---BAVF(타율)---
						    				/// ---H(안타)---
						    				/// ---HR(홈런)---
						    				/// ---SB(도루)---
						    				/// ---THREEOUT(삼진아웃)---
						    				/// 모두 0값 입력!!!
						    				
						    				playerService.addPlayer(player);
						    				
						    			}
						    			else {
						    				
						    				/// 1. 타율(BAVF)
						    				float battingAvg = 0;
						    				WebElement bavf = driver.findElement(By.xpath("//*[@id=\"contents\"]/div[2]/div[2]/div[2]/table/tbody/tr/td[2]"));
						    				System.out.println("11. 타율 : "+bavf.getText());
						    				if(bavf.getText().contains("-")) {
						    					battingAvg = 0;
						    					player.setBattingAvg(battingAvg);
						    				}
						    				else {
						    					battingAvg = Float.parseFloat(bavf.getText());
						    					player.setBattingAvg(battingAvg);
						    				}
						    				/// 2. 안타(H)
						    				WebElement hitter = driver.findElement(By.xpath("//*[@id=\"contents\"]/div[2]/div[2]/div[2]/table/tbody/tr/td[7]"));
						    				System.out.println("12. 안타 : "+hitter.getText());
						    				int hit = Integer.parseInt(hitter.getText());
						    				player.setHitter(hit);
						    				/// 3. 홈런(HR)
						    				WebElement homerun = driver.findElement(By.xpath("//*[@id=\"contents\"]/div[2]/div[2]/div[2]/table/tbody/tr/td[10]"));
						    				System.out.println("13. 홈런 : "+homerun.getText());
						    				int hr = Integer.parseInt(homerun.getText());
						    				player.setHomeRun(hr);
						    				/// 4. 도루(SB)
						    				WebElement stolenBase = driver.findElement(By.xpath("//*[@id=\"contents\"]/div[2]/div[2]/div[2]/table/tbody/tr/td[13]"));
						    				System.out.println("14. 도루 : "+stolenBase.getText());
						    				int sb = Integer.parseInt(stolenBase.getText());
						    				player.setStolenBase(sb);
						    				/// 5. 삼진아웃(THREEOUT)
						    				WebElement threeout = driver.findElement(By.xpath("//*[@id=\"contents\"]/div[2]/div[2]/div[3]/table/tbody/tr/td[4]"));
						    				System.out.println("15. 삼진아웃 : "+threeout.getText());
						    				int to = Integer.parseInt(threeout.getText());
						    				player.setThreeOut(to);
						    				
						    				/// ---BAVF(타율)---
						    				/// ---H(안타)---
						    				/// ---HR(홈런)---
						    				/// ---SB(도루)---
						    				/// ---THREEOUT(삼진아웃)---
						    				/// 데이터 입력하기 
						    				
						    			}// end of else [Record에서 기록이 존재할 때...]
						    			
									}// end of if [Record에서 타자를 클릭했을 때...]
									else { // 투수에 해당?
										System.out.println("Record[투수 클릭 완료]");
										WebElement toosooClick = driver.findElement(By.xpath("//*[@id=\"contents\"]/div[2]/div[1]/div[2]/ul/li[2]/a"));
										toosooClick.click(); // 투수 클릭
										
										player.setBattingAvg(0);
										player.setHitter(0);
										player.setHomeRun(0);
										player.setStolenBase(0);
										
										/// ---BAVF(타율)---
					    				/// ---H(안타)---
					    				/// ---HR(홈런)---
					    				/// ---SB(도루)---
					    				// 위 데이터 모두 0 입력하기
										
					    				WebElement emptyInfo = driver.findElement(By.xpath("//*[@id=\"contents\"]/div/div[2]/div[2]/table/tbody/tr/td"));
					    				if(emptyInfo.getText().contains("기록이")) {
					    					
					    					player.setThreeOut(0);
					    					player.setEra(0);
					    					
					    					/// ---THREEOUT(삼진아웃)---
					    					/// ---ERA(평균자책점)---
					    					// 위 데이터 모두 0 입력하기
					    					
					    					playerService.addPlayer(player);
					    				}// end of if
					    				
					    				else {
					    					
					    					/// 1. 삼진아웃(THREEOUT)
					    					WebElement threeout = driver.findElement(By.xpath("//*[@id=\"contents\"]/div[2]/div[2]/div[3]/table/tbody/tr/td[5]"));
					    					System.out.println("삼진아웃 : "+threeout.getText());
					    					int to = Integer.parseInt(threeout.getText());
					    					player.setThreeOut(to);
					    					/// 2. 평균 자책점(ERA)
					    					WebElement era = driver.findElement(By.xpath("//*[@id=\"contents\"]/div[2]/div[2]/div[2]/table/tbody/tr/td[2]"));
					    					System.out.println("평균 자책점 : "+era.getText());
					    					float eraa;
					    					if(era.getText().contains("-")) {
					    						eraa = 0;
					    						player.setEra(eraa);
					    					}
					    					else {
					    						eraa = Float.parseFloat(era.getText());
					    						player.setEra(eraa);
					    					}
					    					
					    					/// ---THREEOUT(삼진아웃)---
					    					/// ---ERA(평균자책점)---
					    					/// 데이터 입력하기 

					    					playerService.addPlayer(player);
					    					
					    				}// end of else [투수의 기록이 존재 할 때...]
									}// end of else
								}// end of else 정보 위치가 futures에 해당하지 않는다면...
							System.out.println("선수 창이 꺼집니다.");
							driver.close();
			            }// end of if
			        }// end of for
		        	System.out.println("\n새 창에서 기존 창으로 이동합니다.\n");
			        driver.switchTo().window(originalWindowHandle);
				}
			}
		}// end of for
		
	}
	//@Test
	public void testgetPlayerList() throws Exception{
		// searchCondition은 상품명(0)으로 조회할껀지 상품번호(1)로 조회할 것인지... 그 때 사용함.
		
		Search search = new Search(); // search 객체 생성
		
		search.setCurrentPage(1); // 현재 페이지를 1로 세팅
		search.setPageSize(21); // 한 페이지당 보이는 게시물을 3개로 세팅
		Map<String, Object> map = playerService.getPlayerList(search); // K,V형태 저장, search내부는 위 설정한 CurrentPage, pageSize 값만 설정해줌을 확인
		System.out.println("search : "+search);// search에 설정한 현재 페이지와 페이지 사이즈의 값만 설정 확인가능
		System.out.println("getUserList : "+playerService.getPlayerList(search)); // map형태로 데이터가 들어가 있는 것을 확인한다.
		// list = [User....]라고 작성되어있다. 이유는 list는 serviceImpl에서 작성한 put.("list", list) 형태로 들어가 list라는 것에 존재하기 때문,
		// User[]는 User객체안에 데이터가 명시되어있기 때문이다.
		int totalCount = (Integer)map.get("totalCount");
		search.setCurrentPage(1); // 현재 페이지를 1로 set
		search.setPageSize(10); // 현재 페이지의 출력되는 갯수를 10으로 설정, 이보다 더 적든, 많든 설정에 문제가 없다. 
		search.setTeamCondition("0"); // 아직 Condition은 구현을 하지 않아서 임의로 0을 입력한다.
		
		List<Player> playerlist = (List<Player>)map.get("list"); // 문자열이 "호날두"에 해당하는 리스트 안에 존재하는 값들을 가지고 온다.
//		Assert.assertEquals(4, playerlist.size()); // User가 총 4명이므로... 4를 출력한다. 4와 일치하므로.. 오류 X
		System.out.println("playerList : "+playerlist); // 이제 문자열 "호날두"내부에 있는 리스트를 가져와 출력한다. 
		for(Player player:playerlist) {
			System.out.println(player); // 1~4까지 존재하는 UserList를 출력한다.
		}
		System.out.println("playerList[totalCount] : "+totalCount); // totalCount는 전체 회원 수를 출력한다.
		
	}
}	
