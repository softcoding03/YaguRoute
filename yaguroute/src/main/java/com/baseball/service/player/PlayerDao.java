package com.baseball.service.player;

import java.util.List;

import com.baseball.service.domain.Player;

public interface PlayerDao {

	public void addPlayer(Player player) throws Exception;
	
	public Player getPlayer(String player) throws Exception;
	
//	public List<Player> getPlayerList(Search search) throws Exception;
	
//	public int getTotalCount(Search search) throws Exception;
	
}
