package com.baseball.service.game.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.baseball.common.domain.Team;
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

}
