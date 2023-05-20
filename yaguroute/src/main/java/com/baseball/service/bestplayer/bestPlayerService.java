package com.baseball.service.bestplayer;

import java.util.List;

import com.baseball.service.domain.Player;

public interface bestPlayerService {
		
	public void addBestPlayer(Player player) throws Exception;
	
	public List<Player> getPlayerList(Player player) throws Exception;
	
}
