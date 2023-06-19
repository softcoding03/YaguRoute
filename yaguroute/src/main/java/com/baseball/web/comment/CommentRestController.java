package com.baseball.web.comment;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.baseball.service.comment.CommentService;
import com.baseball.service.domain.Comment;
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
	@Qualifier("commentServiceImpl")
	private CommentService commentService;
	
	
	  @RequestMapping( value="addComment", method=RequestMethod.POST )
	  public Comment addComment(@ModelAttribute("comment") Comment comment, Model model,HttpSession session) throws Exception{
		System.out.println("/comment/rest/addComment : POST START");	
		System.out.println("-- 넘어온 데이터 ? "+comment); 
		User user = (User)session.getAttribute("user");
		comment.setUser(user);
		System.out.println("insert되는 comment? "+comment);
		
		commentService.addComment(comment); //insert
		int commentNo = commentService.getLastCommentNo();
		Comment commentData = commentService.getComment(commentNo); //get
		System.out.println("json 리턴하는 comment ? "+commentData);
		
		return commentData;
	  }
	  
	  @RequestMapping( value="updateComment", method=RequestMethod.POST )
	  public Comment updateComment(@ModelAttribute("comment") Comment comment, Model model,HttpSession session) throws Exception{
		System.out.println("/comment/rest/updateComment : POST START");	
		System.out.println("-- 넘어온 데이터 ? "+comment); 
		User user = (User)session.getAttribute("user");
		comment.setUser(user);
		System.out.println("update되는 comment? "+comment);
		commentService.updateComment(comment); //update
		int commentNo = comment.getCommentNo();
		Comment commentData = commentService.getComment(commentNo); //get
		System.out.println("json 리턴하는 comment ? "+commentData);
		
		return commentData;
	  }
	  
		
	  @RequestMapping( value="deleteComment/{commentNo}", method=RequestMethod.GET )
	public String deleteComment(@PathVariable("commentNo") int commentNo, Model model,HttpSession session) throws Exception {
		System.out.println("/comment/rest/deleteComment : GET START");	
		System.out.println("-- 넘어온 데이터 ? "+commentNo); 
		commentService.deleteComment(commentNo); //레코드가 삭제되지 않고 changed 칼럼이 2로 변경됨(0:x,1:수정됨,2:삭제됨)
		return "success";
	}
}
	
