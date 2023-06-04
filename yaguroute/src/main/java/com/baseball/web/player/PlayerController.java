package com.baseball.web.player;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baseball.common.domain.Page;
import com.baseball.common.domain.Search;
import com.baseball.service.bestplayer.BestPlayerDao;
import com.baseball.service.bestplayer.BestPlayerService;
import com.baseball.service.domain.BestPlayer;
import com.baseball.service.domain.Player;
import com.baseball.service.player.PlayerCrawlingDao;
import com.baseball.service.player.PlayerDao;
import com.baseball.service.player.PlayerService;
import com.baseball.service.user.UserService;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

@Controller
@RequestMapping("/player/*")
public class PlayerController {

	@Autowired
	@Qualifier("playerServiceImpl")
	private PlayerService playerService;
	
	@Autowired
	@Qualifier("bestPlayerServiceImpl")
	private BestPlayerService bestPlayerService;
	
	@Autowired
	@Qualifier("playerCrawlingDaoImpl")
	private PlayerCrawlingDao playerCrawlingDao;
	
	@Autowired
	@Qualifier("playerDao")
	private PlayerDao playerDao;
	
	@Autowired
	@Qualifier("bestPlayerDao")
	private BestPlayerDao bestPlayerDao;
	
	@Scheduled(cron = "0 0 5 ? * MON")
	public void addPlayer() throws Exception{
		
		System.out.println("addPlayer ㅎㅇ");
		playerCrawlingDao.addPlayer();
	}
	
	public PlayerController() {
		System.out.println(this.getClass());
	}
	
	@Value("${commonProperties.pageUnit}")
	private int pageUnit;
	@Value("${commonProperties.pageSize}")
	private int pageSize;
	
	@GetMapping("listPlayer")
	public String listPlayer(@ModelAttribute("search") Search search, Model model) throws Exception{
		
		System.out.println("lisPlayer ㅎㅇ");
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		System.out.println("Search : "+search);
		search.setPageSize(pageSize);
		
		// B/L 수행
		Map<String, Object> map = playerService.getPlayerList(search);
		System.out.println("search :::"+search);
		
		Page resultPage = new Page(search.getCurrentPage(), (int) map.get("totalCount"), pageUnit, pageSize);
		
		// Model And View Connect...
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/player/listPlayer.jsp";
	}
	
	@GetMapping("getPlayer")
	public String getPlayer(@RequestParam("playerId") String playerId, Model model) throws Exception{
		
		System.out.println("getPlayer ㅎㅇ");
		
		Player player = playerService.getPlayer(playerId);
		
		model.addAttribute("player", player);
		
		return "forward:/player/getPlayer.jsp";
	}
	
	@GetMapping("listBestPlayer")
	public String listBestPlayer(@ModelAttribute("search") Search search, Model model) throws Exception{
		
//		System.out.println("listBestPlayer... GET");
//		
//		if (search.getCurrentPage() == 0) {
//			search.setCurrentPage(1);
//		}
//		
//		System.out.println("Search : "+search);
//		search.setPageSize(pageSize);
//		
//		// B/L 수행
//		Map<String, Object> map = bestPlayerService.getBestPlayerList(search);
//		System.out.println("search :::"+search);
//		
//		Page resultPage = new Page(search.getCurrentPage(), (int) map.get("totalCount"), pageUnit, pageSize);
//		
//		// Model And View Connect...
//		
//		model.addAttribute("list", map.get("list"));
//		model.addAttribute("resultPage", resultPage);
//		model.addAttribute("search", search);
		
		System.out.println("too many nigger");
		List<BestPlayer> bestList = bestPlayerDao.getBestPlayerByDate();
		System.out.println(bestList);
		
		Map<String, Object> bestDateMap = new HashMap<>();
		bestDateMap.put("list", bestList);
		
		System.out.println(bestDateMap);
		
		model.addAttribute("list", bestDateMap.get("list"));
		
		return "forward:/player/listBestPlayer.jsp";
	} 
	
	// 해당 날짜에 해당하는 선수의 playerId로 Player객체를 가져와 리스트에 담기
	@GetMapping("bestListPlayerGroup")
	public String bestListPlayerGroup(@RequestParam("bestDate")String bestDate, Model model, Search search) throws Exception{
		
		//System.out.println("bestDate : "+bestDate);
		System.out.println("BestPlayer의 날짜별 그룹");
		
		if (search.getCurrentPage() == 0) {
		search.setCurrentPage(1);
		}
		search.setPageSize(bestPlayerDao.getTotalCount(search));
		
		Map<String, Object> bestPlayerMap = bestPlayerService.getBestPlayerList(search);
		Page resultPage = new Page(search.getCurrentPage(), (int) bestPlayerMap.get("totalCount"), pageUnit, pageSize);
		
		// 1. 금주의 선수 Map -> List로 변환함.
		List<BestPlayer> bestPlayerList = (List<BestPlayer>) bestPlayerMap.get("list");
		System.out.println("bestPlayerList 2 : "+bestPlayerList); // 원래는 model.attribute()로 정보를 넘겼지만...
		
		// 2. 전체 선수 Map
		search.setPageSize(playerDao.getTotalCount(search));
		Map<String, Object> playerMap = playerService.getPlayerList(search);
		System.out.println("search in player :: "+playerDao.getTotalCount(search));
		
		// 3. 전체 선수 Map -> List로 변환함.
		List<Player> totalPlayerList = (List<Player>) playerMap.get("list");
		//System.out.println("totalPlayerList : "+totalPlayerList);

		bestPlayerList = bestPlayerList.stream().filter(bestplayer -> bestplayer.getBestDate().equals(bestDate))
				.collect(Collectors.toList());

		List<Player> playList = new ArrayList<>();
		
		for (BestPlayer bestPlayers : bestPlayerList) {
			
			//System.out.println("bestPlayers : "+bestPlayers.getPlayerId());
			Player player = playerService.getPlayer(bestPlayers.getPlayerId());
			
			System.out.println("player : "+player);
			
			playList.add(player);
		}
		
//		player가 있잖아. bestPlayer의 아이디와 일치하는 player를 가져오려고하는건데? 그치? 
		
		model.addAttribute("list",playList);
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/player/listBestPlayerGroup.jsp";
	}
	
//	@Scheduled(fixedRate = 30000)
	@Scheduled(cron = "0 0 3 ? * MON")
	public void addBestPlayer() throws Exception {
		System.out.println("addBestPlayer");
		
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
		System.out.println("Search : "+search);
		bestPlayerService.addBestPlayer(bestplayer);
		
		System.out.println(bestPlayerService.getBestPlayerList(search));
		
		System.out.println("호날두");
	}
}
