package com.baseball.service.domain;

public class Player {
	
	//field
    private int playerId;
    private String playerPosition;
    private String playerName;
    private int playerNumber;
    private int playerWeight;
    private int playerHeight;
    private String playerImage;
    private String playerBirth;
    private int playerSalary;
    private float era;
    private int threeOut;
    private double battingAvg;
    private int hitter;
    private int homeRun;
    private int stolenBase;
    private String teamCode;
    
    //method
	
	public String getPlayerPosition() {
		return playerPosition;
	}
	public int getPlayerId() {
		return playerId;
	}
	public void setPlayerId(int playerId) {
		this.playerId = playerId;
	}
	public void setPlayerPosition(String playerPosition) {
		this.playerPosition = playerPosition;
	}
	public String getPlayerName() {
		return playerName;
	}
	public void setPlayerName(String playerName) {
		this.playerName = playerName;
	}
	public int getPlayerNumber() {
		return playerNumber;
	}
	public void setPlayerNumber(int playerNumber) {
		this.playerNumber = playerNumber;
	}
	public int getPlayerWeight() {
		return playerWeight;
	}
	public void setPlayerWeight(int playerWeight) {
		this.playerWeight = playerWeight;
	}
	public int getPlayerHeight() {
		return playerHeight;
	}
	public void setPlayerHeight(int playerHeight) {
		this.playerHeight = playerHeight;
	}
	public String getPlayerImage() {
		return playerImage;
	}
	public void setPlayerImage(String playerImage) {
		this.playerImage = playerImage;
	}
	public String getPlayerBirth() {
		return playerBirth;
	}
	public void setPlayerBirth(String playerBirth) {
		this.playerBirth = playerBirth;
	}
	public int getPlayerSalary() {
		return playerSalary;
	}
	public void setPlayerSalary(int playerSalary) {
		this.playerSalary = playerSalary;
	}
	public float getEra() {
		return era;
	}
	public void setEra(float era) {
		this.era = era;
	}
	public int getThreeOut() {
		return threeOut;
	}
	public void setThreeOut(int threeOut) {
		this.threeOut = threeOut;
	}
	public double getBattingAvg() {
		return battingAvg;
	}
	public void setBattingAvg(double battingAvg) {
		this.battingAvg = battingAvg;
	}
	public int getHitter() {
		return hitter;
	}
	public void setHitter(int hitter) {
		this.hitter = hitter;
	}
	public int getHomeRun() {
		return homeRun;
	}
	public void setHomeRun(int homeRun) {
		this.homeRun = homeRun;
	}
	public int getStolenBase() {
		return stolenBase;
	}
	public void setStolenBase(int stolenBase) {
		this.stolenBase = stolenBase;
	}
	public String getTeamCode() {
		return teamCode;
	}
	public void setTeamCode(String teamCode) {
		this.teamCode = teamCode;
	}
	
	@Override
	public String toString() {
		return "Player [playerId=" + playerId + ", playerPosition=" + playerPosition + ", playerName=" + playerName
				+ ", playerNumber=" + playerNumber + ", playerWeight=" + playerWeight + ", playerHeight=" + playerHeight
				+ ", playerImage=" + playerImage + ", playerBirth=" + playerBirth + ", playerSalary=" + playerSalary
				+ ", era=" + era + ", threeOut=" + threeOut + ", battingAvg=" + battingAvg + ", hitter=" + hitter
				+ ", homeRun=" + homeRun + ", stolenBase=" + stolenBase + ", teamCode=" + teamCode + "]";
	}
    
}