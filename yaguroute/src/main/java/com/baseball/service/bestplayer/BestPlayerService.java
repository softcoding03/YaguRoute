package com.baseball.service.bestplayer;

import java.util.Map;

import com.baseball.common.domain.Search;
import com.baseball.service.domain.BestPlayer;

public interface BestPlayerService {
		
	public Map<String, Object> getBestPlayerList(Search search) throws Exception;

	public void addBestPlayer(BestPlayer bestPlayer) throws Exception;
	
	public Map<String, Object> getBestPlayerByDate() throws Exception;
}
