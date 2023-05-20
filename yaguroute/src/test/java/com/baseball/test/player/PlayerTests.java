package com.baseball.test.player;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.baseball.service.domain.Player;
import com.baseball.service.domain.User;
import com.baseball.service.player.PlayerService;
import com.baseball.service.user.UserDao;
import com.baseball.service.user.UserService;

import junit.framework.Assert;


@SpringBootTest
public class PlayerTests {
	
	@Autowired
	@Qualifier("playerServiceImpl")
	private PlayerService playerService;
	
	//@Test
	public void addPlayer() throws Exception{
		Player player = new Player();
		player.setBattingAvg(2.5);
		player.setEra(3);
		player.setHitter(5);
		player.setHomeRun(8);
		player.setPlayerBirth("19990845");
		player.setPlayerHeight(180);
		player.setPlayerId("12345");
		player.setPlayerImage("C://windows/images/player.png");
		player.setPlayerName("영의지");
		player.setPlayerNumber(7);
		player.setPlayerPosition("외야수");
		player.setPlayerSalary(4000);
		player.setPlayerWeight(78);
		player.setStolenBase(5);
		player.setTeamCode("SK");
		player.setThreeOut(6);
		System.out.println(player);
		playerService.addPlayer(player);
	}
	
	@Test
	public void testGetPlayer() throws Exception{
		Player player = new Player();
		player = playerService.getPlayer("12345");
		System.out.println(player);
	}
}	
