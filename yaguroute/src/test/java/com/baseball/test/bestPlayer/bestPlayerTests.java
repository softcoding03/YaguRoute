package com.baseball.test.bestPlayer;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.joda.time.LocalDate;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.baseball.common.domain.Search;
import com.baseball.service.bestplayer.BestPlayerService;
import com.baseball.service.domain.BestPlayer;
import com.baseball.service.domain.Player;
import com.baseball.service.player.PlayerService;

@SpringBootTest
public class bestPlayerTests {
	
	@Autowired
	@Qualifier("playerServiceImpl")
	private PlayerService playerService;
	
	@Autowired
	@Qualifier("bestPlayerServiceImpl")
	private BestPlayerService bestPlayerService;
	
	
	
	@Test
	public void testAddBestPlayer() throws Exception{
		
		Search search = new Search();
		
		search.setCurrentPage(1);
		search.setPageSize(900); // 전체 선수 출력 위해...
		Map<String, Object> map = playerService.getPlayerList(search);
		System.out.println(search+"\n"+map); // totalCount가 출력된다.
		
		/* 1. 타자 베스트 */
		List<Player> playerList = (List<Player>) map.get("list");
		System.out.println(playerList);
		playerList = playerList.stream().filter(player -> 
		player.getPlayerPosition().equals("내야수") || player.getPlayerPosition().equals("외야수") || player.getPlayerPosition().equals("포수"))
		.sorted(Comparator.comparingDouble(Player::getBattingAvg).reversed())
        .limit(8)
        .collect(Collectors.toList());
		
		/* 2. 투수 베스트 */
		List<Player> playerToosoo = (List<Player>) map.get("list");
		playerToosoo = playerToosoo.stream().filter(player ->player.getPlayerPosition().equals("투수"))
		.sorted(Comparator.comparingDouble(Player::getEra).reversed())
		.limit(1)
		.collect(Collectors.toList());
		
		BestPlayer bestplayer = new BestPlayer(); // BestPlayer 인스턴스 생성
		
		for(Player player : playerList) {
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			String dateString = formatter.format(new Date());
			
			System.out.println("playerId : "+player.getPlayerId());
			bestplayer.setPlayerId(player.getPlayerId());
			bestplayer.setBestDate(dateString);
			System.out.println("bestPlayer : "+bestplayer);
			bestPlayerService.addBestPlayer(bestplayer);
		}
		
		for(Player player : playerToosoo) {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			String dateString = formatter.format(new Date());
			
			System.out.println("playerId : "+player.getPlayerId());
			bestplayer.setPlayerId(player.getPlayerId());
			bestplayer.setBestDate(dateString);
		}
		
		bestPlayerService.addBestPlayer(bestplayer);
		
		System.out.println(bestPlayerService.getBestPlayerList(search));
		
	}
	
	//@Test
	public void justTest() throws ParseException {
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = formatter.format(new Date());
		System.out.println(dateString);
	}
}
