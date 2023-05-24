package com.baseball.service.domain;

import com.baseball.common.domain.Team;

public class Ticket {
	
	private String ticketNo;
	private Game game;  //Team1, Team2 정보 모두 포함되어 있음
	private String ticketStatus;
	private String seatCode;
	private int seatPrice;
	private Transaction transaction;
	
	public Ticket(){
	}
	
	public String getTicketNo() {
	    return ticketNo;
	}
	public void setTicketNo(String ticketNo) {
	    this.ticketNo = ticketNo;
	}

	public String getTicketStatus() {
	    return ticketStatus;
	}
	public void setTicketStatus(String ticketStatus) {
	    this.ticketStatus = ticketStatus;
	}

	public Game getGame() {
		return game;
	}
	public void setGame(Game game) {
		this.game = game;
	}

	public String getSeatCode() {
	    return seatCode;
	}
	public void setSeatCode(String seatCode) {
	    this.seatCode = seatCode;
	}

	public int getSeatPrice() {
	    return seatPrice;
	}
	public void setSeatPrice(int seatPrice) {
	    this.seatPrice = seatPrice;
	}

	public Transaction getTransaction() {
	    return transaction;
	}
	public void setTransaction(Transaction transaction) {
	    this.transaction = transaction;
	}
	
	// Override
	public String toString() {
	    return "TicketVO {" +
	            "ticketNo='" + ticketNo + '\'' +
	            ", Game='" + game + '\'' +
	            ", ticketStatus='" + ticketStatus + '\'' +
	            ", seatCode='" + seatCode + '\'' +
	            ", seatPrice=" + seatPrice +
	            ", Transaction=" + transaction +
	            '}';
	}



}