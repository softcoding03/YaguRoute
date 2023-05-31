package com.baseball.service.game;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.baseball.common.domain.Team;
import com.baseball.service.domain.Game;

@Mapper
public interface GameDao {

	public Team getTeamInfoByTeamName(String teamName);
	
	public Team getTeamInfo(String teamCode);
	
	public List<Team> getAllTeam();
	
	public Game getGameInfo(String gameCode);
	
	public List<Game> getGameListByDate(String date);
	
	public void updateGameState(Game game);
	
	public List<Game> getGameListByMonthly(String date, String teamCode); 
	
	public void addGame(Game game);
	
	public List<Game> getGameListTwoWeeks(String teamCode);
	
	public void updateGamePredAllocation(Game game);
	
	public void updatevideoThumbNail(Game game);

}
