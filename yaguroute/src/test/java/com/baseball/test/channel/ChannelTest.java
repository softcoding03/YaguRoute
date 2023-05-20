package com.baseball.test.channel;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.baseball.service.channel.ChannelService;
import com.baseball.service.domain.Channel;

import junit.framework.Assert;

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
	
	//add Channel Test
	public void testAddChannel() throws Exception{
		
	}

	//Select Test
	@Test
	public void testSelectChannel() throws Exception{
		String channelID = "ls-20230509114330-OGzDh";
		Channel channel = channelSerivce.getChannel(channelID);
		Assert.assertEquals("ls-20230509114330-OGzDh", channel.getChannelID());
	}
	
	//Select List Test
	//@Test
	public void testSelectChannelList() throws Exception{

	}
	
	//update Channel Test
	//@Test
	public void testUpdateChannel() throws Exception{
		Channel channel = new Channel();
		
		channel.setChannelID("ls-20230509114330-OGzDh");
		channel.setChannelName("Jeongho");
		channel.setBucketName("Jeongho");
		channel.setChannelCDN("http://192.168.0.1");
		channel.setEnvType("DESC");
		channel.setThumbNail("jjjjeongho.png");
		System.out.println("아무거나");
		channelSerivce.updateChannel(channel);
		System.out.println("아무거나1");
	}

}
