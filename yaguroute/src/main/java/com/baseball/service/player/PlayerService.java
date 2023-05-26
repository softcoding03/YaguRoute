package com.baseball.service.player;

import java.util.Map;

import com.baseball.common.domain.Search;
import com.baseball.service.domain.Player;

public interface PlayerService {

	public void addPlayer(Player player) throws Exception;
	
	public Player getPlayer(String playerId) throws Exception;
	
	public Map<String, Object> getPlayerList(Search search) throws Exception;
	
	public void deletePlayer();
	
	public void dropForeignKey();
	
	public void addForeignKey();
}
