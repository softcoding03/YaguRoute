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
		
		Map<String, Object> channelInfo = channelRestService.getChannelStatus(ChannelID);
				
		String channelStatus = (String)channelInfo.get("channelStatus");
		System.out.println("channel 현재 상태 : "+channelStatus);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("channelState", channelStatus);
		return map;
	}
	
	@Scheduled(cron = "0 */1 * * * ?")
	public void stopRecord() throws Exception{
		System.out.println("실행");
		List<Channel> channelList = channelService.getChannelList();

		for(Channel test : channelList) {
			
			if (!(test.getGameInfo() == null)) {
				String gameStatus = gameService.getGameInfo(test.getGameInfo().getGameCode()).getGameStatusCode();
				Game game = test.getGameInfo();
				
				if(channelRestService.getChannelRecordStatus(test.getChannelID()).equals("RECORDING") && channelRestService.getChannelStatus(test.getChannelID()).get("channelStatus").equals("PUBLISHING")) {
					System.out.println(channelRestService.getChannelRecordStatus(test.getChannelID()));
					if(gameStatus.equals("2") || gameStatus.equals("4")) {
						//System.out.println("영상 녹화 종료");
						//System.out.println(test);
						//System.out.println(game);
						
						String videoName = channelRestService.stopChannel(test.getChannelID());
						game.setVideoName(videoName);
						
						String videoLink = channelRestService.getVideo(test, videoName);
						game.setVideoLink(videoLink);
						
						game.setVideoThumbNail("https://kr.object.ncloudstorage.com/mainpjt/images/60d320a4-e816-4487-8e2d-8e1ccc1b83d6hani.jpg");
						
						//System.out.println("setting된 game : "+game);
						gameService.updateGameVideo(game);
					} else {
						System.out.println("안됐지롱~");
					}
					
				} else {
					System.out.println("채널 송출 전 입니다.");
				}
			} else {
				//System.out.println("오늘은 경기가 없습니다.");
			}
			
		}

	}
		
		

}
