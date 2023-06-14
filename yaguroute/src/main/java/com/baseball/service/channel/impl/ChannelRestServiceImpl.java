package com.baseball.service.channel.impl;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.baseball.service.channel.ChannelRestDao;
import com.baseball.service.channel.ChannelRestService;
import com.baseball.service.domain.Channel;

@Service("channelRestServiceImpl")
public class ChannelRestServiceImpl implements ChannelRestService {
	
	//field
	@Autowired
	@Qualifier("channelRestDaoImpl")
	private ChannelRestDao channelRestDao;
	
	//Constructor
	public ChannelRestServiceImpl() {
		System.out.println(this.getClass());
	}
	
	//method
	@Override
	public Channel addChannel(Channel channel) throws Exception {
		System.out.print("addChannel 실행");
		System.out.print("Channel Info : "+channel.toString());
		
		if(channel.getEnvType() == null) {
			channel.setEnvType("REAL");
		} 
		
		Channel returnData = channelRestDao.addChannel(channel);
		
		Map<String, Object> map = channelRestDao.getChannel(returnData.getChannelID());
		
		String streamKey = map.get("streamKey").toString();
		String streamURL = map.get("streamURL").toString();
		returnData.setStreamKey(streamKey);
		returnData.setStreamURL(streamURL);
		
		System.out.println("returnData Info : "+returnData.toString());
		
		Thread.sleep(360000);
		String data = channelRestDao.getChannelServiceURL(returnData.getChannelID());	
		returnData.setChannelCDN(data);
		
		return returnData;
	}


	@Override
	public int updateChannel(Channel channel) throws Exception {
		return channelRestDao.updateChannel(channel);

	}

	@Override
	public int deleteChannel(String ChannelID) throws Exception {
		return channelRestDao.deleteChannel(ChannelID);

	}

	@Override
	public String stopChannel(String ChannelID) throws Exception {
		String returnData = channelRestDao.StopChannel(ChannelID);
		return returnData;
	}

	@Override
	public String getVideo(Channel channel, String videoName) throws Exception {
		String returnData = channelRestDao.geteVideo(channel, videoName);
		return returnData;
	}
	
	@Override
	public String getChannelStatus(String ChannelID) throws Exception{
		String channelStatus = channelRestDao.getChannelStatus(ChannelID);
		return channelStatus;
	}
	
	@Override
	public String getChannelRecordStatus(String channelID) throws Exception{
		String recordStatus = channelRestDao.getChannelRecordStatus(channelID);
		return recordStatus;
	};

}
