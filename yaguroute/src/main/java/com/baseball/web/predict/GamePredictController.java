package com.baseball.web.predict;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.baseball.service.domain.Game;
import com.baseball.service.domain.Predict;
import com.baseball.service.domain.User;
import com.baseball.service.game.GameService;
import com.baseball.service.predict.GamePredictService;
import com.baseball.service.user.UserService;

@Controller
@RequestMapping("/predict/*")
public class GamePredictController {

	public GamePredictController() {
		System.out.println(this.getClass());
	}
	
	@Autowired
	@Qualifier("gamePredictServiceImpl")
	private GamePredictService gamePredictService;
	
	@Autowired
	@Qualifier("gameServiceImpl")
	private GameService gameService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@GetMapping("getUserPredict")
	public String getUserPredict(HttpSession session, @RequestParam(value = "date", required = false) String date,
			HttpServletRequest request) throws Exception {
		
		User user = (User)session.getAttribute("user");
		
		if(date == null) {
			date = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		}
		System.out.println(date);
		
		Map<String, Object> map = gamePredictService.getUserPred(user.getUserId(), date);
		List<Predict> pred = (List<Predict>)map.get("predList");
		List<Game> game = (List<Game>)map.get("gameList");
		
		Date minTimeDate = new Date(9999, 0, 0); 
		for(Game gameTmp : game) {
			String timeString = date+" "+gameTmp.getGameTime()+":00";
			Date time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(timeString);
			if(minTimeDate.compareTo(time)>=0) {
				minTimeDate = time;
			}
		}
		
		String minTimeString = new SimpleDateFormat("HH:mm:ss").format(minTimeDate);
		user = userService.getUser(user.getUserId());
		session.setAttribute("user", user);
		
		
		request.setAttribute("minTimeString", minTimeString.split("[:]"));
		request.setAttribute("predSize", pred.size());
		request.setAttribute("gameSize", game.size());
		request.setAttribute("gameList", game);
		request.setAttribute("predList", pred);
		
		String view = "";
		String otherDay="";
		if(LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")).equals(date)) {
			view = "/game/getUserPredict.jsp";
			otherDay = LocalDate.now().minusDays(1).format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		}else {
			view = "/game/getPrevUserPredict.jsp";
			otherDay = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		}
		
		request.setAttribute("date", date);
		request.setAttribute("otherDay", otherDay);
		return view;
	}
	
	@GetMapping("addUserPredict")
	public String addUserPredict(@ModelAttribute("addPred") Predict addPred) throws Exception {
		
		List<Predict> pred = addPred.getAddPred();
		for(Predict predTmp : pred) {
			System.out.println(predTmp);
		}
		
		gamePredictService.addUserPred(pred);
		
		return "redirect:/predict/getUserPredict";
	}
	
	@GetMapping("deleteUserPredict")
	public String deleteUserPredict(@RequestParam("date") String date, @ModelAttribute("addPred") Predict addPred) throws Exception {
		System.out.println(addPred.getAddPred().get(0).getPredUserId());
		System.out.println(date);
		gamePredictService.deleteUserPred(addPred.getAddPred().get(0).getPredUserId(), date);;
		
		
		return "/predict/getUserPredict";
	}
	
	@Scheduled(cron = "0 55 23 * * ?")
	public void updatePredState() throws Exception {
		String nowDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		//String nowDate = "2023-06-08";
		List<Game> gameList = gameService.getGameListByDate(nowDate);
		boolean state = true;
		for(Game game : gameList) {
			if(game.getGameStatusCode().equals("1") || game.getGameStatusCode().equals("0") ){
				state = false;
			}
		}
		if(state) {
			gamePredictService.updatePredAfterGame();
		}
	}

}
