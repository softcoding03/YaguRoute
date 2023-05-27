package com.baseball.web.post;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	public PostController(){
		System.out.println(this.getClass());
	}
	
	@GetMapping("getPost")
	public String getPost(@RequestParam("postNo") int postNo, Model model) throws Exception {
			System.out.println("/post/getPost : GET");
			System.out.println("@@ 넘어온 데이터 ? "+postNo);	
			//post 정보+좋아요,싫어요 세팅
			Post post = postService.getPost(postNo);
			post.setPostLikes(postService.getLikes(postNo));
			post.setPostDislikes(postService.getDislikes(postNo));
			
			System.out.println("@@ 세팅된 post? "+post);
			model.addAttribute("post", post);
			return "forward:/post/getPost.jsp";
	}
	
	@GetMapping("getPostList")
	public String getPostList(@RequestParam("teamCode") String teamCode, Model model) throws Exception {
			System.out.println("/post/getPostList : GET");
			System.out.println("@@ 넘어온 데이터 ? "+teamCode);	
			Search search = new Search();
			search.setCurrentPage(1);
			search.setPageSize(5);
			//search.setSearchCondition("0");
			//search.setSearchKeyword("love");
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("teamCode", teamCode);
			map.put("search", search);
			map = postService.getPostList(map);
			List<Post> list = (List<Post>)map.get("postList");
			for(Post post:list) {
				System.out.println(post);
			}
			Integer totalCount = (Integer)map.get("totalCount");	
			System.out.println("총 레코드 수? "+totalCount);
			model.addAttribute("list", list);
			return "forward:/post/listPost.jsp";
	}
	
	
	@GetMapping("addPost")
	public String addPostView(@RequestParam("teamCode") String teamCode,HttpServletRequest session, Model model) throws Exception {
			System.out.println("/post/addPost : GET");
			//userNickName, userImage 출력 위함
			//User user = (User)session.getAttribute("user");
			User user = userService.getUser("rockseong3");
			System.out.println("@@ 세팅된 user? "+user);
			model.addAttribute("user", user);
			model.addAttribute("teamCode", teamCode);
			return "forward:/post/addPostView.jsp";
	}
	
	
	@PostMapping("addPost")
	public String addPost(@ModelAttribute("post") Post post, Model model, RedirectAttributes redirect) throws Exception {
			System.out.println("/post/addPost : POST");	
			System.out.println("@@ 넘어온 데이터 ? "+post); //화면에서 userId 히든으로 두고 post에서 같이 뽑을 것
			post.setUser(userService.getUser(post.getUser().getUserId()));//post에 user정보 모두 저장해주기위함
			postService.addPost(post); //insert 완료
			int postNo = postService.getLastPostNo();
			Post post2 = postService.getPost(postNo);
			System.out.println("@@ insert된 post는 ? "+post2);
			post2.setPostLikes(postService.getLikes(postNo));
			post2.setPostDislikes(postService.getDislikes(postNo));
			System.out.println("@@ 세팅 후 보내는 ? "+post2);
			model.addAttribute("post", post2);
			return "forword:/post/getPost.jsp";
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