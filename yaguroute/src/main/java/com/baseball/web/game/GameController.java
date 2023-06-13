package com.baseball.web.game;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.baseball.common.domain.Team;
import com.baseball.service.comment.CommentService;
import com.baseball.service.domain.Comment;
import com.baseball.service.domain.Game;
import com.baseball.service.domain.GamePreview;
import com.baseball.service.domain.GameRecord;
import com.baseball.service.domain.Pitcher;
import com.baseball.service.game.GameService;
import com.baseball.service.predict.GamePredictService;

@Controller
@RequestMapping("/game/*")
public class GameController {

	@Autowired
	public GameController(TaskScheduler taskScheduler) {
		this.taskScheduler = taskScheduler;
		System.out.println(this.getClass());
	}
	
	private final TaskScheduler taskScheduler;
	
	@Autowired
	@Qualifier("gameServiceImpl")
	private GameService gameService;
	
	@Autowired
	@Qualifier("commentServiceImpl")
	private CommentService commentService;
	
	@Autowired
	@Qualifier("gamePredictServiceImpl")
	private GamePredictService gamePredictService;
	
	@GetMapping("getGameList")
	public String getGameList(@RequestParam(value = "year", required = false) String year,@RequestParam(value = "month", required = false) String month
			, @RequestParam(value = "teamCode", required = false) String teamCode,HttpServletRequest requset) {		
		
		String date = "";
		String nowYear = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy"));
		if(year==null) {
			year = nowYear;
			month = LocalDate.now().format(DateTimeFormatter.ofPattern("MM"));
			teamCode = "ALL";
		}
		
		date = year+"-"+(month.length()==2?month:"0"+month);
		
		LocalDate monthDay = LocalDate.parse(date+"-01");
		System.out.println(monthDay);
		// 해당 월의 첫 번째 날짜 가져오기
        LocalDate firstDayOfMonth = monthDay.with(TemporalAdjusters.firstDayOfMonth());
        
        // 해당 월의 마지막 날짜 가져오기
        LocalDate lastDayOfMonth = monthDay.with(TemporalAdjusters.lastDayOfMonth());
        
        int daysInMonth = lastDayOfMonth.getDayOfMonth();
        
        List<Integer> dayOfWeekList = new ArrayList<>();
        List<String> currentDateList = new ArrayList<>();
        // 각 날짜의 요일 출력
        for (LocalDate currentDate = firstDayOfMonth; !currentDate.isAfter(lastDayOfMonth); currentDate = currentDate.plusDays(1)) {
        	DayOfWeek dayOfWeek = currentDate.getDayOfWeek();//오늘 날짜의 요일
            int dayOfWeekString = dayOfWeek.getValue();//요일 String으로
            String currentDateString = currentDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            dayOfWeekList.add(dayOfWeekString);
            currentDateList.add(currentDateString);
        }
        
        System.out.println(dayOfWeekList);
		
		List<Team> allTeam = gameService.getAllTeam();
		List<Game> gameList= gameService.getGameListByMonthly(date, teamCode);
		
		requset.setAttribute("todayDate", LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
		requset.setAttribute("daysInMonth", daysInMonth);
		requset.setAttribute("dayOfWeekList", dayOfWeekList);
		requset.setAttribute("currentDateList", currentDateList);
		requset.setAttribute("nowYear", year);
		requset.setAttribute("nowMonth", month);
		requset.setAttribute("teamCode", teamCode);
		requset.setAttribute("gameList", gameList);
		requset.setAttribute("gameSize", gameList.size());
		requset.setAttribute("allTeam", allTeam);
		
		return "/game/getGameList.jsp";
	}
	
	@GetMapping("getGameRecord")
	public String getGameRecord(@RequestParam("gameCode") String gameCode,HttpServletRequest request) throws Exception{
		Game game = gameService.getGameInfo(gameCode);
		GameRecord gameRecord = gameService.getGameRecord(game);
		List<Game> todayGame = gameService.getGameListByDate(game.getGameDate());
		
		
		Comment comment = new Comment();
		comment.setGameCode(gameCode);
		Map<String, Object> map = commentService.getCommentList(comment);
		List<Comment> list1 = (List<Comment>)map.get("list1"); //1레이어 댓글
		List<Comment> list2 = (List<Comment>)map.get("list2"); //2레이어 댓글
		
		request.setAttribute("commentList1", list1);
		request.setAttribute("commentList2", list2);
		request.setAttribute("gameRecord", gameRecord);
		request.setAttribute("todayGame", todayGame);
		
		return "/game/getGameRecord.jsp";
	}
	
	@GetMapping("getGamePreview")
	public String getGamePreview(@RequestParam("gameCode") String gameCode,HttpServletRequest request) throws Exception{
		
		Game game = gameService.getGameInfo(gameCode);
		GamePreview gamePreview = gameService.getGamePreview(game);
		List<Game> todayGame = gameService.getGameListByDate(game.getGameDate());
		
		System.out.println(gamePreview);
		
		request.setAttribute("gamePreview", gamePreview);
		request.setAttribute("todayGame", todayGame);
		
		return "/game/getGamePreview.jsp";
	}
	
	@GetMapping("getTeam")
	public String getGameTeam(@RequestParam("teamCode") String teamCode,HttpServletRequest request) throws Exception{
		
		if(teamCode == null) {
			teamCode = "HH";
		}
		List<Team> allTeam = gameService.getAllTeam();
		Team teamInfo = gameService.getTeamInfo(teamCode);
		
		System.out.println(teamCode);
		
		request.setAttribute("teamInfo", teamInfo);
		request.setAttribute("allTeam", allTeam);
		request.setAttribute("teamCode", teamCode);
		
		return "/game/getTeam.jsp";
	}
	
	@Scheduled(cron = "0 1/5 * * * ?")
	public void updateGameState() throws Exception {
		gameService.updateTodayGameSchedule();
	}
	
	@Scheduled(cron = "0 50 23 * * ?")
	public void updateTeamInfo() throws Exception {
		List<Team> teamList = gameService.getAllTeam();
		for(Team team : teamList) {
			gameService.updateTeamInfo(gameService.getTeamInfo(team.getTeamCode()));
		}
	}
//	
//	public void addDynamicTask() {
//		taskScheduler.scheduleTask("0/10 * * * * ?",);
//    }

}
