package com.baseball.web.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.baseball.common.domain.Page;
import com.baseball.common.domain.Search;
import com.baseball.common.domain.Team;
import com.baseball.service.comment.CommentService;
import com.baseball.service.domain.Comment;
import com.baseball.service.domain.Emote;
import com.baseball.service.domain.Post;
import com.baseball.service.domain.User;
import com.baseball.service.game.GameService;
import com.baseball.service.post.PostService;
import com.baseball.service.user.UserService;


//==> 게시판관리 Controller
@Controller
@RequestMapping("/main/*")
public class MainController {
	
	///Field
	@Autowired
	@Qualifier("postServiceImpl")
	private PostService postService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("gameServiceImpl")
	private GameService gameService;
	
	@Autowired
	@Qualifier("commentServiceImpl")
	private CommentService commentService;

	@Value("${commonProperties.pageUnit}")
	int pageUnit;
	
	// @Value("${commonProperties.pageSize}") 
	int pageSize = 10;
	
	public MainController(){
		System.out.println(this.getClass());
	}
	
	@GetMapping("getMain")
	public String getMain(Model model,HttpSession session) throws Exception {
			System.out.println("/main/getMain : GET START");
			
			List<Post> noticeList = postService.getNoticeList("all"); //공지사항 리스트
			
			model.addAttribute("noticeList", noticeList);
			return "forward:/main.jsp";
	}
} 