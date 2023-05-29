package com.baseball.web.post;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import com.baseball.service.domain.Post;
import com.baseball.service.domain.User;
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

	@Value("${commonProperties.pageUnit}")
	int pageUnit;
	
	// @Value("${commonProperties.pageSize}") 
	int pageSize = 10;
	
	public PostController(){
		System.out.println(this.getClass());
	}
	
	@GetMapping("getPost")
	public String getPost(@RequestParam("postNo") int postNo, Model model) throws Exception {
			System.out.println("/post/getPost : GET");
			System.out.println("-- 넘어온 데이터 ? "+postNo);	
			//post 정보+좋아요,싫어요 세팅
			Post post = postService.getPost(postNo);
			post.setPostLikes(postService.getLikes(postNo));
			post.setPostDislikes(postService.getDislikes(postNo));
			postService.addViews(postNo); //조회수 추가
			System.out.println("-- 세팅된 post? "+post);
			model.addAttribute("post", post);
			return "forward:/post/getPost.jsp";
	}
	
	@GetMapping("getPostList")
	public String getPostList(@RequestParam("teamCode") String teamCode, Model model,@RequestParam(value="currentPage", required = false) Integer currentPage ,@ModelAttribute("search") Search search) throws Exception {
			System.out.println("/post/getPostList : GET");
			System.out.println("-- 넘어온 데이터 ? "+teamCode+"//"+currentPage+"//"+search);	
			currentPage = (currentPage == null) ? 1 : currentPage;
			search.setCurrentPage(currentPage);
			search.setPageSize(pageSize);
			
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("teamCode", teamCode);
			map.put("search", search);
			map = postService.getPostList(map);
			
			List<Post> list = (List<Post>)map.get("postList");
			for(Post post:list) {
				System.out.println(post);
			}
			
			Integer totalCount = ((Integer)map.get("totalCount")).intValue();
			Page resultPage = new Page(search.getCurrentPage(),totalCount,pageUnit, pageSize);
			System.out.println("총 레코드 수? "+totalCount);
			
			model.addAttribute("list", list);
			model.addAttribute("resultPage", resultPage);
			return "forward:/post/listPost.jsp";
	}
	
	
	@GetMapping("addPost")
	public String addPostView(@RequestParam("teamCode") String teamCode,HttpServletRequest session, Model model) throws Exception {
			System.out.println("/post/addPost : GET");
			//userNickName, userImage 출력 위함
			//User user = (User)session.getAttribute("user");
			User user = userService.getUser("rockseong3");
			System.out.println("-- 세팅된 user? "+user);
			model.addAttribute("user", user);
			model.addAttribute("teamCode", teamCode);
			return "forward:/post/addPostView.jsp";
	}
	
	
	@PostMapping("addPost")
	public String addPost(@ModelAttribute("post") Post post, Model model) throws Exception {
			System.out.println("/post/addPost : POST");	
			System.out.println("-- 넘어온 데이터 ? "+post); //화면에서 userId 히든으로 두고 post에서 같이 뽑을 것
			post.setUser(userService.getUser(post.getUser().getUserId()));//post에 user정보 모두 저장해주기위함
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
	public String updatePostView(@RequestParam("postNo") int postNo, Model model) throws Exception {
			System.out.println("/post/updatePost : GET");
			postNo = 53;
			Post post = postService.getPost(postNo);
			User user = userService.getUser(post.getUser().getUserId());
			post.setUser(user);
			System.out.println("-- 세팅된 post? "+post);
			model.addAttribute("post", post);
			return "forward:/post/updatePostView.jsp";
	}
	
	@PostMapping("updatePost")
	public String updatePost(@ModelAttribute("post") Post post, Model model) throws Exception {
			System.out.println("/post/updatePost : POST");	
			System.out.println("-- 넘어온 데이터 ? "+post); //화면에서 userId 히든으로 두고 post에서 같이 뽑을 것
			postService.updatePost(post); //update 완료
			System.out.println("update 완료");
			Post post2 = postService.getPost(53);
			System.out.println("수정된 post"+post2);
			model.addAttribute("post", post2);
			return "forward:/post/getPost.jsp";
	}
	
	@GetMapping("deletePost")
	public String deletePostView(@RequestParam("postNo") int postNo, HttpServletRequest request) throws Exception {
			System.out.println("/post/deletePost : GET");
			postNo = 24;
			String teamCode = postService.getPost(postNo).getTeamCode(); 
			postService.deletePost(postNo);
			System.out.println("--post삭제 완료");
			System.out.println(teamCode); //곧장 getPostList 메소드 실행하기 위한 parameter
			return "redirect:/post/getPostList?teamCode="+teamCode;
	}
	
	//작성중
	@GetMapping("getCommentList")
	public String getCommentList(@RequestParam("postNo") int postNo, Model model) throws Exception {
			System.out.println("/post/getCommentList : GET");
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