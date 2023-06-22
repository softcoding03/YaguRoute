package com.baseball.web.main;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
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
import com.baseball.service.domain.Product;
import com.baseball.service.domain.TranDetail;
import com.baseball.service.domain.User;
import com.baseball.service.game.GameService;
import com.baseball.service.post.PostService;
import com.baseball.service.trandetail.TranDetailService;
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
	
	@Autowired
	@Qualifier("tranDetailServiceImpl")
	private TranDetailService tranDetailService;

	@Value("${commonProperties.pageUnit}")
	int pageUnit;
	
	// @Value("${commonProperties.pageSize}") 
	int pageSize = 10;
	
	public MainController(){
		System.out.println(this.getClass());
	}
	
	@GetMapping("getMain")
	public String getMain(Model model, HttpSession session) throws Exception {
			System.out.println("/main/getMain : GET START");
			//공지사항 출력
			List<String> postDateList = new ArrayList<>();
			List<Post> noticeList = postService.getNoticeList(); //공지사항 리스트
			/* System.out.println("noticeList ? "+noticeList); */
			for(Post post:noticeList) { //postDate 형식 변경 2023-06-13T00:31:03 -> 2023년 6월 13일
				LocalDate postDate = post.getPostDate().toLocalDate();
				DateTimeFormatter koreanFormatter = DateTimeFormatter.ofPattern("yyyy년 M월 d일");
				String postDateKorean = postDate.format(koreanFormatter);
				postDateList.add(postDateKorean);
			}
			
			//loading_img session에 추가
			String[] imgList = {
					"/images/baseball/loading_img_01.png",
	                "/images/baseball/loading_img_02.png",
	                "/images/baseball/loading_img_03.jpg",
	                "/images/baseball/loading_img_04.png"
			};
			int randonIndex = new Random().nextInt(4);
			String img = imgList[randonIndex];
			
			session.setAttribute("loadingImg", img);
			
		
			/*
			 * System.out.println("postDateList ? "+postDateList); // End
			 */
			
			//BEST 게시물 5개 출력
			List<Post> bestPostList = postService.getPostBestList("ALL");
			System.out.println(bestPostList);
			
			//판매인기상품 출력
			List<TranDetail> bestTranList = tranDetailService.getBestTranList();
			/*
			 * for(TranDetail bestList : bestTranList) { System.out.println(bestList); }
			 */
			

			
			model.addAttribute("noticeList", noticeList);
			model.addAttribute("postDateList", postDateList);
			model.addAttribute("bestPostList", bestPostList);
			model.addAttribute("bestTranList", bestTranList);	
			
			return "forward:/main.jsp";
	}
	
} 