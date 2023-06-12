package com.baseball.test.game;

import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.Calendar;
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
import com.baseball.service.domain.GamePreview;
import com.baseball.service.domain.GameRecord;
import com.baseball.service.domain.Player;
import com.baseball.service.game.GameCrawlingDao;
import com.baseball.service.game.GameService;


@SpringBootTest
public class GameTests {

	public GameTests() {
		// TODO Auto-generated constructor stub
	}
	
	@Autowired
	@Qualifier("gameServiceImpl")
	private GameService gameService;
	
	@Autowired
	@Qualifier("gameCrawlingDaoImpl")
	private GameCrawlingDao gameCrawlingDao;
	
	//@Test
	public void getTeamInfoByTeamName() throws Exception{
		String teamName = "두산";
		Team testTeam = gameService.getTeamInfoByTeamName(teamName);
		
		System.out.println(testTeam);
	}
	
	//@Test
	public void getTodayGame() throws Exception{
		List<Game> game = gameCrawlingDao.getTodayGameSchedule();
		for(Game ga : game) {
			System.out.println(ga);
		}
	}
	
	//@Test
	public void getDate() throws Exception{
		LocalDate date = LocalDate.now();
        
        // 해당 월의 첫 번째 날짜 가져오기
        LocalDate firstDayOfMonth = date.with(TemporalAdjusters.firstDayOfMonth());
        
        // 해당 월의 마지막 날짜 가져오기
        LocalDate lastDayOfMonth = date.with(TemporalAdjusters.lastDayOfMonth());
        
        // 한달의 일수 출력
        int daysInMonth = lastDayOfMonth.getDayOfMonth();
        System.out.println("한달의 일수: " + daysInMonth);
        
        List<String> dayOfWeekList = new ArrayList<String>();
        List<String> currentDateList = new ArrayList<>();
        // 각 날짜의 요일 출력
        for (LocalDate currentDate = firstDayOfMonth; !currentDate.isAfter(lastDayOfMonth); currentDate = currentDate.plusDays(1)) {
        	DayOfWeek dayOfWeek = currentDate.getDayOfWeek();//오늘 날짜의 요일
            String dayOfWeekString = dayOfWeek.toString();//요일 String으로
            String currentDateString = currentDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            dayOfWeekList.add(dayOfWeekString);
            currentDateList.add(currentDateString);
        }
        for(String tmp : dayOfWeekList) {
        	System.out.println(tmp);
        }
        for(String tmp : currentDateList) {
        	System.out.println(tmp);
        }
	}
	

	//@Test
	public void getTeamInfo() throws Exception{
		Team team = gameService.getTeamInfo("SK");
		System.out.println(team);
	}
	
	//@Test
	public void getGameInfo() throws Exception{
		
		Game game =  gameService.getGameInfo("20230313HTHH02023");
		System.out.println(game);
	}
	
	//@Test
	public void getGameScheduleList() throws Exception{
		
		String date = "2023-06";
		String teamCode = "OB";
		List<Game> list = gameService.getGameListByMonthly(date,teamCode);
		for(Game tmp : list) {
			System.out.println(tmp);
		}
	}
		
	//@Test
	public void updateGameState() throws Exception{
		String date = "2008.3.29";
		Game game = new Game();
		List<Game> tmpGame = gameService.getGameListByDate(date);
		for(Game gametmp : tmpGame) {
			gametmp.setGameStatusCode("2");
		}
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
		game.setGameDate(dateFormat.format(dateFormat.parse(date)));
		gameService.updateGameState(tmpGame);
		
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
		
		gameService.addGame(game);
	}
	
	//@Test
	public void getGameRecord() throws Exception{
		Game game = gameService.getGameInfo("20230524NCLT02023");
		GameRecord gameRecord = gameService.getGameRecord(game);
		System.out.println(gameRecord);
	}
	
	//@Test
	public void getGamePreview() throws Exception{
		Game game = gameService.getGameInfo("20230906SSLT02023");
		GamePreview gamepreview = gameService.getGamePreview(game);
		System.out.println(gamepreview);
	}
	
	//@Test
	public void updateTodayGameSchedule() throws Exception{
		gameService.updateTodayGameSchedule();
	}
	
	//@Test
	public void getLineup() throws Exception{
		Game game = gameService.getGameInfo("20230524NCLT02023");
		Map<String, List<Player>> map = gameService.getGameCrawlingLineup(game);
		List<Player> homePlayerList = map.get("homePlayerList");
		List<Player> awayPlayerList =map.get("awayPlayerList");
		for(int i=0;i<awayPlayerList.size();i++) {
			System.out.println("home : "+homePlayerList.get(i));
		}
	}
	
	//@Test
	public void gameControllerTmpTest() {
		Calendar cal = Calendar.getInstance();
		cal.set(2023, 6, 1);//월설정은 부터 시작
		System.out.println(cal.getActualMaximum(Calendar.DAY_OF_MONTH));
	}
	
	//@Test
	public void updateTeamInfo() throws Exception{
		List<Team> teamList = gameService.getAllTeam();
		for(Team team : teamList) {
			System.out.println(team);
			gameService.updateTeamInfo(gameService.getTeamInfo(team.getTeamCode()));
		}
	}
	
	//@Test
	public void addThisYearGame() throws Exception {
		gameCrawlingDao.getThisYearGameSchedule();
		
	}

}
