package com.baseball.service.channel.impl;

import org.springframework.beans.factory.annotation.Value;

import com.baseball.service.channel.ChannelRestDao;
import com.baseball.service.domain.Channel;

public class ChannelRestDaoImpl implements ChannelRestDao {
	
	//field
	@Value("${acessKey}")
	private String accessKey;
	
	@Value("${secreteKey}")
	private String secreteKey;

	public ChannelRestDaoImpl() {
		System.out.println("ChannelRestDaoImpl Start...");
	}

	@Override
	public Channel addChannel(Channel channel) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Channel getChannel(String channelID) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateChannel(Channel channel) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteChannel(String ChannelID) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public Channel StopChannel(String channleID) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String geteVideo(String bucketName, String uploadPath) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
