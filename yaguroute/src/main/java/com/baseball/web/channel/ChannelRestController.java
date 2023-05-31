package com.baseball.web.channel;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.asynchttpclient.netty.channel.ChannelState;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.baseball.service.channel.ChannelRestService;
import com.baseball.service.channel.ChannelService;
import com.baseball.service.domain.Channel;
import com.baseball.service.domain.Game;
import com.baseball.service.game.GameService;

@RestController
@RequestMapping("/channel/rest/*")
public class ChannelRestController {
	
	//field
	@Autowired
	@Qualifier("channelRestServiceImpl")
	private ChannelRestService channelRestService;
	
	//field
	@Autowired
	@Qualifier("channelServiceImpl")
	private ChannelService channelService;
	
	//field
	@Autowired
	@Qualifier("gameServiceImpl")
	private GameService gameService;
	
	
	//Constructor
	public ChannelRestController() {
		System.out.println(this.getClass());
	}
	
	//method
	
	@GetMapping("status")
	public Map getChannelStatus(@RequestParam("channelID") String ChannelID) throws Exception {
		System.out.println("채널 상태 조회");
		
		String channelStatus = channelRestService.getChannelStatus(ChannelID);
		System.out.println("channel 현재 상태 : "+channelStatus);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("channelState", channelStatus);
		return map;
	}
	
	@Scheduled(cron = "0 */5 * * * ?")
	public void stopRecord() throws Exception{
		System.out.println("실행");
		List<Channel> channelList = channelService.getChannelList();

		for(Channel test : channelList) {
			
			String gameStatus = gameService.getGameInfo(test.getGameInfo().getGameCode()).getGameStatusCode();
			Game game = test.getGameInfo();
			
			if(gameStatus.equals("2") || gameStatus.equals("4")) {
				System.out.println("영상 녹화 종료");
				System.out.println(test);
				System.out.println(game);
				
				String videoName = channelRestService.stopChannel(test.getChannelID());
				game.setVideoName(videoName);
				
				String videoLink = channelRestService.getVideo(test, videoName);
				game.setVideoLink(videoLink);
				
				System.out.println("setting된 game : "+game);
				gameService.updatevideoThumbNail(game);
			} else {
				System.out.println("안됐지롱~");
				System.out.println(test);
				System.out.println(game);
			}
		}
	}
		
		

}
