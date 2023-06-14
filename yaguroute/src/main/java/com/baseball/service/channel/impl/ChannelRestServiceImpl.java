package com.baseball.service.channel.impl;

import java.util.Map;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import org.apache.ibatis.annotations.Mapper;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.baseball.service.channel.ChannelDao;
import com.baseball.service.channel.ChannelRestDao;
import com.baseball.service.channel.ChannelRestService;
import com.baseball.service.domain.Channel;

@Service("channelRestServiceImpl")
public class ChannelRestServiceImpl implements ChannelRestService {
	
	//field
	@Autowired
	@Qualifier("channelRestDaoImpl")
	private ChannelRestDao channelRestDao;
	
	@Autowired
	@Qualifier("channelDao")
	private ChannelDao channelDao;
	
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
		
		//채널 상태 확인				
		//String data = channelRestDao.getChannelServiceURL(returnData.getChannelID());	
		//returnData.setChannelCDN(data);
		
		ScheduledExecutorService executorService = Executors.newSingleThreadScheduledExecutor();

		executorService.scheduleAtFixedRate(() -> {
		    try {
				if (channelRestDao.getChannelStatus(returnData.getChannelID()).get("cdnStatus").equals("running")) {
				    String data = channelRestDao.getChannelServiceURL(returnData.getChannelID());
				    returnData.setChannelCDN(data);
				    channelDao.updateChannelCdn(returnData);
				    executorService.shutdown();  // 작업이 완료되면 executorService 종료
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}, 0, 1, TimeUnit.MINUTES);
		
		//Thread.sleep(360000);
		//String data = channelRestDao.getChannelServiceURL(returnData.getChannelID());
		//returnData.setChannelCDN(data);
		
		System.out.println("returnData Info : "+returnData.toString());
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
	public Map<String, Object> getChannelStatus(String ChannelID) throws Exception{
		Map<String, Object> channelStatus = channelRestDao.getChannelStatus(ChannelID);
		return channelStatus;
	}
	
	@Override
	public String getChannelRecordStatus(String channelID) throws Exception{
		String recordStatus = channelRestDao.getChannelRecordStatus(channelID);
		return recordStatus;
	};

}
