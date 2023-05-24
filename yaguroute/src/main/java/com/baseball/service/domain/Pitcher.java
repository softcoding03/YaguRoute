package com.baseball.service.domain;

public class Pitcher {

	//Field
	private String pitcherName;
	private String innings;
	private String getHit;
	private String totalLostScore;
	private String myLostScore;
	private String walk;
	private String strikeOut;
	private String getHomerun;
	private String againstHitter;
	private String atBat;
	private String pitchingCount;
	private String win;
	private String lose;
	private String lastFiveGameRecord;
	private String ERA;
	private String title;
	private String pitcherImage;
	
	//Constructor
	public Pitcher() {
		// TODO Auto-generated constructor stub
	}

	public String getPitcherName() {
		return pitcherName;
	}

	public void setPitcherName(String pitcherName) {
		this.pitcherName = pitcherName;
	}

	public String getInnings() {
		return innings;
	}

	public void setInnings(String innings) {
		this.innings = innings;
	}

	public String getGetHit() {
		return getHit;
	}

	public void setGetHit(String getHit) {
		this.getHit = getHit;
	}

	public String getTotalLostScore() {
		return totalLostScore;
	}

	public void setTotalLostScore(String totalLostScore) {
		this.totalLostScore = totalLostScore;
	}

	public String getMyLostScore() {
		return myLostScore;
	}

	public void setMyLostScore(String myLostScore) {
		this.myLostScore = myLostScore;
	}

	public String getWalk() {
		return walk;
	}

	public void setWalk(String walk) {
		this.walk = walk;
	}

	public String getStrikeOut() {
		return strikeOut;
	}

	public void setStrikeOut(String strikeOut) {
		this.strikeOut = strikeOut;
	}

	public String getGetHomerun() {
		return getHomerun;
	}

	public void setGetHomerun(String getHomerun) {
		this.getHomerun = getHomerun;
	}

	public String getAgainstHitter() {
		return againstHitter;
	}

	public void setAgainstHitter(String againstHitter) {
		this.againstHitter = againstHitter;
	}

	public String getAtBat() {
		return atBat;
	}

	public void setAtBat(String atBat) {
		this.atBat = atBat;
	}

	public String getPitchingCount() {
		return pitchingCount;
	}

	public void setPitchingCount(String pitchingCount) {
		this.pitchingCount = pitchingCount;
	}

	public String getWin() {
		return win;
	}

	public void setWin(String win) {
		this.win = win;
	}

	public String getLose() {
		return lose;
	}

	public void setLose(String lose) {
		this.lose = lose;
	}

	public String getLastFiveGameRecord() {
		return lastFiveGameRecord;
	}

	public void setLastFiveGameRecord(String lastFiveGameRecord) {
		this.lastFiveGameRecord = lastFiveGameRecord;
	}

	public String getPitcherImage() {
		return pitcherImage;
	}

	public void setPitcherImage(String pitcherImage) {
		this.pitcherImage = pitcherImage;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getERA() {
		return ERA;
	}

	public void setERA(String eRA) {
		ERA = eRA;
	}

	@Override
	public String toString() {
		return "Pitcher [pitcherName=" + pitcherName + ", innings=" + innings + ", getHit=" + getHit
				+ ", totalLostScore=" + totalLostScore + ", myLostScore=" + myLostScore + ", walk=" + walk
				+ ", strikeOut=" + strikeOut + ", getHomerun=" + getHomerun + ", againstHitter=" + againstHitter
				+ ", atBat=" + atBat + ", pitchingCount=" + pitchingCount + ", win=" + win + ", lose=" + lose
				+ ", lastFiveGameRecord=" + lastFiveGameRecord + ", ERA=" + ERA + ", title=" + title + ", pitcherImage="
				+ pitcherImage + "]";
	}


}
