package com.baseball.service.domain;

import java.util.Date;

public class BestPlayer {

	private int id;
	private String playerId;
	private Date bestDate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPlayerId() {
		return playerId;
	}
	public void setPlayerId(String playerId) {
		this.playerId = playerId;
	}
	public Date getBestDate() {
		return bestDate;
	}
	public void setBestDate(Date bestDate) {
		this.bestDate = bestDate;
	}
	@Override
	public String toString() {
		return "BestPlayer [id=" + id + ", playerId=" + playerId + ", bestDate=" + bestDate + "]";
	}
	
	
}
