package com.baseball.web.ticket;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.baseball.service.domain.Game;
import com.baseball.service.domain.Ticket;
import com.baseball.service.domain.Transaction;
import com.baseball.service.domain.User;
import com.baseball.service.game.GameService;
import com.baseball.service.importAPI.ImportAPIRestService;
import com.baseball.service.ticket.TicketService;
import com.baseball.service.transaction.TransactionService;
import com.baseball.service.user.UserService;

@RestController
@RequestMapping("/ticket/rest/*")
public class TicketRestController {
	
	///Field
	@Autowired
	@Qualifier("ticketServiceImpl")
	private TicketService ticketService;
	
	@Autowired
	@Qualifier("transactionServiceImpl")
	private TransactionService transactionService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("gameServiceImpl")
	private GameService gameService;
	
	@Autowired
	@Qualifier("importAPIRestServiceImpl")
	private ImportAPIRestService importAPIRestService;
	
	@RequestMapping( value="sendSMS/{gameCode}", method=RequestMethod.GET )
	public String sendSMS(@PathVariable String gameCode, HttpSession session) throws Exception{
		System.out.println(":: /ticket/rest/sendSMS START");
		System.out.println("넘어온 gameCode?"+gameCode);
		User user = (User)session.getAttribute("user");
		Game game = gameService.getGameInfo(gameCode); // 게임 정보
		String userPhone = user.getUserPhone(); //수신자 번호
		String contents; //메세지 내용
		contents = user.getUserName()+"님 "+
				game.getGameDate()+" "+game.getGameTime()+" "+
				game.getAwayTeam().getTeamNickName()+" vs "+
				game.getHomeTeam().getTeamNickName()+" 경기가 예매되었습니다. \n *결제취소는 경기시작 하루 전 23시까지 가능합니다. \n -야구루트-";
		
		String result = importAPIRestService.sendSMS(contents, userPhone); //번호와 내용을 변수로 보내줄 것
		System.out.println("SMS전송 요청 결과는?"+result);
		return result;
	}
	
	
	@RequestMapping( value="refund/{tranNo}", method=RequestMethod.GET )
	public String refund(@PathVariable int tranNo, HttpSession session) throws Exception{
		System.out.println(":: /ticket/rest/refund START");
		System.out.println("넘어온 tranNo?"+tranNo);
		String resultData;
		User user = (User)session.getAttribute("user");
		String userPhone = user.getUserPhone(); //수신자 번호
		String contents; //메세지 내용
		Transaction transaction = transactionService.getTransaction(tranNo);
		String merchantNo = transaction.getMerchantNo();
		
		String result = importAPIRestService.importRefund(merchantNo, 0); //환불 요청 rest
		if(result.equals("success")) {
			System.out.println("환불 성공");
			ticketService.getTicketPurchaseList(tranNo);
			ticketService.updateRefundStatus(tranNo); // transaction의 refund_status를 0->1 변경 & tranDate 취소시각으로 update
			transaction = transactionService.getTransaction(tranNo); //update된 transaction
			String gameCode = ticketService.getGameCode(tranNo); //tranNo로 gameCode하나 가져오기
			Game game = gameService.getGameInfo(gameCode); // gameCode로 게임 정보 가져오기
			
			contents = user.getUserName()+"님 "+
						game.getGameDate()+" "+game.getGameTime()+" "+
						game.getAwayTeam().getTeamNickName()+" vs "+
						game.getHomeTeam().getTeamNickName()+" 경기의 예매 내역이 취소되었습니다. \n"+
						"[취소 내역] \n 취소 금액:"+transaction.getTranTotalPrice()+"원"+
						"\n결제취소시각:"+transaction.getTranDate()+"\n -야구루트-"; 
			result = importAPIRestService.sendSMS(contents, userPhone); //번호와 내용을 변수로 보내줄 것
			System.out.println("SMS전송 요청 결과는?"+result);
			resultData = "success";
		} else {
			System.out.println("환불 요청 실패...");
			resultData = "fail";
		}
		return resultData;
	}
	
	//좌석 클릭 시 좌석 상태 check
	@RequestMapping( value="checkStatus/{ticketNoList}", method=RequestMethod.GET )
	public List<String> checkSeat(@PathVariable String ticketNoList, HttpSession session) throws Exception{
		System.out.println(":: /ticket/rest/checkStatus START");
		System.out.println("넘어온 ticketNoList?"+ticketNoList);
		List<String> list = new ArrayList<>();
		String regex = "(?<=\\G.{21})"; //문자 21개 기준으로 파싱
		String[] array = ticketNoList.split(regex);
		for(String ticketNo:array) {
			Ticket ticket = ticketService.getTicketInfo(ticketNo);
			if(ticket.getTicketStatus() ==1) {
				String seatCode = ticketNo.substring(18);
				list.add(seatCode); //판매완료된 ticket이면 좌석번호만 따서 list에 담음
			}
		}
		System.out.println("결과는 ?"+list);
		return list;
	}
	
	//결제하기 클릭 시 좌석상태코드 1(판매완료)로 변경
	@RequestMapping( value="updateTicketStatus1/{ticketNoList}", method=RequestMethod.GET )
	public String updateTicketStatus1(@PathVariable String ticketNoList, HttpSession session) throws Exception{
		System.out.println(":: /ticket/rest/updateTicketStatus1 START");
		System.out.println("넘어온 ticketNoList?"+ticketNoList);
		String regex = "(?<=\\G.{21})";
		String[] array = ticketNoList.split(regex);
		
		for(String ticketNo:array) {
			Ticket ticket = ticketService.getTicketInfo(ticketNo);
			ticket.setTicketStatus(1);
			ticketService.updateTicketStatus(ticket);
		}
		
		System.out.println(ticketNoList+"의 ticketStatus를 1로 변경완료");
		return "success";
	}
	//결제 취소혹은 실패 시 좌석상태코드 0(판매중)로 변경
	@RequestMapping( value="updateTicketStatus0/{ticketNoList}", method=RequestMethod.GET )
	public String updateTicketStatus0(@PathVariable String ticketNoList, HttpSession session) throws Exception{
		System.out.println(":: /ticket/rest/updateTicketStatus0 START");
		System.out.println("넘어온 ticketNo?"+ticketNoList);
		String regex = "(?<=\\G.{21})"; //문자 21개 기준으로 파싱
		String[] array = ticketNoList.split(regex);
		
		for(String ticketNo:array) {
			Ticket ticket = ticketService.getTicketInfo(ticketNo);
			ticket.setTicketStatus(0);
			ticketService.updateTicketStatus(ticket);
		}
		
		System.out.println(ticketNoList+"의 ticketStatus를 0으로 변경완료");
		return "success";
	}
	
}