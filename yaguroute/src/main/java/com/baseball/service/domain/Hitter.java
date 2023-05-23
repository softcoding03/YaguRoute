package com.baseball.service.domain;

public class Hitter {
	
	//Field
	private String hitterName;
	private String atBat;//타수
	private String getScore;//득점
	private String hits;//안타
	private String RBI;//타점
	private String homeRun;
	private String walk;//사사구
	private String strikeOut;
	private String battingAvg;//타율
	private String lastFiveGameRecord;
	private String hitterImage;
	
	//Constructor
	public Hitter() {
		// TODO Auto-generated constructor stub
	}

	public String getHitterName() {
		return hitterName;
	}

	public void setHitterName(String hitterName) {
		this.hitterName = hitterName;
	}

	public String getAtBat() {
		return atBat;
	}

	public void setAtBat(String atBat) {
		this.atBat = atBat;
	}

	public String getGetScore() {
		return getScore;
	}

	public void setGetScore(String getScore) {
		this.getScore = getScore;
	}

	public String getHits() {
		return hits;
	}

	public void setHits(String hits) {
		this.hits = hits;
	}

	public String getRBI() {
		return RBI;
	}

	public void setRBI(String rBI) {
		RBI = rBI;
	}

	public String getHomeRun() {
		return homeRun;
	}

	public void setHomeRun(String homeRun) {
		this.homeRun = homeRun;
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

	public String getBattingAvg() {
		return battingAvg;
	}

	public void setBattingAvg(String battingAvg) {
		this.battingAvg = battingAvg;
	}

	public String getLastFiveGameRecord() {
		return lastFiveGameRecord;
	}

	public void setLastFiveGameRecord(String lastFiveGameRecord) {
		this.lastFiveGameRecord = lastFiveGameRecord;
	}

	public String getHitterImage() {
		return hitterImage;
	}

	public void setHitterImage(String hitterImage) {
		this.hitterImage = hitterImage;
	}

	@Override
	public String toString() {
		return "Hitter [hitterName=" + hitterName + ", atBat=" + atBat + ", getScore=" + getScore + ", hits=" + hits
				+ ", RBI=" + RBI + ", homeRun=" + homeRun + ", walk=" + walk + ", strikeOut=" + strikeOut
				+ ", battingAvg=" + battingAvg + ", lastFiveGameRecord=" + lastFiveGameRecord + ", hitterImage="
				+ hitterImage + "]";
	}


}
