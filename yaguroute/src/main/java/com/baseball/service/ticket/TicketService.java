package com.baseball.service.ticket;

import java.util.List;
import java.util.Map;

import com.baseball.service.domain.Game;
import com.baseball.service.domain.Ticket;


public interface TicketService {
	
	public int getSalesTicket(String gameCode) throws Exception;
	public void updateTicketStatus(Ticket ticket) throws Exception;
	public void updateTicketRefund(Ticket ticket) throws Exception;
	public List<Ticket> getTickets(String gameCode) throws Exception;
	public void addTicketPurchase(Map<String, Object> map) throws Exception;
}