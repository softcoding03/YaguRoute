package com.baseball.service.ticket;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.baseball.service.domain.Ticket;
import com.baseball.service.domain.User;

@Mapper
public interface TicketDao {
	
	public Ticket getTicketInfo(String ticketNo) throws Exception;
	
	public int getSalesTicket(String gameCode) throws Exception;
	
	public void updateRefundStatus(int tranNo) throws Exception;
		
	public void updateTicketStatus(Ticket ticket) throws Exception;
	
	public List<Ticket> getTickets(String gameCode) throws Exception;
	
	public void addTicketPurchase(Map<String, Object> map) throws Exception;
	
	public String getGameCode(int tranNo) throws Exception;
	
	public List<Ticket> getTicketPurchaseList(int tranNo) throws Exception;
	
	public void updateRefundPoint(User user) throws Exception;
	
}
