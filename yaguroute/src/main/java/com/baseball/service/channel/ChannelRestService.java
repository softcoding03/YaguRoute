package com.baseball.service.channel;

import com.baseball.service.domain.Channel;

public interface ChannelRestService {
	
	public Channel addChannel(Channel channel) throws Exception;
	
	public Channel getChannel(String ChannelID) throws Exception;
	
	public void updateChannel(Channel channel) throws Exception;
	
	public void deleteChannel(String ChannelID) throws Exception;
	
	public Channel stopChannel(String ChannelID) throws Exception;
	
	public String getVideo(String bucketName, String uploadPath) throws Exception;
}
