package com.baseball.service.game;

import com.baseball.common.domain.Team;


public interface GameService {
	
	public Team getTeamInfoByTeamName(String teamName);

}
