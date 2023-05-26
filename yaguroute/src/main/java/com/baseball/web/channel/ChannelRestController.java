package com.baseball.web.channel;

import java.util.HashMap;
import java.util.Map;

import org.asynchttpclient.netty.channel.ChannelState;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.baseball.service.channel.ChannelRestService;

@RestController
@RequestMapping("/channel/rest/*")
public class ChannelRestController {
	
	//field
	@Autowired
	@Qualifier("channelRestServiceImpl")
	private ChannelRestService channelRestService;
	
	//Constructor
	public ChannelRestController() {
		// TODO Auto-generated constructor stub
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

}
