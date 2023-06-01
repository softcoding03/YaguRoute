package com.baseball.service.channel;

import java.util.Map;

import com.baseball.service.domain.Channel;

public interface ChannelRestService {
	
	public Channel addChannel(Channel channel) throws Exception;
	
	public int updateChannel(Channel channel) throws Exception;
	
	public int deleteChannel(String ChannelID) throws Exception;
	
	public String stopChannel(String ChannelID) throws Exception;
	
	public String getVideo(Channel channel, String videoName) throws Exception;
	
	public String getChannelStatus(String ChannelID) throws Exception;
	
	public String getChannelRecordStatus(String channelID) throws Exception;
}
