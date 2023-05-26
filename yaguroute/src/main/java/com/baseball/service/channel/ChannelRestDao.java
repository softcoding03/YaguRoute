package com.baseball.service.channel;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.json.simple.JSONObject;

import com.baseball.service.domain.Channel;

@Mapper
public interface ChannelRestDao {
	
	public Channel addChannel(Channel channel) throws Exception;
	
	public String getChannelServiceURL(String channelID) throws Exception;
	
	public Map<String, Object> getChannel(String channelID) throws Exception;
	
	public void updateChannel(Channel channel) throws Exception;
	
	public void deleteChannel(String ChannelID) throws Exception;
	
	public String StopChannel(String channleID) throws Exception;
	
	public String geteVideo(Channel channel, String videoName) throws Exception;
	
	public String getChannelStatus(String channelID) throws Exception;
	
}
