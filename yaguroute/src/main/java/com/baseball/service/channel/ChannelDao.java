package com.baseball.service.channel;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.baseball.service.domain.Channel;

@Mapper
public interface ChannelDao {

	public void addChannel(Channel channel) throws Exception;
	
	public Channel getChannel(String channelID) throws Exception;
	
	public List<Channel> getChannelList() throws Exception;
	
	public void updateChannel (Channel channel) throws Exception;
	
	public void deleteChannel (String ChannelId) throws Exception;
	
	public void updateChannelGameCode (Channel channel) throws Exception;
	
	public Channel getChannelGameCode(String gameCode) throws Exception;
}
