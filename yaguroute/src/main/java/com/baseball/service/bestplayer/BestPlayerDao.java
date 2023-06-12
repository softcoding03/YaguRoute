package com.baseball.service.bestplayer;

import java.util.List;

import com.baseball.common.domain.Search;
import com.baseball.service.domain.BestPlayer;
import com.baseball.service.domain.Player;

public interface BestPlayerDao {
	
	public void addBestPlayer(BestPlayer bestPlayer) throws Exception;
	
	public List<BestPlayer> getBestPlayerList(Search search) throws Exception;
	/**/
	public int getTotalCount(Search search) throws Exception;
	
	public List<BestPlayer> getBestPlayerByDate() throws Exception;
	
//	public List<Player> getPlayerByBestPlayer(Search search) throws Exception;
	
}
