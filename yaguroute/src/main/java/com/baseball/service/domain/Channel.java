package com.baseball.service.domain;

public class Channel {
	//field
	private String channelID;
	private Game gameInfo;
	private String channelName;
	private String bucketName;
	private String channelCDN;
	private String envType;
	private String uploadPath;
	private String thumbNail;
	private String streamKey;
	private String streamURL;
	private int homeClick;
	private int awayClick;
	
	//Constructor
	public Channel() {
		// TODO Auto-generated constructor stub
	}

	public String getChannelID() {
		return channelID;
	}

	public Game getGameInfo() {
		return gameInfo;
	}

	public String getChannelName() {
		return channelName;
	}

	public String getBucketName() {
		return bucketName;
	}

	public String getChannelCDN() {
		return channelCDN;
	}

	public String getEnvType() {
		return envType;
	}

	public String getUploadPath() {
		return uploadPath;
	}

	public String getThumbNail() {
		return thumbNail;
	}

	public int getHomeClick() {
		return homeClick;
	}

	public int getAwayClick() {
		return awayClick;
	}
	
	public String getStreamKey() {
		return streamKey;
	}

	public String getStreamURL() {
		return streamURL;
	}

	public void setChannelID(String channelID) {
		this.channelID = channelID;
	}

	public void setGameInfo(Game gameInfo) {
		this.gameInfo = gameInfo;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}

	public void setBucketName(String bucketName) {
		this.bucketName = bucketName;
	}

	public void setChannelCDN(String channelCDN) {
		this.channelCDN = channelCDN;
	}

	public void setEnvType(String envType) {
		this.envType = envType;
	}

	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}

	public void setThumbNail(String thumbNail) {
		this.thumbNail = thumbNail;
	}

	public void setHomeClick(int homeClick) {
		this.homeClick = homeClick;
	}

	public void setAwayClick(int awayClick) {
		this.awayClick = awayClick;
	}
	
	public void setStreamKey(String streamKey) {
		this.streamKey = streamKey;
	}

	public void setStreamURL(String streamURL) {
		this.streamURL = streamURL;
	}
	
	@Override
	public String toString() {
		return "Channel [channelID =" + channelID + ", gameInfo=" + gameInfo + ", channelName=" + channelName + ", bucketName="
				+ bucketName + ", channelCDN=" + channelCDN + ", envType=" + envType + ", uploadPath=" + uploadPath
				+ ", thumbnail=" + thumbNail +", streamKey="+ streamKey +", streamURL = "+streamURL+", homeClick=" + homeClick + ", awayClick="
				+ awayClick+ "]";
	}
	
	
	

}
