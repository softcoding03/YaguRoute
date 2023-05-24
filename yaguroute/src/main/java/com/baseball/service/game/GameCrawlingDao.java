package com.baseball.service.game;

import java.util.List;
import java.util.Map;

import com.baseball.common.domain.Team;
import com.baseball.service.domain.Game;
import com.baseball.service.domain.GamePreview;
import com.baseball.service.domain.GameRecord;
import com.baseball.service.domain.Player;

public interface GameCrawlingDao {

	public List<Game> getThisYearGameSchedule() throws Exception;
	
	public GameRecord getGameCrawlingRecord(Game game) throws Exception;
	
	public GamePreview getGameCrawlingPreview(Game game) throws Exception;
	
	public Team getTeamCrawlingInfo(Team team);
	
	public List<Game> getTodayGameSchedule() throws Exception;
	
	public Map<String, List<Player>> getGameCrawlingLineup(Game game) throws Exception;
}
