package com.baseball.service.player.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.baseball.common.domain.Search;
import com.baseball.service.domain.Player;
import com.baseball.service.domain.User;
import com.baseball.service.player.PlayerDao;
import com.baseball.service.player.PlayerService;

@Service("playerServiceImpl")
public class PlayerServiceImpl implements PlayerService{

	//Field
	@Autowired
	@Qualifier("playerDao")
	private PlayerDao playerDao;
	
	public void setPlayerDao(PlayerDao playerDao) {
		this.playerDao = playerDao;
	}
	
	//Constructor
	public PlayerServiceImpl() {
		System.out.println(this.getClass());
	}
	
	//Method
	@Override
	public void addPlayer(Player player) throws Exception {
		// TODO Auto-generated method stub
		playerDao.addPlayer(player); 
	}
	
	@Override
	public Player getPlayer(String playerId) throws Exception {
		// TODO Auto-generated method stub
		return playerDao.getPlayer(playerId);
	}

	@Override
	public void deletePlayer() {
		// TODO Auto-generated method stub
		playerDao.deletePlayer();
	}

	@Override
	public void dropForeignKey() {
		// TODO Auto-generated method stub
		playerDao.dropForeignKey();
	}

	@Override
	public void addForeignKey() {
		// TODO Auto-generated method stub
		playerDao.addForeignKey();
	}

	@Override
	public Map<String, Object> getPlayerList(Search search) throws Exception {
		// TODO Auto-generated method stub
		List<Player> list = playerDao.getPlayerList(search); 
		int totalCount = playerDao.getTotalCount(search); // totalCount는 따로 service, serviceImpl에 메소드 형태로 만들지 않는다. 
		
		System.out.println("totalCount : " +totalCount); // totalCount : User리스트의 User 갯수 : 4개
		Map<String, Object> map = new HashMap<String, Object>(); // Map<String,Object> 객체 생성
		
		map.put("list", list); // "list" 문자 내부에 정렬되어 list=[User [userId = beatles123.. 라고 저장된다.]]
		map.put("totalCount", new Integer(totalCount));
		
//		System.out.println("playerServiceImpl에서의 list... : "+map);
		
		return map;
	}

	
}
