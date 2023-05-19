package com.baseball.test.channel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.baseball.service.channel.ChannelService;

@SpringBootTest
public class ChannelTest {
	
	//wiring
	@Autowired
	@Qualifier("channelServiceImpl")
	private ChannelService channelSerivce;
	
	//constructor
	public ChannelTest() {
		// TODO Auto-generated constructor stub
	}
	
	//addTest
	
	
	
	//SelectTest

}
