package com.baseball.web.ticket;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.baseball.service.domain.Game;
import com.baseball.service.domain.User;
import com.baseball.service.game.GameService;
import com.baseball.service.importAPI.ImportAPIRestService;
import com.baseball.service.ticket.TicketService;
import com.baseball.service.user.UserService;

@RestController
@RequestMapping("/ticket/rest/*")
public class TicketRestController {
	
	///Field
	@Autowired
	@Qualifier("ticketServiceImpl")
	private TicketService ticketService;
	
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
		System.out.println("넘어온 gameCode?"+gameCode);
		User user = (User)session.getAttribute("user");
		Game game = gameService.getGameInfo(gameCode); // 게임 정보
		String userPhone = user.getUserPhone(); //수신자 번호
		String contents; //메세지 내용
		contents = user.getUserName()+"님 "+
				game.getGameDate()+" "+game.getGameTime()+
				game.getAwayTeam().getTeamNickName()+" vs "+
				game.getHomeTeam().getTeamNickName()+" 경기가 예매되었습니다.";
		
		String result = importAPIRestService.sendSMS(contents, userPhone); //번호와 내용을 변수로 보내줄 것
		System.out.println("SMS전송 요청 결과는?"+result);
		return result;
	}
}