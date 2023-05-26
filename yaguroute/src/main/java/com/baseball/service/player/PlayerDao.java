package com.baseball.service.player;

import java.util.List;

import org.apache.ibatis.annotations.Update;

import com.baseball.common.domain.Search;
import com.baseball.service.domain.Player;

public interface PlayerDao {

	public void addPlayer(Player player) throws Exception;
	
	public Player getPlayer(String player) throws Exception;
	
	public List<Player> getPlayerList(Search search) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;
	
	public void deletePlayer();
	
	public void dropForeignKey();
	
	public void addForeignKey();
}
