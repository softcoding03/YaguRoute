package com.baseball.service.domain;

import java.util.List;

public class GameRecord {

	//Filed
	private Game gameInfo;
	private List<String> innings;
	private List<String> homeScoreList;
	private List<String> awayScoreList;
	private List<String> homeRecord;
	private List<String> awayRecord;
	private List<Pitcher> titlePitcher;
	private List<Pitcher> homePitcherList;
	private List<Hitter> homeHitterList;
	private List<Pitcher> awayPitcherList;
	private List<Hitter> awayHitterList;

	//Constructor
	public GameRecord() {
		// TODO Auto-generated constructor stub
	}

	public Game getGameInfo() {
		return gameInfo;
	}

	public void setGameInfo(Game gameInfo) {
		this.gameInfo = gameInfo;
	}

	public List<String> getInnings() {
		return innings;
	}

	public void setInnings(List<String> innings) {
		this.innings = innings;
	}

	public List<String> getHomeScoreList() {
		return homeScoreList;
	}

	public void setHomeScoreList(List<String> homeScoreList) {
		this.homeScoreList = homeScoreList;
	}

	public List<String> getAwayScoreList() {
		return awayScoreList;
	}

	public void setAwayScoreList(List<String> awayScoreList) {
		this.awayScoreList = awayScoreList;
	}

	public List<String> getHomeRecord() {
		return homeRecord;
	}

	public void setHomeRecord(List<String> homeRecord) {
		this.homeRecord = homeRecord;
	}

	public List<String> getAwayRecord() {
		return awayRecord;
	}

	public void setAwayRecord(List<String> awayRecord) {
		this.awayRecord = awayRecord;
	}

	public List<Pitcher> getHomePitcherList() {
		return homePitcherList;
	}

	public void setHomePitcherList(List<Pitcher> homePitcherList) {
		this.homePitcherList = homePitcherList;
	}

	public List<Hitter> getHomeHitterList() {
		return homeHitterList;
	}

	public void setHomeHitterList(List<Hitter> homeHitterList) {
		this.homeHitterList = homeHitterList;
	}

	public List<Pitcher> getAwayPitcherList() {
		return awayPitcherList;
	}

	public void setAwayPitcherList(List<Pitcher> awayPitcherList) {
		this.awayPitcherList = awayPitcherList;
	}

	public List<Hitter> getAwayHitterList() {
		return awayHitterList;
	}

	public void setAwayHitterList(List<Hitter> awayHitterList) {
		this.awayHitterList = awayHitterList;
	}

	public List<Pitcher> getTitlePitcher() {
		return titlePitcher;
	}

	public void setTitlePitcher(List<Pitcher> titlePitcher) {
		this.titlePitcher = titlePitcher;
	}

	@Override
	public String toString() {
		return "GameRecord [gameInfo=" + gameInfo + ", innings=" + innings + ", homeScoreList=" + homeScoreList
				+ ", awayScoreList=" + awayScoreList + ", homeRecord=" + homeRecord + ", awayRecord=" + awayRecord
				+ ", titlePitcher=" + titlePitcher + ", homePitcherList=" + homePitcherList + ", homeHitterList="
				+ homeHitterList + ", awayPitcherList=" + awayPitcherList + ", awayHitterList=" + awayHitterList + "]";
	}
	
	
	
}
