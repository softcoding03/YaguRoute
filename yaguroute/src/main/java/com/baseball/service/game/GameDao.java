package com.baseball.service.game;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.baseball.common.domain.Team;
import com.baseball.service.domain.Game;

@Mapper
public interface GameDao {

	public Team getTeamInfoByTeamName(String teamName);
	
	public void addThisYearGameSchedule(Game game);
	
	public Game getGameInfo(String gameCode);
	
	public void updateGameState(Game game);
	
	public List<Game> getGameScheduleList(String date, String teamCode); 

}
