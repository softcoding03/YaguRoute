package com.baseball.test.ticket;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.baseball.common.domain.Search;
import com.baseball.service.domain.Game;
import com.baseball.service.domain.Ticket;
import com.baseball.service.domain.Transaction;
import com.baseball.service.domain.User;
import com.baseball.service.game.GameService;
import com.baseball.service.ticket.TicketDao;
import com.baseball.service.ticket.TicketService;
import com.baseball.service.transaction.TransactionService;
import com.baseball.service.user.UserService;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;


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
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("ticketDao")
	private TicketDao ticketDao;
	
	
	//GameList 현재로부터 2주치 경기스케줄 get
	//@Test
	public void getGameListTwoweeks() throws Exception{
		System.out.println("getGameListTwoweeks START");
		//List<Game> list = gameService.getGameListTwoWeeks(); //현재시간부터 14일이내 경기 리스트 가져옴.
		//System.out.println(list);
		System.out.println("getGameListTwoweeks END");
	}
	
	//해당 game의 티켓 정보 모두 get (60개) -> 좌석선택위함
	//@Test
	public void getTickets() throws Exception{
		System.out.println("getTickets START");
		String gameCode = "20230313HTHH02023";
		for(Ticket ticket:ticketService.getTickets(gameCode)) {
			System.out.println("tickets ? "+ticket);
		}
		System.out.println("getTickets END");
	}
	
	//Stadium 화면출력을 위한 정보
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
	//@Test
	public void addTicketPurchase() throws Exception{
		System.out.println(":: addTicketPurchase START");
		Transaction transaction = new Transaction();
		User user = new User();
		user.setUserId("john123");
		transaction.setBuyer(user);
		transaction.setImpNo("imp1003");
		transaction.setTranTotalPrice(60000);
		transaction.setTranPaymentOption("0");
		transaction.setTranType("t");
		transaction.setTranUsePoint(500);
		System.out.println(":: transaction add 하기 위한 setting? "+transaction);
		int tranNo = transactionService.addTransaction(transaction);  //transaction add 하면서 tran_no 생성하고 그 tran_no 바로 리턴해줌
		
		Map<String, Object> map = new HashMap<>(); // Mapper에 map 객체 보내주기 위함
		map.put("tranNo", tranNo);
		List<String> list = new ArrayList<>(); //ticketNo가 최대 4개 올 수 있음.
		list.add("20230313HTHH02023-A17");
		list.add("20230313HTHH02023-A18");
		list.add("20230313HTHH02023-A19");
		list.add("20230313HTHH02023-A20");
		map.put("list", list);
		
		System.out.println(":: map 저장된 것은? ? "+map);
		ticketService.addTicketPurchase(map);
		System.out.println(":: addTicketPurchase END");
	}
	
	//userId로 ticket 결제내역 List get
	//@Test
	public void getPurchaseList() throws Exception{
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(5);
		
		String userId = "john123";
		String tranType = "t";
		Map<String, Object> map = transactionService.getTransactionList(search, userId, tranType);
		List<Transaction> list = (List<Transaction>)map.get("list");
		 
	 	for(Transaction tran:list) {
	 		System.out.println(tran);
	 	}
		
		Integer totalCount = (Integer)map.get("totalCount");
		System.out.println("Transaction TotalCount:: "+totalCount);
		totalCount = (Integer)map.get("totalCount");
		////////결제내역list 정보///////
		
		////////game 정보(화면에 어느 경기를 예매한건지 출력해주기 위함/////
		List<Game> gamelist = new ArrayList<>();
		for(Transaction tran:list) { //결제내역List에서 tranNo뽑아내서 게임정보불러온 다음 다시 list화
	 	Game game=gameService.getGameInfo(ticketService.getGameCode(tran.getTranNo()));
	 	gamelist.add(game);
		}
		System.out.println("game정보 불러온 것 :: " +gamelist);
	}
	
	//결제번호에 해당하는 ticket List get
	//@Test
	public void getTicketPurchaseList() throws Exception{
		int tranNo = 30; //화면에서 보내줄 예정
		Game game=gameService.getGameInfo(ticketService.getGameCode(tranNo)); //게임정보세팅
		List<Ticket> list = ticketService.getTicketPurchaseList(tranNo); //tranNo에 해당하는 티켓 정보들 get
		System.out.println("tranNO에 해당하는 티켓 list ?? "+list);
	}
	
	//해당 경기의 모든 결제 내역 조회
	//@Test
	public void getPurchaseListbyGameCode() throws Exception{
		
	}
	
	//결제내역 상세조회
	//@Test
	public void getTransaction() throws Exception{
		Transaction transaction = transactionService.getTransaction(30);
		System.out.println("해당 결제의 상세내역"+transaction);
	}
	
	//환불 하기(controller에서 로직 돌아야함. 여기서는 환불 완료 후 해줄 로직만)
	//=>transaction 환불상태코드 변경 및 user가 사용한 point 복구하는 로직
	//@Test
	public void updateRefundStatus() throws Exception{
		//controller에서 환불처리할 예정
		ticketService.updateRefundStatus(30); //tranNo로 해당하는 결제내역에 refund_status를 0 -> 1 변경
		Transaction transaction = transactionService.getTransaction(30); //결제정보 get
		int point = transaction.getTranUsePoint(); //해당 결제에 사용했던 포인트 get
		User user = transaction.getBuyer();
		user.setUserPoint(point);
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
	@Test
	public void dateupdate() throws Exception{
	//refundableDate -> 전날 23시로 세팅
		String dateString = ticketService.getTicketInfo("20230604SSHH02023-A07").getGame().getGameDate();//ticketNo로 해당 티켓 정보가져옴(gameDate get위함)// 기존 날짜 및 시간
		System.out.println("dateString ? "+dateString);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate localDate = LocalDate.parse(dateString, formatter);
		LocalDate refundDate = localDate.minusDays(1);
		LocalDateTime refundDateTime = refundDate.atTime(23, 0, 0);
		System.out.println("refundDateTime??"+refundDateTime);
	}
}