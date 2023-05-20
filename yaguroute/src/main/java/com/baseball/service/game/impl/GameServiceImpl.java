package com.baseball.service.game.impl;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.baseball.common.domain.Team;
import com.baseball.service.domain.Game;
import com.baseball.service.game.GameDao;
import com.baseball.service.game.GameService;

@Service("gameServiceImpl")
public class GameServiceImpl implements GameService {

	public GameServiceImpl() {
		// TODO Auto-generated constructor stub
	}
	
	@Autowired
	@Qualifier("gameDao")
	private GameDao gameDao;
	
	public Team getTeamInfoByTeamName(String teamName) {
		
		return gameDao.getTeamInfoByTeamName(teamName);
	}
	
	public void addThisYearGameSchedule(Game game) {
		gameDao.addThisYearGameSchedule(game);
	}
	
	public Game getGameInfo(String gameCode) {
		return gameDao.getGameInfo(gameCode);
	}
	
	public void updateGameState(Game game) {
		gameDao.updateGameState(game);
	}
	
	public List<Game> getGameScheduleList(String date,String teamCode){
		return gameDao.getGameScheduleList(date,teamCode);
	}

}
