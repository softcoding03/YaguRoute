package com.baseball.service.player.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.baseball.service.domain.Player;
import com.baseball.service.player.PlayerDao;
import com.baseball.service.player.PlayerService;

@Service("playerServiceImpl")
public class playerServiceImpl implements PlayerService{

	//Field
	@Autowired
	@Qualifier("playerDao")
	private PlayerDao playerDao;
	private SqlSession sqlSession;
	public void setPlayerDao(PlayerDao playerDao) {
		this.playerDao = playerDao;
	}
	
	//Constructor
	public playerServiceImpl() {
		System.out.println("playerServiceImpl Success...");
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

}
