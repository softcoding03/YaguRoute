package com.baseball.service.ticket;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.baseball.service.domain.Game;
import com.baseball.service.domain.Ticket;

@Mapper
public interface TicketDao {
	
	public int getSalesTicket(String gameCode) throws Exception;
	public void updateTicketStatus(Ticket ticket) throws Exception;
	public void updateTicketRefund(Ticket ticket) throws Exception;
	public List<Ticket> getTickets(String gameCode) throws Exception;
	
}
