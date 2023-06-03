package com.baseball.service.bestplayer.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.baseball.common.domain.Search;
import com.baseball.service.bestplayer.BestPlayerDao;
import com.baseball.service.bestplayer.BestPlayerService;
import com.baseball.service.domain.BestPlayer;
import com.baseball.service.domain.Player;
import com.baseball.service.player.PlayerDao;

@Service("bestPlayerServiceImpl")
public class BestPlayerServiceImpl implements BestPlayerService{

	@Autowired
	@Qualifier("playerDao")
	private PlayerDao playerDao;
	
	@Autowired
	@Qualifier("bestPlayerDao")
	private BestPlayerDao bestPlayerDao;
	
	public BestPlayerServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addBestPlayer(BestPlayer bestplayer) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("bestplayer : "+bestplayer);
		bestPlayerDao.addBestPlayer(bestplayer);
	}

	@Override
	public Map<String, Object> getBestPlayerList(Search search) throws Exception {
		// TODO Auto-generated method stub
		List<BestPlayer> list = bestPlayerDao.getBestPlayerList(search);
		int totalCount = bestPlayerDao.getTotalCount(search);
		//System.out.println("bestPlayer : "+list);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public Map<String, Object> getBestPlayerByDate() throws Exception {
		// TODO Auto-generated method stub
		return (Map<String, Object>) bestPlayerDao.getBestPlayerByDate();
	}

//	@Override
//	public Map<String, Object> getPlayerByBestPlayer(Search search) throws Exception {
//		// TODO Auto-generated method stub
//		
//		List<Player> list = bestPlayerDao.getPlayerByBestPlayer(search);
//		int totalCount = bestPlayerDao.getTotalCount(search);
//		
//		Map<String, Object> map = new HashMap<String,Object>();
//		map.put("list", list);
//		map.put("totalCount", new Integer(totalCount));
//		
//		return map;
//	}
}
