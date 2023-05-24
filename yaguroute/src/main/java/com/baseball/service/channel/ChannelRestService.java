package com.baseball.service.channel;

import java.util.Map;

import com.baseball.service.domain.Channel;

public interface ChannelRestService {
	
	public Channel addChannel(Channel channel) throws Exception;
	
	public void updateChannel(Channel channel) throws Exception;
	
	public void deleteChannel(String ChannelID) throws Exception;
	
	public Map<String, Object> stopChannel(String ChannelID) throws Exception;
	
	public String getVideo(Channel channel, String videoName) throws Exception;
}
