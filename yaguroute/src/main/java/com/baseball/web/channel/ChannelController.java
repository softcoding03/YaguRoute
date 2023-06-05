package com.baseball.web.channel;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.baseball.service.channel.ChannelRestService;
import com.baseball.service.channel.ChannelService;
import com.baseball.service.domain.Channel;
import com.baseball.service.domain.Game;
import com.baseball.service.domain.GameRecord;
import com.baseball.service.domain.Player;
import com.baseball.service.domain.User;
import com.baseball.service.game.GameService;

import io.netty.handler.codec.http.HttpRequest;

@Controller
@RequestMapping("/channel/*")
public class ChannelController {
	
	//field
	@Autowired
	@Qualifier("channelServiceImpl")
	private ChannelService channelService;
	
	@Autowired
	@Qualifier("channelRestServiceImpl")
	private ChannelRestService channelRestService;
	
	@Autowired
	@Qualifier("gameServiceImpl")
	private GameService gameService;
	//Constructor
	public ChannelController() {
		System.out.println(this.getClass());
	}
	
	
	//method
	//addChannel : GET (추가 화면)
	@GetMapping("addChannel")
	public ModelAndView addChannelView(ModelAndView model) throws Exception{
		System.out.println("/addProductView");
		//현재 날짜 game Code 구하기
		LocalDate now = LocalDate.now();
		List<Game> gameList = gameService.getGameListByDate(now.toString());
		model.addObject("gamelist", gameList);
		model.setViewName("forward:/channel/addChannelView.jsp");
		return model;
	}
	
	//addChannel:POST (addChannelView.jsp 화면)
	@PostMapping("addChannel")
	public ModelAndView addChannel(@ModelAttribute("channel") Channel channel,
											@RequestParam(value="gameCode", required=false) String gameCode,
											HttpSession session) throws Exception{
		
		System.out.println("addChannel:POST 시작");
		System.out.println("channel NAME : "+channel.getChannelName());
		
		if(gameCode != null) {
			Game gameInfo = gameService.getGameInfo(gameCode);
			channel.setGameInfo(gameInfo);
		}
		
		
		// 1.channel REST로 Naver Cloud에 생성
		Channel returnData = channelRestService.addChannel(channel);
		
		// 2.channel 로컬 DB에 저장
		channelService.addChannel(returnData);
		
		
		
		ModelAndView modelView = new ModelAndView();
		modelView.addObject("channel",returnData);
		modelView.setViewName("forward:/channel/addChannel.jsp");
		return modelView;
	}
	
	//getChannelList
	@GetMapping("listChannel")
	public ModelAndView getChannelList() throws Exception{
		//System.out.println("getChannelList 시작");
		List<Channel> list = channelService.getChannelList();
		
		for(Channel channel : list) {
			//System.out.println(channel);
		}
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("list", list);
		modelAndView.setViewName("forward:/channel/listStreamingTest.jsp");
		
		return modelAndView;
	}
	
	//getChannel => 스트리밍 리스트에서 들어올 때
	@GetMapping("getChannel")
	public ModelAndView getChannel(@RequestParam(value="channelID") String channelID,
			HttpSession session) throws Exception{
		System.out.println("getChannel Start...");
		
		User user = (User)session.getAttribute("user");
		Channel channel = channelService.getChannel(channelID);
		
		
		
		ModelAndView modelAndView = new ModelAndView();
		if(user.getRole().equals("user")) {
			Map<String, List<Player>> lineUp = gameService.getGameCrawlingLineup(channel.getGameInfo());
			GameRecord gameRecord = gameService.getGameRecord(channel.getGameInfo());
			
			modelAndView.addObject("channel", channel);
			modelAndView.addObject("lineUp", lineUp);
			modelAndView.addObject("gameRecord", gameRecord);
			modelAndView.setViewName("forward:/channel/getStreamingTest.jsp");
		} else {
			modelAndView.addObject("channel", channel);
			modelAndView.setViewName("forward:/channel/getChannel.jsp");
		}
		
		System.out.println("getChannel End...");
		return modelAndView;
	}
	
	//게임 스케줄에서 들어올 때
	@GetMapping("getStreaming")
	public ModelAndView getStreaming(@RequestParam(value="gameCode") String gameCode) throws Exception{
		System.out.println("getStraming start");
		
		Channel channel = channelService.getChannelGameCode(gameCode);
		System.out.println(channel);
		Map<String, List<Player>> lineUp = gameService.getGameCrawlingLineup(channel.getGameInfo());
		System.out.println(lineUp);
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("lineUp", lineUp);
		modelAndView.addObject("channel", channel);
		modelAndView.setViewName("forward:/channel/getStreaming.jsp");
		
		System.out.println("getStreaming End...");
		
		return modelAndView;
	}
	
	@GetMapping("updateChannel")
	public ModelAndView updateChannelView(@RequestParam(value="channelID") String channelID) throws Exception{
		System.out.println("updateChannelView");
		System.out.println("channelID : "+channelID);
		Channel channel = channelService.getChannel(channelID);
		
		//현재 날짜 game Code 구하기
		LocalDate now = LocalDate.now();
		List<Game> gameList = gameService.getGameListByDate(now.toString());
		
		for(Game game : gameList) {
			System.out.println(game);
		}
		
		
		//Model, View Setting
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("channel", channel);
		modelAndView.addObject("gamelist", gameList);
		modelAndView.setViewName("forward:/channel/updateChannelView.jsp");
		return modelAndView;
	}
	
	@PostMapping("updateChannel")
	public ModelAndView updateChannel(@ModelAttribute("channel") Channel channel, 
			@RequestParam("gameCode") String gameCode) throws Exception{
		
		System.out.println("updatacChannel 실행~~~");
		System.out.println("channel Info : "+channel);
		System.out.println("game Code : "+gameCode);
		
		Game gameInfo = gameService.getGameInfo(gameCode);
		channel.setGameInfo(gameInfo);
		
		int status = channelRestService.updateChannel(channel);
		System.out.println("statuse code : "+status);
		
		if(status == 200 || status == 201) {
			System.out.println("수정한다.");
			channelService.updateChannel(channel);
		}
		
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("forward:/channel/updateChannel.jsp");
		
		System.out.println("변경 후 channel : "+channel);
		
		return modelAndView;
	}
	
	@GetMapping("deleteChannel")
	public String deleteChannel(@RequestParam(value="channelID") String channelID) throws Exception{
		System.out.println("deletcChannel 실행");
		System.out.println("channel ID : "+channelID);
		
		int status = channelRestService.deleteChannel(channelID);
		
		if(status == 200 || status == 201) {
			channelService.deleteChannel(channelID);
		}
		
		System.out.println("deletcChannel 종료");
		return "redirect:/channel/listChannel";
	}
	
	@Scheduled(cron = "0 10 0 * * *")
	public void updateChannelGameCode () throws Exception{
		System.out.println("게임코드 업데이트 시작");
		List<Channel> channelList = channelService.getChannelList();
		List<Game> gameList = gameService.getGameListByDate(LocalDate.now().toString());
		
		//일자에 맞게 게임코드 업데이트
		for (int i = 0; i < channelList.size(); i++) {
		    Channel channel = channelList.get(i);
		    int gameIndex = i % gameList.size();
		    Game game = gameList.get(gameIndex);
		    channel.setGameInfo(game);
		    channelService.updateChannelGameCode(channel);
		    System.out.println("채널 ID: " + channel.getChannelID() + ", 게임 정보: " + game);
		}
	}

}
