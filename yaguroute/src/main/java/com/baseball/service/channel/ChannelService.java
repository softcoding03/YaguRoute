package com.baseball.service.channel;

import java.util.List;

import com.baseball.service.domain.Channel;

public interface ChannelService {
	
	public void addChannel(Channel channel) throws Exception;
	
	public Channel getChannel(String channelID) throws Exception;
	
	public List<Object> getChannel() throws Exception;
	
	public void updateChannel(Channel channel) throws Exception;
	
	public void deleteChannel(String channelID) throws Exception;
}
