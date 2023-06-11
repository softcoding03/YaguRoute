package com.baseball.web.comment;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.baseball.service.comment.CommentService;
import com.baseball.service.domain.Game;
import com.baseball.service.domain.Ticket;
import com.baseball.service.domain.Transaction;
import com.baseball.service.domain.User;
import com.baseball.service.post.PostService;
import com.baseball.service.user.UserService;

@RestController
@RequestMapping("/comment/rest/*")
public class CommentRestController {
	
	///Field
	@Autowired
	@Qualifier("postServiceImpl")
	private PostService postService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("commentServiceImpl")
	private CommentService commentService;
	
	/*
	 * @RequestMapping( value="sendSMS/{gameCode}", method=RequestMethod.GET )
	 * public String sendSMS(@PathVariable String gameCode, HttpSession session)
	 * throws Exception{ System.out.println(":: /ticket/rest/sendSMS START");
	 * 
	 * return result; }
	 * 
	 * 
	 * @RequestMapping( value="refund/{tranNo}", method=RequestMethod.GET ) public
	 * String refund(@PathVariable int tranNo, HttpSession session) throws
	 * Exception{ System.out.println(":: /ticket/rest/refund START"); return
	 * resultData; }
	 */
}
	
