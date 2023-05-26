package com.baseball.web.game;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.baseball.common.domain.Team;
import com.baseball.service.comment.CommentService;
import com.baseball.service.domain.Game;
import com.baseball.service.domain.GameRecord;
import com.baseball.service.domain.Pitcher;
import com.baseball.service.game.GameService;

@Controller
@RequestMapping("/game/*")
public class GameController {

	public GameController() {
		System.out.println(this.getClass());
	}
	
	@Autowired
	@Qualifier("gameServiceImpl")
	private GameService gameService;
	
	@GetMapping("getGameList")
	public String getGameList(@RequestParam(value = "year", required = false) String year,@RequestParam(value = "month", required = false) String month
			, @RequestParam(value = "teamCode", required = false) String teamCode,HttpServletRequest requset) {		
		
		String date = "";
		String nowYear = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy"));
		if(year==null) {
			year = nowYear;
			month = LocalDate.now().format(DateTimeFormatter.ofPattern("MM"));
			teamCode = "NN";
		}
		
		date = year+"-"+(month.length()==2?month:"0"+month);
		
		List<Team> allTeam = gameService.getAllTeam();
		List<Game> gameList= gameService.getGameListByMonthly(date, teamCode);
		
		requset.setAttribute("nowYear", year);
		requset.setAttribute("nowMonth", month);
		requset.setAttribute("teamCode", teamCode);
		requset.setAttribute("gameList", gameList);
		requset.setAttribute("allTeam", allTeam);
		
		return "/game/getGameList.jsp";
	}
	
	@GetMapping("getGameRecord")
	public String getGameRecord(@RequestParam("gameCode") String gameCode,HttpServletRequest request) throws Exception{
		Game game = gameService.getGameInfo(gameCode);
		GameRecord gameRecord = gameService.getGameRecord(game);
		for(Pitcher pitcher : gameRecord.getTitlePitcher()) {
			System.out.println(pitcher.getPitcherName()+" => "+pitcher.getTitle()+" => "+pitcher.getPitcherImage());
		}
		
		
		request.setAttribute("gameRecord", gameRecord);
		
		return "/game/getGameRecord.jsp";
	}

}
