package com.baseball.service.channel;

import org.apache.ibatis.annotations.Mapper;
import org.json.simple.JSONObject;

import com.baseball.service.domain.Channel;

@Mapper
public interface ChannelRestDao {
	
	public Channel addChannel(Channel channel) throws Exception;
	
	public String getChannelServiceURL(String channelID) throws Exception;
	
	public void updateChannel(Channel channel) throws Exception;
	
	public void deleteChannel(String ChannelID) throws Exception;
	
	public Channel StopChannel(String channleID) throws Exception;
	
	public String geteVideo(String bucketName, String uploadPath) throws Exception;
	
	
}
