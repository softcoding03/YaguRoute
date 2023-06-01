package com.baseball.web.ticket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.baseball.common.domain.Search;
import com.baseball.service.domain.Game;
import com.baseball.service.domain.Ticket;
import com.baseball.service.domain.Transaction;
import com.baseball.service.domain.User;
import com.baseball.service.game.GameService;
import com.baseball.service.ticket.TicketService;
import com.baseball.service.transaction.TransactionService;
import com.baseball.service.user.UserService;

@Controller
@RequestMapping("/ticket/*")
public class TicketController {
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
	
	public TicketController() {
		System.out.println(this.getClass());
	}
	
	//GameList 현재로부터 2주치 경기스케줄 get
	@GetMapping("getGameList2w")
	public String getGameList2w(@RequestParam("teamCode") String teamCode,Model model) throws Exception{
		System.out.println("/ticket/getGameList2w : GET START");
		System.out.println("넘어온 데이터?"+teamCode);
		if(teamCode == null) {
			teamCode ="HH";
		}
		List<Game> list = gameService.getGameListTwoWeeks(teamCode); //현재시간부터 14일이내 경기 리스트 가져옴.
		for(Game game:list) {
			System.out.println(game);
		}
		model.addAttribute("gameList", list);
		
		return "forward:/ticket/listGameTwoWeeks.jsp";
	}
	
	//해당 게임 총 판매 티켓 수
	@GetMapping("getStadium")
	public String getStadium(@RequestParam("gameCode") String gameCode,Model model) throws Exception{
		System.out.println("/ticket/getStadium : GET START");
		System.out.println("넘어온 데이터?"+gameCode);
		Game game = gameService.getGameInfo(gameCode); //game에 대한 정보 (stadium 이미지 및 해당 경기 정보출력위함)
		int salesTicket = 60 - ticketService.getSalesTicket(gameCode); // 현재 판매된 티켓 수
		
		System.out.println("넘겨주는 데이터?"+game+"//"+salesTicket);
		model.addAttribute("salesTicket", salesTicket);
		model.addAttribute("game", game);
		return "forward:/ticket/getStadium.jsp";
	}
	
	//해당 game의 티켓 정보 모두 get (60개) -> 좌석선택위함
	@GetMapping("getSeats")
	public String getSeats(@RequestParam("gameCode") String gameCode,Model model) throws Exception{
		System.out.println("/ticket/getSeats : GET START");
		System.out.println("넘어온 데이터?"+gameCode);
		List<Ticket> list = ticketService.getTickets(gameCode); //60장 정보
		for(Ticket ticket:list) {
			System.out.println("tickets ? "+ticket);
		}
		model.addAttribute("ticketList", list);
		return "forward:/ticket/getSeats.jsp";
	}
	
	//티켓 결제 후 해당 정보(transaction add + ticket update)
	@PostMapping("addTicketPurchase")
	public String addTicketPurchase(@ModelAttribute("transaction") Transaction transaction, Model model,HttpSession session) throws Exception{
		System.out.println("/ticket/addTicketPurchase : POST START");
		System.out.println("넘어온 데이터?"+transaction);
		User user = (User)session.getAttribute("user");
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
		
		return "forward:/ticket/getTickets.jsp";
	}
	
	//userId로 ticket 결제내역 List get
	@GetMapping("getPurchaseList")
	public String getPurchaseList() throws Exception{
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
		return "forward:/ticket/getTickets.jsp";
	}
	
	//결제번호에 해당하는 ticket List get
	@GetMapping("getTicketPurchaseList")
	public String getTicketPurchaseList() throws Exception{
		int tranNo = 30; //화면에서 보내줄 예정
		Game game=gameService.getGameInfo(ticketService.getGameCode(tranNo)); //게임정보세팅
		List<Ticket> list = ticketService.getTicketPurchaseList(tranNo); //tranNo에 해당하는 티켓 정보들 get
		System.out.println("tranNO에 해당하는 티켓 list ?? "+list);
		return "forward:/ticket/getTickets.jsp";
	}
	
}