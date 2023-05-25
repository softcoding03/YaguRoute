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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.baseball.common.domain.Team;
import com.baseball.service.comment.CommentService;
import com.baseball.service.domain.Game;
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
	
	@GetMapping("gameList")
	public String getGameList(@RequestParam(value = "year", required = false) String year,
			@RequestParam(value = "month", required = false) String month, 
			@RequestParam(value = "teamCode", required = false) String teamCode,
			HttpServletRequest requset) {
		System.out.println(year+month+teamCode);
		String date = "";
		
		if(year==null) {
			year = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy"));
			month = LocalDate.now().format(DateTimeFormatter.ofPattern("MM"));
			teamCode = "NN";
		}
		date = year+"-"+month;
		System.out.println(teamCode);
		List<Team> allTeam = gameService.getAllTeam();
		List<Game> gameList= gameService.getGameListByMonthly(date, teamCode);
		System.out.println(teamCode);
		requset.setAttribute("nowYear", year);
		requset.setAttribute("nowMonth", month);
		requset.setAttribute("teamCode", teamCode);
		requset.setAttribute("gameList", gameList);
		requset.setAttribute("allTeam", allTeam);
		
		return "/game/getGameList.jsp";
	}

}
