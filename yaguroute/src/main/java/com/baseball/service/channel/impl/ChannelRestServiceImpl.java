package com.baseball.service.channel.impl;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Service;

import com.baseball.service.channel.ChannelRestService;
import com.baseball.service.domain.Channel;

@Mapper
@Service("channelRestServiceImpl")
public class ChannelRestServiceImpl implements ChannelRestService {

	public ChannelRestServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public Channel addChannel(Channel channel) throws Exception {
		System.out.print("addChannel 실행");
		
		return null;
	}

	@Override
	public Channel getChannel(String ChannelID) throws Exception {
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
