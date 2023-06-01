package com.baseball.web.ticket;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.baseball.service.domain.Post;
import com.baseball.service.domain.User;
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
	/*
	@RequestMapping(value="pickSeat/{ticketNo}",method=RequestMethod.GET)
	public Map addLike(@PathVariable String ticketNo,HttpSession session) throws Exception{
		System.out.println("/ticket/rest/pickSeat GET 시작");
		System.out.println("-- Param넘어온 것은??"+ticketNo);
		ticketService.getT
		return map;
	}*/
	
}