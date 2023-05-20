package com.baseball.service.domain;

import java.util.Date;

public class BestPlayer {

	//Field
	private int id;
	private Player playerId;
	private Date bestDate;
	
	//Method
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Player getPlayerId() {
		return playerId;
	}
	public void setPlayerId(Player playerId) {
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
