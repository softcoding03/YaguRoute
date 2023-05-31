package com.baseball.web.comment;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baseball.service.comment.CommentService;
import com.baseball.service.domain.Comment;
import com.baseball.service.domain.User;
import com.baseball.service.user.UserService;

@Controller
@RequestMapping("/comment/*")
public class CommentController {
	
	///Field
	@Autowired
	@Qualifier("commentServiceImpl")
	private CommentService commentService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public CommentController(){
		System.out.println(this.getClass());
	}
	
	@PostMapping("addComment")
	public String addComment(@ModelAttribute("comment") Comment comment, Model model,HttpSession session) throws Exception {
		System.out.println("/comment/addComment : POST START");	
		System.out.println("-- 넘어온 데이터 ? "+comment); 
		User user = (User)session.getAttribute("user");
		comment.setUser(user);
		System.out.println("insert되는 comment? "+comment);
		commentService.addComment(comment);
		
		return "forward:/post/get.jsp";
	}
}