package com.baseball.service.domain;

public class Channel {
	//field
	private String channelID;
	private Game gameInfo;
	private String channelName;
	private String channelCDN;
	private String channelServiceURL;
	private String bucketName;
	private String uploadPath;
	private String thumbNail;
	private int homeClick;
	private int awayClick;
	
	//Constructor
	public Channel() {
		// TODO Auto-generated constructor stub
	}
	
	//get,set method
	public String getChannelID() {
		return channelID;
	}

	public Game getGameInfo() {
		return gameInfo;
	}

	public String getChannelName() {
		return channelName;
	}

	public String getChannelCDN() {
		return channelCDN;
	}

	public String getChannelServiceURL() {
		return channelServiceURL;
	}

	public String getBucketName() {
		return bucketName;
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

	public void setChannelID(String channelID) {
		this.channelID = channelID;
	}

	public void setGameInfo(Game gameInfo) {
		this.gameInfo = gameInfo;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}

	public void setChannelCDN(String channelCDN) {
		this.channelCDN = channelCDN;
	}

	public void setChannelServiceURL(String channelServiceURL) {
		this.channelServiceURL = channelServiceURL;
	}

	public void setBucketName(String bucketName) {
		this.bucketName = bucketName;
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
	
	
	

}
