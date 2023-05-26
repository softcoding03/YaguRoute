package com.baseball.service.domain;

import java.util.Date;

public class BestPlayer {

	//Field
	private String playerId;
	private String bestDate;
	
	//Method
	public String getPlayerId() {
		System.out.println("playerId : "+playerId);
		return playerId;
	}
	public void setPlayerId(String playerId) {
		System.out.println("set playerId : "+playerId);
		this.playerId = playerId;
	}
	public String getBestDate() {
		System.out.println("bestDate : "+bestDate);
		return bestDate;
	}
	public void setBestDate(String bestDate) {
		System.out.println("bestDate : "+bestDate);
		this.bestDate = bestDate;
	}
	@Override
	public String toString() {
		return "BestPlayer [playerId=" + playerId + ", bestDate=" + bestDate + "]";
	}
	
}
