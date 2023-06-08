package com.baseball.web.post;

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
@RequestMapping("/post/*")
public class PostController {
	
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
	
	public PostController(){
		System.out.println(this.getClass());
	}
	
	@GetMapping("getPost")
	public String getPost(@RequestParam("postNo") int postNo, Model model,HttpSession session) throws Exception {
			System.out.println("/post/getPost : GET START");
			System.out.println("-- 넘어온 데이터 ? "+postNo);	
			//post 정보+좋아요,싫어요 세팅
			Post post = postService.getPost(postNo);
			post.setPostLikes(postService.getLikes(postNo));
			post.setPostDislikes(postService.getDislikes(postNo));
			postService.addViews(postNo); //조회수 추가
			
			//해당 게시물에 emote 유무 판단 위한 Emote get 로직
			String userId = ((User)session.getAttribute("user")).getUserId();
			Emote emote = new Emote();
			emote.setPostNo(postNo);
			emote.setUserId(userId);
			emote = postService.getEmote(emote);
			System.out.println("emote 결과값?"+emote);
			System.out.println("-- 세팅된 post? "+post);
			
			//commentList 가져오기
			Comment comment = new Comment();
			comment.setPostNo(postNo);
			Map<String, Object> map = commentService.getCommentList(comment);
			List<Comment> list1 = (List<Comment>)map.get("list1"); //1레이어 댓글
			List<Comment> list2 = (List<Comment>)map.get("list2"); //2레이어 댓글
			for(Comment a:list1) {
				System.out.println("1레이어 댓글"+a);	
			}
			System.out.println("----------------------");
			for(Comment b:list2) {
				System.out.println("2레이어 댓글"+b);	
			}
			
			Team team = gameService.getTeamInfo(teamCode);
			
			model.addAttribute("commentList1", list1);
			model.addAttribute("commentList2", list2);
			model.addAttribute("emote", emote);
			model.addAttribute("post", post);
			model.addAttribute("teamCode", teamCode);
			model.addAttribute("team", team);
			return "forward:/post/getPost.jsp";
	}
	//전체글 리스트 조회
	@GetMapping("getPostList")
	public String getPostList(@RequestParam(value="teamCode", required = false) String teamCode,
								@RequestParam(value="postType", required = false) String postType,
								@RequestParam(value="currentPage", required = false) Integer currentPage ,
								@ModelAttribute("search") Search search,
								Model model, HttpSession session) throws Exception {
			System.out.println("/post/getPostList : GET START");
			System.out.println("-- 넘어온 데이터 ? "+teamCode+"//"+postType+"//"+currentPage+"//"+search);	
			User user = (User)session.getAttribute("user");
			teamCode = (teamCode == null) ? user.getTeamCode() : teamCode;
			currentPage = (currentPage == null) ? 1 : currentPage;
			search.setCurrentPage(currentPage);
			search.setPageSize(pageSize);
			
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("teamCode", teamCode);
			map.put("search", search);
			if(postType != null) {
				map.put("postType", postType);
			}
			map = postService.getPostList(map);
			List<Post> list = (List<Post>)map.get("postList");
			for(Post post:list) {
				System.out.println(post);
			}
			
			Integer totalCount = ((Integer)map.get("totalCount")).intValue();
			Page resultPage = new Page(search.getCurrentPage(),totalCount,pageUnit, pageSize);
			System.out.println("resultPage ? "+resultPage);
			
			//모든Team 정보 조회
			List<Team> allTeam = gameService.getAllTeam();
			
			model.addAttribute("list", list);
			model.addAttribute("resultPage", resultPage);
			model.addAttribute("allTeam", allTeam);
			model.addAttribute("teamCode", teamCode);
			return "forward:/post/listPost.jsp";
	}
	//Best 게시물 조회
	@GetMapping("getBestList")
	public String getBestList(@RequestParam("teamCode") String teamCode, Model model,@RequestParam(value="currentPage", required = false) Integer currentPage ,@ModelAttribute("search") Search search) throws Exception {
			System.out.println("/post/getBestList : GET START");
			System.out.println("-- 넘어온 데이터 ? "+teamCode);	
			
			//Best 3 게시물 조회
			List<Post> bestList = postService.getPostBestList(teamCode);
			for(Post post:bestList) {
				System.out.println("bestPost ?"+post);
			}
			//모든Team 정보 조회
			List<Team> allTeam = gameService.getAllTeam();
			Team team = gameService.getTeamInfo(teamCode);
			
			model.addAttribute("bestList",bestList);
			model.addAttribute("allTeam", allTeam);
			model.addAttribute("teamCode", teamCode);
			model.addAttribute("team", team);
			return "forward:/post/listPost.jsp";

	}
	//공지사항 조회
	@GetMapping("getNoticeList")
	public String getNoticeList(@RequestParam("teamCode") String teamCode, Model model,@RequestParam(value="currentPage", required = false) Integer currentPage ,@ModelAttribute("search") Search search) throws Exception {
			System.out.println("/post/getNoticeList : GET START");
			System.out.println("-- 넘어온 데이터 ? "+teamCode);	
			
			//공지사항 조회
			List<Post> noticeList = postService.getNoticeList(teamCode);
			for(Post post:noticeList) {
				System.out.println("bestPost ?"+post);
			}
			//모든Team 정보 조회
			List<Team> allTeam = gameService.getAllTeam();
			Team team = gameService.getTeamInfo(teamCode);

			
			model.addAttribute("noticeList",noticeList);
			model.addAttribute("allTeam", allTeam);
			model.addAttribute("teamCode", teamCode);
			model.addAttribute("team", team);
			return "forward:/post/listPost.jsp";

	}
	//본인작성게시물 조회
	@GetMapping("getMyPostList")
	public String getMyPostList(Model model,@RequestParam(value="currentPage", required = false) Integer currentPage ,@ModelAttribute("search") Search search,HttpSession session) throws Exception {
			System.out.println("/post/getMyPostList : GET START");
			User user = (User)session.getAttribute("user");
			String userId = user.getUserId();
			String teamCode = user.getTeamCode();
			
			System.out.println("-- 세팅 데이터? "+teamCode+"//"+currentPage+"//"+search);	
			currentPage = (currentPage == null) ? 1 : currentPage;
			search.setCurrentPage(currentPage);
			search.setPageSize(pageSize);
			
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("userId", userId);
			map.put("teamCode", teamCode);
			map.put("search", search);
			map = postService.getMyPostList(map);
			
			List<Post> list = (List<Post>)map.get("postList");
			for(Post post:list) {
				System.out.println(post);
			}

			//모든Team 정보 조회
			List<Team> allTeam = gameService.getAllTeam();
			Team team = gameService.getTeamInfo(teamCode);

			
			Integer totalCount = ((Integer)map.get("totalCount")).intValue();
			Page resultPage = new Page(search.getCurrentPage(),totalCount,pageUnit, pageSize);
			System.out.println("총 레코드 수? "+totalCount);
			
			model.addAttribute("list", list);
			model.addAttribute("resultPage", resultPage);
			model.addAttribute("allTeam", allTeam);
			model.addAttribute("teamCode", teamCode);
			model.addAttribute("team", team);
			return "forward:/post/listPost.jsp";

	}
	
	@GetMapping("addPost")
	public String addPostView(@RequestParam("teamCode") String teamCode,HttpSession session, Model model) throws Exception {
			System.out.println("/post/addPost : GET START");
			//userNickName, userImage 출력 위함
			User user = (User)session.getAttribute("user");
			System.out.println("-- 세팅된 user? "+user);
			model.addAttribute("user", user);
			model.addAttribute("teamCode", teamCode);
			return "forward:/post/addPostView.jsp";
	}
	
	
	@PostMapping("addPost")
	public String addPost(@ModelAttribute("post") Post post, Model model, HttpSession session) throws Exception {
			System.out.println("/post/addPost : POST START");	
			System.out.println("-- 넘어온 데이터 ? "+post); //화면에서 userId 히든으로 두고 post에서 같이 뽑을 것
			User user = (User)session.getAttribute("user");
			post.setUser(user);//post에 user정보 모두 저장해주기위함
			postService.addPost(post); //insert 완료
			int postNo = postService.getLastPostNo();
			Post post2 = postService.getPost(postNo);
			System.out.println("-- insert된 post는 ? "+post2);
			//post2.setPostLikes(postService.getLikes(postNo));
			//post2.setPostDislikes(postService.getDislikes(postNo));
			System.out.println("-- 세팅 후 보내는 ? "+post2);
			model.addAttribute("post", post2);
			return "forward:/post/getPost.jsp";
	}
	
	@GetMapping("updatePost")
	public String updatePostView(@RequestParam("postNo") int postNo, Model model,HttpSession session) throws Exception {
			System.out.println("/post/updatePost : GET START");
			Post post = postService.getPost(postNo);
			User user = (User)session.getAttribute("user");
			post.setUser(user);
			System.out.println("-- 세팅된 post? "+post);
			model.addAttribute("post", post);
			return "forward:/post/updatePostView.jsp";
	}
	

	
	@GetMapping("deletePost")
	public String deletePostView(@RequestParam("postNo") int postNo, HttpServletRequest request) throws Exception {
			System.out.println("/post/deletePost : GET START");
			String teamCode = postService.getPost(postNo).getTeamCode(); 
			postService.deletePost(postNo);
			System.out.println("--post삭제 완료");
			System.out.println(teamCode); //곧장 getPostList 메소드 실행하기 위한 parameter
			return "redirect:/post/getPostList?teamCode="+teamCode;
	}
	
	//작성중
	@GetMapping("getCommentList")
	public String getCommentList(@RequestParam("postNo") int postNo, Model model) throws Exception {
			System.out.println("/post/getCommentList : GET START");
			System.out.println("-- 넘어온 데이터 ? "+postNo);	
			
			Map<String, Object> map = new HashMap<String,Object>();
			map = postService.getPostList(map);
			
			List<Post> list = (List<Post>)map.get("postList");
			for(Post post:list) {
				System.out.println(post);
			}
			
			return "forward:/post/listComment.jsp";
	}
	
	
	
	/*
	 * @RequestMapping(value="analytics", method=RequestMethod.GET) public String
	 * analytics() throws Exception {
	 * 
	 * System.out.println("/post/analytics : GET");
	 * 
	 * return "forward:/etc/analytics.jsp"; }
	 */
} 