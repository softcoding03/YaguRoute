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
import com.baseball.service.domain.User;
import com.baseball.service.ticket.TicketDao;
import com.baseball.service.ticket.TicketService;


@Service("ticketServiceImpl")


public class TicketServiceImpl implements TicketService {
	
	@Autowired
	@Qualifier("ticketDao")
	TicketDao ticketDao;
	
	public TicketServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public int getSalesTicket(String gameCode) throws Exception {
		return ticketDao.getSalesTicket(gameCode);
	}

	@Override
	public void updateRefundStatus(int tranNo) throws Exception {
		ticketDao.updateRefundStatus(tranNo);
	}

	@Override
	public void updateTicketStatus(Ticket ticket) throws Exception {
		ticketDao.updateTicketStatus(ticket);
	}

	@Override
	public List<Ticket> getTickets(String gameCode) throws Exception {
		return ticketDao.getTickets(gameCode);
	}

	@Override
	public void addTicketPurchase(Map<String, Object> map) throws Exception {
		ticketDao.addTicketPurchase(map);
	}

	@Override
	public String getGameCode(int tranNo) throws Exception {
		return ticketDao.getGameCode(tranNo);
	}

	@Override
	public List<Ticket> getTicketPurchaseList(int tranNo) throws Exception {
		return ticketDao.getTicketPurchaseList(tranNo);
	}

	@Override
	public void updateRefundPoint(User user) throws Exception {
		ticketDao.updateRefundPoint(user);
	}

	@Override
	public Ticket getTicketInfo(String ticketNo) throws Exception {
		return ticketDao.getTicketInfo(ticketNo);
	}

	@Override
	public List<Game> getGameListByMonth(int month) throws Exception {
		return ticketDao.getGameListByMonth(month);
	}
			

}