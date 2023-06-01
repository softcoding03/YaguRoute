package com.baseball.web.player;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.baseball.common.domain.Page;
import com.baseball.common.domain.Search;
import com.baseball.service.domain.Player;
import com.baseball.service.player.PlayerCrawlingDao;
import com.baseball.service.player.PlayerDao;
import com.baseball.service.player.PlayerService;
import com.baseball.service.user.UserService;

@Controller
@RequestMapping("/player/*")
public class PlayerController {

	@Autowired
	@Qualifier("playerServiceImpl")
	private PlayerService playerService;
	
	@Autowired
	@Qualifier("playerCrawlingDaoImpl")
	private PlayerCrawlingDao playerCrawlingDao;
	
	@Autowired
	@Qualifier("playerDao")
	private PlayerDao playerDao;
	
	@GetMapping("addPlayer")
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
		
		return "forward:/user/getUser.jsp";
	}
}
