package com.baseball.service.channel.impl;

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
		System.out.println("ChannelRestService strart...");
	}
	
	//method
	@Override
	public Channel addChannel(Channel channel) throws Exception {
		System.out.print("addChannel 실행");
		System.out.print("Channel Info : "+channel.toString());
		Channel returnData = channelRestDao.addChannel(channel);
		
		String data = channelRestDao.getChannelServiceURL(returnData.getChannelID());
		return returnData;
	}


	@Override
	public void updateChannel(Channel channel) throws Exception {
		channelRestDao.updateChannel(channel);

	}

	@Override
	public void deleteChannel(String ChannelID) throws Exception {
		channelRestDao.deleteChannel(ChannelID);

	}

	@Override
	public Channel stopChannel(String ChannelID) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getVideo(String bucketName, String uploadPath) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
