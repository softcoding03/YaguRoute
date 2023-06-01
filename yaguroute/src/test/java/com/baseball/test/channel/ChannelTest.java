package com.baseball.test.channel;

import java.time.LocalDate;
import java.util.Iterator;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.baseball.service.channel.ChannelService;
import com.baseball.service.domain.Channel;
import com.baseball.service.domain.Game;
import com.baseball.service.game.GameService;

import junit.framework.Assert;

@SpringBootTest
public class ChannelTest {
	
	//wiring
	@Autowired
	@Qualifier("channelServiceImpl")
	private ChannelService channelSerivce;
	
	//gameService Wiring
	@Autowired
	@Qualifier("gameServiceImpl")
	private GameService gameService;
	
	//constructor
	public ChannelTest() {
		// TODO Auto-generated constructor stub
	}
	
	//add Channel Test => Success
	//@Test
	public void testAddChannel() throws Exception{
		Channel channel = new Channel();
		Game game = new Game();
		
		game.setGameCode("20230314SKSS02023");
		channel.setChannelID("ls-20230509114330-test");
		channel.setGameInfo(game);
		channel.setChannelCDN("Test_Test");
		channel.setBucketName("test_test_t");
		channel.setChannelName("testChannelName");
		channel.setEnvType("REAL");
		channel.setUploadPath("TEST_path");
		channel.setHomeClick(0);
		channel.setAwayClick(0);
		
		channelSerivce.addChannel(channel);;
	}

	//Select Test => success
	//@Test
	public void testSelectChannel() throws Exception{
		String channelID = "ls-20230509114330-test";
		Channel channel = channelSerivce.getChannel(channelID);
		System.out.println("channel_id: "+channel.getChannelID());
		System.out.println("game_code : "+channel.getGameInfo());
		Assert.assertEquals("ls-20230509114330-test", channel.getChannelID());
	}
	
	//Select List Test => success
	//@Test
	public void testSelectChannelList() throws Exception{
		List<Channel> channelList = channelSerivce.getChannelList();
		System.out.println(channelList.size());
		for(Object list : channelList) {
			System.out.println(list.toString());
		}
		
	}
	
	//update Channel Test =>success
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
	
	//DELETE Channel Test =>
	//@Test
	public void testDeleteChannel() throws Exception{
		channelSerivce.deleteChannel("ls-20230509114330-test");
	}
	
	@Test
	public void testUpdateGameCode() throws Exception{
		System.out.println("게임코드 업데이트 시작");
		List<Channel> channelList = channelSerivce.getChannelList();
		List<Game> gameList = gameService.getGameListByDate(LocalDate.now().toString());
		
		//일자에 맞게 게임코드 업데이트
		for (int i = 0; i < channelList.size(); i++) {
		    Channel channel = channelList.get(i);
		    int gameIndex = i % gameList.size();
		    Game game = gameList.get(gameIndex);
		    channel.setGameInfo(game);
		    channelSerivce.updateChannelGameCode(channel);
		    System.out.println("채널 ID: " + channel.getChannelID() + ", 게임 정보: " + game);
		}
	}

}
