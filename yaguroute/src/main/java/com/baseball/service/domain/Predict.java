package com.baseball.service.domain;

class Predict {
	//Field
	private int predNo;
	private Game predGame;
	private User predUser;
	private String predWinningTeamCode;
	private int predPoint;
	private int afterGamePredPoint;
	private String predSuccess;
	
	public int getPredNo() {
		return predNo;
	}
	public void setPredNo(int predNo) {
		this.predNo = predNo;
	}
	public Game getPredGame() {
		return predGame;
	}
	public void setGame(Game game) {
		this.predGame = game;
	}
	public User getPredUser() {
		return predUser;
	}
	public void setPredUser(User predUser) {
		this.predUser = predUser;
	}
	public String getPredWinningTeamCode() {
		return predWinningTeamCode;
	}
	public void setPredWinningTeamCode(String predWinningTeamCode) {
		this.predWinningTeamCode = predWinningTeamCode;
	}
	public int getPredPoint() {
		return predPoint;
	}
	public void setPredPoint(int predPoint) {
		this.predPoint = predPoint;
	}
	public int getAfterGamePredPoint() {
		return afterGamePredPoint;
	}
	public void setAfterGamePredPoint(int afterGamePredPoint) {
		this.afterGamePredPoint = afterGamePredPoint;
	}
	public String getPredSuccess() {
		return predSuccess;
	}
	public void setPredSuccess(String predSuccess) {
		this.predSuccess = predSuccess;
	}
	
	@Override
	public String toString() {
		return "Predict [predNo=" + predNo + ", predGame=" + predGame + ", predUser=" + predUser + ", predWinningTeamCode="
				+ predWinningTeamCode + ", predPoint=" + predPoint + ", afterGamePredPoint=" + afterGamePredPoint
				+ ", predSuccess=" + predSuccess + "]";
	}
	
}
