package com.baseball.service.channel.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.baseball.service.channel.ChannelDao;
import com.baseball.service.channel.ChannelService;
import com.baseball.service.domain.Channel;

@Mapper
@Service("channelServiceImpl")
public class ChannelServiceImpl implements ChannelService {
	//field
	@Autowired
	@Qualifier("channelDao")
	private ChannelDao channelDao;
	
	//default Constructor
	public ChannelServiceImpl() {
		System.out.println("channelServiceImpl Start");
	}
	
	//for Setter Injection
	public void setChannelDao(ChannelDao channelDao) {
		System.out.println("Setting for ChannelDao");
		this.channelDao = channelDao;
	}

	@Override
	public void addChannel(Channel channel) throws Exception {
		channelDao.addChannel(channel);

	}

	@Override
	public Channel getChannel(String channelID) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Object> getChannel() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateChannel(Channel channel) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteChannel(String channelID) throws Exception {
		// TODO Auto-generated method stub

	}

}
