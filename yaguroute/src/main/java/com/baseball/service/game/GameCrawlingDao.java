package com.baseball.service.game;

import java.util.List;

import com.baseball.common.domain.Team;
import com.baseball.service.domain.Game;
import com.baseball.service.domain.GamePreview;
import com.baseball.service.domain.GameRecord;

public interface GameCrawlingDao {

	public List<Game> getThisYearGameSchedule() throws Exception;
	
	public GameRecord getGameCrawlingRecord(Game game) throws Exception;
	
	public GamePreview getGameCrawlingPreview(Game game);
	
	public Team getTeamCrawlingInfo(Team team);
	
}
