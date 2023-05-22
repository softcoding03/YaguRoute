package com.baseball.test.channel;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.baseball.service.channel.ChannelRestDao;
import com.baseball.service.channel.ChannelRestService;
import com.baseball.service.channel.ChannelService;
import com.baseball.service.domain.Channel;
import com.baseball.service.domain.Game;

@SpringBootTest
public class ChannelRestTest {
	
	//wiring
	@Autowired
	@Qualifier("channelRestServiceImpl")
	private ChannelRestService channelRestService;
	
	@Autowired
	@Qualifier("channelServiceImpl")
	private ChannelService channelService;
	
	@Autowired
	@Qualifier("channelRestDaoImpl")
	private ChannelRestDao channelRestDao;
	
	public ChannelRestTest() {
		
	}
	
	//@Test => success
	public void testAddChannel() throws Exception{
		Channel channel = new Channel();
		Game game = new Game();
		game.setGameCode("20230314SKSS02023");
		

		channel.setGameInfo(game);
		channel.setChannelName("testchannel");
		channel.setBucketName("mainpjt");
		channel.setUploadPath("/streaming");
		System.out.println(channel.toString());
		
		Channel testChannel = channelRestService.addChannel(channel);
		System.out.println("test Channel : "+testChannel.toString());
		
		channelService.addChannel(testChannel);
		System.out.println("testAddChannel() 종료");
	}
	
	//@Test //=> success
	public void getChannelServiceURL() throws Exception{
		String channelURL = channelRestDao.getChannelServiceURL("ls-20230522185940-acP14");
		
		System.out.println("channel의 Service URL : "+channelURL);
	}
	
	//@Test //=> success
	public void deleteRestChannel() throws Exception{
		channelRestService.deleteChannel("ls-20230522190731-z9Ufu");
	}
	
	@Test
	public void updataRestChannel() throws Exception{
		
		Channel channel = channelService.getChannel("ls-20230522185940-acP14");
		System.out.println("channel bucket Name : "+channel.getBucketName());
		channel.setChannelName("jeongho");
		channel.setUploadPath("/abcdefg");
		channel.setBucketName("mainpjt");
		
		System.out.println("channel 정보 : "+channel.toString());
		
		
		channelRestService.updateChannel(channel);
	}

}
