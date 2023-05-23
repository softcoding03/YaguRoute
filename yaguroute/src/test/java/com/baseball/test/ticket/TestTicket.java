package com.baseball.test.ticket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.baseball.service.domain.Game;
import com.baseball.service.domain.Ticket;
import com.baseball.service.domain.Transaction;
import com.baseball.service.domain.User;
import com.baseball.service.game.GameService;
import com.baseball.service.ticket.TicketDao;
import com.baseball.service.ticket.TicketService;
import com.baseball.service.transaction.TransactionService;


@SpringBootTest
public class TestTicket{
	
	@Autowired
	@Qualifier("ticketServiceImpl")
	private TicketService ticketService;
	
	@Autowired
	@Qualifier("gameServiceImpl")
	private GameService gameService;
	
	@Autowired
	@Qualifier("transactionServiceImpl")
	private TransactionService transactionService;
	
	
	@Autowired
	@Qualifier("ticketDao")
	private TicketDao ticketDao;
	
	//GameList 현재로부터 2주치 경기스케줄 get
	//@Test
	public void getGameListTwoweeks() throws Exception{
		System.out.println("getGameListTwoweeks START");
		//gameService.getGameListTwoweeks(); //현재시간부터 14일이내 경기 리스트 가져옴.
		System.out.println("getGameListTwoweeks END");
	}
	
	//해당 game의 티켓 정보 모두 get (60개)
	//@Test
	public void getTickets() throws Exception{
		System.out.println("getTickets START");
		String gameCode = "20230313HTHH02023";
		System.out.println("tickets ? "+ticketService.getTickets(gameCode));
		System.out.println("getTickets END");
	}
	
	//Stadium 이미지 출력...
	//@Test
	public void getStadium() throws Exception{
		System.out.println("getStadium START");
		Ticket ticket = new Ticket();
		String gameCode = "20230313HTHH02023"; //화면에서 넘겨준 gameCode
		Game game = gameService.getGameInfo(gameCode); //gameCode로 Game 관련정보 모두 가져옴.(Team정보도 모두 잇음)
		ticket.setGame(game);
		int salesTicket = ticketService.getSalesTicket(gameCode);

		System.out.println("세팅한 ticket?"+ticket);
		System.out.println("stadium??? "+ticket.getGame().getHomeTeam().getStadiumImageFile());
		System.out.println("판매완료된 좌석 수" + salesTicket);
		System.out.println("getStadium END");
	}
	
	//addTicketPurchase 티켓 구매(transaction add + ticket update)
	@Test
	public void addTicketPurchase() throws Exception{
		System.out.println(":: addTicketPurchase START");
		Transaction transaction = new Transaction();
		User user = new User();
		user.setUserId("john123");
		transaction.setBuyer(user);
		transaction.setImpNo("imp1002");
		transaction.setTranTotalPrice(60000);
		transaction.setTranPaymentOption("0");
		transaction.setTranType("t");
		transaction.setTranUsePoint(500);
		System.out.println(":: transaction add 하기 위한 setting? "+transaction);
		//int tranNo = transactionService.addTransaction(transaction);  //transaction add 하면서 tran_no 생성하고 그 tran_no 바로 리턴해줌
		int tranNo = 12;
		Map<String, Object> map = new HashMap<>(); // Mapper에 map 객체 보내주기 위함
		map.put("tranNo", tranNo);
		List<String> list = new ArrayList<>(); //ticketNo가 최대 4개 올 수 있음.
		list.add("20230313HTHH02023-A13");
		list.add("20230313HTHH02023-A14");
		list.add("20230313HTHH02023-A15");
		list.add("20230313HTHH02023-A16");
		map.put("list", list);
		
		System.out.println(":: map 저장된 것은? ? "+map);
		ticketService.addTicketPurchase(map);
		System.out.println(":: addTicketPurchase END");
	}
	
	//결제내역 List get
	public void getPurchaseList() throws Exception{
		
	}
	
	//결제번호에 해당하는 ticket List get
	public void getTicketPurchaseList() throws Exception{
		
	}
	
	//해당 게임 총 판매 티켓 수
	//@Test
	public void getSalesTicket() throws Exception{
		System.out.println("getSalesTicket START");
		String gameCode = "20230313HTHH02023";
			System.out.println("해당 Game의 총 판매 티켓은?"+ticketService.getSalesTicket(gameCode));
		System.out.println("getSalesTicket END");
	}
	
	//판매 상태 변경
	//@Test
	public void updateTicketStatus() throws Exception{
		System.out.println("updateTicketStatus START");
		Ticket ticket = new Ticket();	
		ticket.setTicketStatus("2"); //0:판매전 1:판매중 2:판매완료
		ticket.setTicketNo("20230313HTHH02023-A11");
		ticketService.updateTicketStatus(ticket);
		System.out.println("updateTicketStatus END");
	}
	
	//환불유무 변경
	//@Test
	public void updateTicketRefund() throws Exception{
		System.out.println("updateTicketRefund START");
		Ticket ticket = new Ticket();	
		ticket.setTicketRefund(1); //0:환불안함 1:환불됨
		ticket.setTicketNo("20230313HTHH02023-A11");
		ticketService.updateTicketRefund(ticket);
		System.out.println("updateTicketRefund END");
	}
}