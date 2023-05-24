package com.baseball.service.domain;

public class GamePreview {
	
	//Field
	private Game gameInfo;
	private Hitter homeKeyPlayer;
	private Hitter awayKeyPlayer;
	private Pitcher homeStartingPitcher;
	private Pitcher awayStartingPitcher;
	
	//Constructor
	public GamePreview() {
		// TODO Auto-generated constructor stub
	}

	public Game getGameInfo() {
		return gameInfo;
	}

	public void setGameInfo(Game gameInfo) {
		this.gameInfo = gameInfo;
	}

	public Hitter getHomeKeyPlayer() {
		return homeKeyPlayer;
	}

	public void setHomeKeyPlayer(Hitter homeKeyPlayer) {
		this.homeKeyPlayer = homeKeyPlayer;
	}

	public Hitter getAwayKeyPlayer() {
		return awayKeyPlayer;
	}

	public void setAwayKeyPlayer(Hitter awayKeyPlayer) {
		this.awayKeyPlayer = awayKeyPlayer;
	}

	public Pitcher getHomeStartingPitcher() {
		return homeStartingPitcher;
	}

	public void setHomeStartingPitcher(Pitcher homeStartingPitcher) {
		this.homeStartingPitcher = homeStartingPitcher;
	}

	public Pitcher getAwayStartingPitcher() {
		return awayStartingPitcher;
	}

	public void setAwayStartingPitcher(Pitcher awayStartingPitcher) {
		this.awayStartingPitcher = awayStartingPitcher;
	}

	@Override
	public String toString() {
		return "GamePreview [gameInfo=" + gameInfo + ", homeKeyPlayer=" + homeKeyPlayer + ", awayKeyPlayer="
				+ awayKeyPlayer + ", homeStartingPitcher=" + homeStartingPitcher + ", awayStartingPitcher="
				+ awayStartingPitcher + "]";
	}

}
