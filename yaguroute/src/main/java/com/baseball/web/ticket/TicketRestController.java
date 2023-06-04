package com.baseball.web.ticket;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.baseball.service.domain.Game;
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
				game.getHomeTeam().getTeamNickName()+" 경기가 예매되었습니다.";
		
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
						game.getHomeTeam().getTeamNickName()+" 경기의 예매 내역이 취소되었습니다."+
						"[취소 내역] 취소 금액:"+transaction.getTranTotalPrice()+
						" 결제취소시각:"+transaction.getTranDate(); 
			result = importAPIRestService.sendSMS(contents, userPhone); //번호와 내용을 변수로 보내줄 것
			System.out.println("SMS전송 요청 결과는?"+result);
			resultData = "success";
		} else {
			System.out.println("환불 요청 실패...");
			resultData = "fail";
		}
		return resultData;
	}
	
}