package com.baseball.service.domain;

import com.baseball.common.domain.Team;

public class Game {
	//Field
	private String gameCode;
	private Team homeTeam;
	private Team awayTeam;
	private String winningTeamCode;
	private String gameYear;
	private String gameDate;
	private String gameTime;
	private String gameStatusCode;
	private String gameScore;
	private String winningTeamAllocation;
	private String videoName;
	private String videoLink;
	private String videoThumbNail;
	
	//method
	public String getGameCode() {
		return gameCode;
	}
	public void setGameCode(String gameCode) {
		this.gameCode = gameCode;
	}
	public Team getHomeTeam() {
		return homeTeam;
	}
	public void setHomeTeam(Team homeTeam) {
		this.homeTeam = homeTeam;
	}
	public Team getAwayTeam() {
		return awayTeam;
	}
	public void setAwayTeam(Team awayTeam) {
		this.awayTeam = awayTeam;
	}
	public String getWinningTeamCode() {
		return winningTeamCode;
	}
	public void setWinningTeamCode(String winningTeamCode) {
		this.winningTeamCode = winningTeamCode;
	}
	public String getGameDate() {
		return gameDate;
	}
	public void setGameDate(String gameDate) {
		this.gameDate = gameDate;
	}
	public String getGameTime() {
		return gameTime;
	}
	public void setGameTime(String gameTime) {
		this.gameTime = gameTime;
	}
	public String getGameStatusCode() {
		return gameStatusCode;
	}
	public void setGameStatusCode(String gameStatusCode) {
		this.gameStatusCode = gameStatusCode;
	}
	public String getWinningTeamAllocation() {
		return winningTeamAllocation;
	}
	public void setWinningTeamAllocation(String winningTeamAllocation) {
		this.winningTeamAllocation = winningTeamAllocation;
	}
	public String getVideoName() {
		return videoName;
	}
	public void setVideoName(String videoName) {
		this.videoName = videoName;
	}
	public String getVideoLink() {
		return videoLink;
	}
	public void setVideoLink(String videoLink) {
		this.videoLink = videoLink;
	}
	public String getVideoThumbNail() {
		return videoThumbNail;
	}
	public void setVideoThumbNail(String videoThumbNail) {
		this.videoThumbNail = videoThumbNail;
	}
	
	public String getGameScore() {
		return gameScore;
	}
	public void setGameScore(String score) {
		this.gameScore = score;
	}
	public String getGameYear() {
		return gameYear;
	}
	public void setGameYear(String gameYear) {
		this.gameYear = gameYear;
	}
	
	@Override
	public String toString() {
		return "Game [gameCode=" + gameCode + ", homeTeam=" + homeTeam + ", awayTeam=" + awayTeam + ", winningTeamCode="
				+ winningTeamCode + ", gameYear=" + gameYear + ", gameDate=" + gameDate + ", gameTime=" + gameTime
				+ ", gameStatusCode=" + gameStatusCode + ", gameScore=" + gameScore + ", winningTeamAllocation="
				+ winningTeamAllocation + ", videoName=" + videoName + ", videoLink=" + videoLink + ", videoThumbNail="
				+ videoThumbNail + "]";
	}
	
	
}
