package com.baseball.common.domain;

//==>회원정보를 모델링(추상화/캡슐화)한 Bean
public class Team {
	private String teamCode;
	private String teamNickName;
	private String teamEmblem;
	private String stadiumName;
	private String stadiumImageFile;
	private String hometown;
	private String stadiumLat;
	private String stadiumLng;
	private String stadiumAddress;
	private String teamFullName;
	private String teamHomepage;
	private String teamIntroduce;
	private String teamRanking;
	private int endGameCount;
	private int winCount;
	private int loseCount;
	private int tieCount;
	private String winRate;
	private String lastTenMatch;
	private String teamBattingAvg;
	private String teamLostScoreAvg;
	private String headToHeadRecord;//상대전적
	private String lastFiveGameGrade;
	private String hit;
	private String homerun;
	private String steal;
	private String strikeOut;
	private String doubleLife;
	private String error;
	private String teamTopBar;
	private String teamColor;
	
	
	public String getTeamTopBar() {
		return teamTopBar;
	}
	public void setTeamTopBar(String teamTopBar) {
		this.teamTopBar = teamTopBar;
	}
	public String getTeamColor() {
		return teamColor;
	}
	public void setTeamColor(String teamColor) {
		this.teamColor = teamColor;
	}
	public String getTeamCode() {
		return teamCode;
	}
	public void setTeamCode(String teamCode) {
		this.teamCode = teamCode;
	}
	public String getTeamNickName() {
		return teamNickName;
	}
	public void setTeamNickName(String teamNickName) {
		this.teamNickName = teamNickName;
	}
	public String getTeamEmblem() {
		return teamEmblem;
	}
	public void setTeamEmblem(String teamEmblem) {
		this.teamEmblem = teamEmblem;
	}
	public String getStadiumName() {
		return stadiumName;
	}
	public void setStadiumName(String stadiumName) {
		this.stadiumName = stadiumName;
	}
	public String getStadiumImageFile() {
		return stadiumImageFile;
	}
	public void setStadiumImageFile(String stadiumImageFile) {
		this.stadiumImageFile = stadiumImageFile;
	}
	public String getHometown() {
		return hometown;
	}
	public void setHometown(String hometown) {
		this.hometown = hometown;
	}
	public String getStadiumLat() {
		return stadiumLat;
	}
	public void setStadiumLat(String stadiumLat) {
		this.stadiumLat = stadiumLat;
	}
	public String getStadiumLng() {
		return stadiumLng;
	}
	public void setStadiumLng(String stadiumLng) {
		this.stadiumLng = stadiumLng;
	}
	public String getStadiumAddress() {
		return stadiumAddress;
	}
	public void setStadiumAddress(String stadiumAddress) {
		this.stadiumAddress = stadiumAddress;
	}
	public String getTeamFullName() {
		return teamFullName;
	}
	public void setTeamFullName(String teamFullName) {
		this.teamFullName = teamFullName;
	}
	public String getTeamHomepage() {
		return teamHomepage;
	}
	public void setTeamHomepage(String teamHomepage) {
		this.teamHomepage = teamHomepage;
	}
	public String getTeamIntroduce() {
		return teamIntroduce;
	}
	public void setTeamIntroduce(String teamIntroduce) {
		this.teamIntroduce = teamIntroduce;
	}
	public String getTeamRanking() {
		return teamRanking;
	}
	public void setTeamRanking(String teamRanking) {
		this.teamRanking = teamRanking;
	}
	public int getEndGameCount() {
		return endGameCount;
	}
	public void setEndGameCount(int endGameCount) {
		this.endGameCount = endGameCount;
	}
	public String getHeadToHeadRecord() {
		return headToHeadRecord;
	}
	public String getHit() {
		return hit;
	}
	public void setHit(String hit) {
		this.hit = hit;
	}
	public String getHomerun() {
		return homerun;
	}
	public void setHomerun(String homerun) {
		this.homerun = homerun;
	}
	public String getSteal() {
		return steal;
	}
	public void setSteal(String steal) {
		this.steal = steal;
	}
	public String getStrikeOut() {
		return strikeOut;
	}
	public void setStrikeOut(String strikeOut) {
		this.strikeOut = strikeOut;
	}
	public String getDoubleLife() {
		return doubleLife;
	}
	public void setDoubleLife(String doubleLife) {
		this.doubleLife = doubleLife;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	public String getLastFiveGameGrade() {
		return lastFiveGameGrade;
	}
	public void setLastFiveGameGrade(String lastFiveGameGrade) {
		this.lastFiveGameGrade = lastFiveGameGrade;
	}
	public void setHeadToHeadRecord(String headToHeadRecord) {
		this.headToHeadRecord = headToHeadRecord;
	}
	public int getWinCount() {
		return winCount;
	}
	public void setWinCount(int winCount) {
		this.winCount = winCount;
	}
	public int getLoseCount() {
		return loseCount;
	}
	public void setLoseCount(int loseCount) {
		this.loseCount = loseCount;
	}
	public int getTieCount() {
		return tieCount;
	}
	public void setTieCount(int tieCount) {
		this.tieCount = tieCount;
	}
	public String getWinRate() {
		return winRate;
	}
	public void setWinRate(String winRate) {
		this.winRate = winRate;
	}
	public String getLastTenMatch() {
		return lastTenMatch;
	}
	public void setLastTenMatch(String lastTenMatch) {
		this.lastTenMatch = lastTenMatch;
	}
	public String getTeamBattingAvg() {
		return teamBattingAvg;
	}
	public void setTeamBattingAvg(String teamBattingAvg) {
		this.teamBattingAvg = teamBattingAvg;
	}
	public String getTeamLostScoreAvg() {
		return teamLostScoreAvg;
	}
	public void setTeamLostScoreAvg(String teamLostScoreAvg) {
		this.teamLostScoreAvg = teamLostScoreAvg;
	}
	@Override
	public String toString() {
		return "Team [teamCode=" + teamCode + ", teamNickName=" + teamNickName + ", teamEmblem=" + teamEmblem
				+ ", stadiumName=" + stadiumName + ", stadiumImageFile=" + stadiumImageFile + ", hometown=" + hometown
				+ ", stadiumLat=" + stadiumLat + ", stadiumLng=" + stadiumLng + ", stadiumAddress=" + stadiumAddress
				+ ", teamFullName=" + teamFullName + ", teamHomepage=" + teamHomepage + ", teamIntroduce="
				+ teamIntroduce + ", teamRanking=" + teamRanking + ", endGameCount=" + endGameCount + ", winCount="
				+ winCount + ", loseCount=" + loseCount + ", tieCount=" + tieCount + ", winRate=" + winRate
				+ ", lastTenMatch=" + lastTenMatch + ", teamBattingAvg=" + teamBattingAvg + ", teamLostScoreAvg="
				+ teamLostScoreAvg + ", headToHeadRecord=" + headToHeadRecord + ", lastFiveGameGrade="
				+ lastFiveGameGrade + ", hit=" + hit + ", homerun=" + homerun + ", steal=" + steal + ", strikeOut="
				+ strikeOut + ", doubleLife=" + doubleLife + ", error=" + error + ", teamTopBar=" + teamTopBar
				+ ", teamColor=" + teamColor + "]";
	}
	
}
