package com.baseball.web.game;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.baseball.service.domain.Game;
import com.baseball.service.domain.GameRecord;
import com.baseball.service.game.GameService;

@RestController
@RequestMapping("/game/json/*")
public class GameRestController {
	
	@Autowired
	@Qualifier("gameServiceImpl")
	private GameService gameService;

	public GameRestController() {
		// TODO Auto-generated constructor stub
	}
	
	@PostMapping("getStreamingInfo/{gameCode}")
	public GameRecord getStreamingInfo(@PathVariable String gameCode) throws Exception {
		
		Game game = gameService.getGameInfo(gameCode);
		GameRecord gameRecord = gameService.getGameRecord(game);
		
		return gameRecord;
	}
	
	@PostMapping("getTodayGameInfo")
	public List<Game> getTodayGameInfo() throws Exception {
		
		List<Game> listGame = gameService.getGameListByDate(LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
		
		
		return listGame;
	}

}
