package com.baseball.service.ticket;

import java.util.List;
import java.util.Map;

import com.baseball.service.domain.Ticket;
import com.baseball.service.domain.User;


public interface TicketService {
	
	//해당 티켓 정보 get
	public Ticket getTicketInfo(String ticketNo) throws Exception;
	
	//특정 경기의 판매된 총 티켓 갯수 get 
	public int getSalesTicket(String gameCode) throws Exception;
	
	//좌석선택을 위한 특정 경기의 모든 티켓 정보 get(60개) 
	public List<Ticket> getTickets(String gameCode) throws Exception;
	
	//환불완료 시 transaction의 환불유무코드 0->1로 변경
	public void updateRefundStatus(int tranNo) throws Exception;
	
	//ticket 판매 상태 변경(0:판매전 1:판매중 2:판매완료)
	public void updateTicketStatus(Ticket ticket) throws Exception;
	
	//티켓 구매 시 transaction add 후에, ticket에 tranNo & ticket_status 변경 로직
	public void addTicketPurchase(Map<String, Object> map) throws Exception;
	
	//ticketNo가 속한 게임의 gameCode get
	public String getGameCode(int tranNo) throws Exception;
	
	//tranNo에 해당하는 티켓 list get
	public List<Ticket> getTicketPurchaseList(int tranNo) throws Exception;
	
	//환불완료 시 user가 구매 시 사용한 point 복구
	public void updateRefundPoint(User user) throws Exception; 
}
