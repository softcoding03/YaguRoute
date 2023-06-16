package com.baseball.service.player.impl;

import java.util.ArrayList;
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
		
		System.out.println("getPlayerList Service Impl ");
		
		System.out.println("search 도메인의 TeamCode : "+search.getTeamCode());
		
		if(search.getTeamCode() == null || search.getTeamCode().equals("ALL")) {

			List<Player> list = playerDao.getPlayerList(search); 
			int totalCount = playerDao.getTotalCount(search); // totalCount는 따로 service, serviceImpl에 메소드 형태로 만들지 않는다. 
			
			System.out.println("totalCount : " +totalCount); // totalCount : User리스트의 User 갯수 : 4개
			Map<String, Object> map = new HashMap<String, Object>(); // Map<String,Object> 객체 생성
			
			map.put("list", list); // "list" 문자 내부에 정렬되어 list=[User [userId = beatles123.. 라고 저장된다.]]
			map.put("totalCount", new Integer(totalCount));
			
			System.out.println("전체 선수인가? : "+map);
			System.out.println("어떻게 되는거야 이거"+search);
			
			return map;
			
		}
		
		else {	
			
		// 모든 선수 조회
		List<Player> allPlayerList = playerDao.getAllPlayer();
		
		// 전체 선수 조회 위한 totalCount 정의
		int totalCount = playerDao.getTotalCount(search); // totalCount는 따로 service, serviceImpl에 메소드 형태로 만들지 않는다. 
		System.out.println("totalCount : " +totalCount); // totalCount : User리스트의 User 갯수 : 4개
		
		// 이전 페이지 사이즈 저장하기 
		int realPageSize = search.getPageSize();
		
		// 다시 전체 페이지 사이즈로 전환하기(모든 선수 조회 위함)
		search.setPageSize(totalCount);
		System.out.println("search의 pagesize 가 total "+search.getPageSize());
		
		List<Player> filterPlayerList = new ArrayList<>();
		
		for (Player player : allPlayerList) {
			if (player.getTeamCode().equals(search.getTeamCode())) {

				filterPlayerList.add(player);
		    }
		}
		
		// 설정
		search.setPageSize(realPageSize);
		
		System.out.println("여기서 search Page 다시 설정 : "+search.getPageSize());
		
		/* 전체 리스트는 아니고 search의 5명으로 제한되어 있는 상태 */
		
		//System.out.println("filterPlayerList : "+filterPlayerList);
		
		List<Player> list = filterPlayerList;
		list = playerDao.getPlayerList(search); 
		
		System.out.println("현 리스트에 들어갈 player 객체"+list); // 여기서 다시 초기화 되버린다.

		Map<String, Object> map = new HashMap<String, Object>(); // Map<String,Object> 객체 생성
		
		map.put("list", filterPlayerList); // "list" 문자 내부에 정렬되어 list=[User [userId = beatles123.. 라고 저장된다.]]
		map.put("totalCount", new Integer(totalCount));
		
		System.out.println("전체 선수인가? : "+map);
//		System.out.println("playerServiceImpl에서의 list... : "+map);
		
		System.out.println("어떻게 되는거야 이거"+search);
		
		return map;
		}
		
	}
	
}
