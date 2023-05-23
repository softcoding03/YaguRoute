package com.baseball.service.ticket.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.baseball.service.comment.CommentDao;
import com.baseball.service.comment.CommentService;
import com.baseball.service.domain.Comment;
import com.baseball.service.domain.Game;
import com.baseball.service.domain.Ticket;
import com.baseball.service.ticket.TicketDao;
import com.baseball.service.ticket.TicketService;


@Service("ticketServiceImpl")


public class TicketServiceImpl implements TicketService {
	
	@Autowired
	@Qualifier("ticketDao")
	TicketDao ticketDao;
	

	@Override
	public int getSalesTicket(String gameCode) throws Exception {
		return ticketDao.getSalesTicket(gameCode);
	}

	@Override
	public void updateTicketStatus(Ticket ticket) throws Exception {
		ticketDao.updateTicketStatus(ticket);
	}

	@Override
	public void updateTicketRefund(Ticket ticket) throws Exception {
		ticketDao.updateTicketRefund(ticket);
	}

	@Override
	public List<Ticket> getTickets(String gameCode) throws Exception {
		return ticketDao.getTickets(gameCode);
	}

	@Override
	public void addTicketPurchase(Map<String, Object> map) throws Exception {
		ticketDao.addTicketPurchase(map);
	}
			

}