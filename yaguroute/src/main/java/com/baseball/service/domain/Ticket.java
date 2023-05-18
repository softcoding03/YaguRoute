package com.baseball.service.domain;

public class Ticket {
	
	private String ticketNo;
	private String gameCode;
	private String ticketStatus;
	private int ticketRefund;
	private String seatCode;
	private int seatPrice;
	private Transaction transaction;
	
	public String getTicketNo() {
	    return ticketNo;
	}
	public void setTicketNo(String ticketNo) {
	    this.ticketNo = ticketNo;
	}

	public String getGameCode() {
	    return gameCode;
	}
	public void setGameCode(String gameCode) {
	    this.gameCode = gameCode;
	}

	public String getTicketStatus() {
	    return ticketStatus;
	}
	public void setTicketStatus(String ticketStatus) {
	    this.ticketStatus = ticketStatus;
	}

	public int getTicketRefund() {
	    return ticketRefund;
	}
	public void setTicketRefund(int ticketRefund) {
	    this.ticketRefund = ticketRefund;
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
	            ", gameCode='" + gameCode + '\'' +
	            ", ticketStatus='" + ticketStatus + '\'' +
	            ", ticketRefund=" + ticketRefund +
	            ", seatCode='" + seatCode + '\'' +
	            ", seatPrice=" + seatPrice +
	            ", transaction=" + transaction +
	            '}';
	}



}