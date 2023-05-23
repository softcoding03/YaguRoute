package com.baseball.service.game;

import java.util.List;
import java.util.Map;

import com.baseball.common.domain.Team;
import com.baseball.service.domain.Game;


public interface GameService {
	
	public Team getTeamInfoByTeamName(String teamName);
	
	public Team getTeamInfo(String teamCode);
	
	public Game getGameInfo(String gameCode);
	
	public List<Game> getGameListByDate(String date);
	
	public void updateGameState(List<Game> game);
	
	public List<Game> getGameListByMonthly(String date,String teamCode); 
	
	public void addThisYearGameSchedule(Game game);
	
	public List<Game> getGameListTwoWeeks();
	
	public void updateGamePredAllocation(Game game);

}
