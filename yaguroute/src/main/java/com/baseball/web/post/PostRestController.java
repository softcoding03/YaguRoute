package com.baseball.web.post;

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
import com.baseball.service.post.PostService;
import com.baseball.service.user.UserService;

@RestController
@RequestMapping("/post/rest/*")
public class PostRestController {
	
		///Field
		@Autowired
		@Qualifier("postServiceImpl")
		private PostService postService;
		
		@Autowired
		@Qualifier("userServiceImpl")
		private UserService userService;
		
		public PostRestController(){
			System.out.println(this.getClass());
		}
		
		//좋아요 싫어요 동작
		@RequestMapping(value="addLike/{postNo}/{type}",method=RequestMethod.GET)
		public Map addLike(@PathVariable int postNo, @PathVariable String type,HttpSession session) throws Exception{
			System.out.println("/post/rest/addLike GET 시작");
			System.out.println("-- Param넘어온 것은??"+postNo+"//"+type);
			Map<String, Object> map = new HashMap<String, Object>();
			User user = (User)session.getAttribute("user");
			Post post = new Post();
			post.setUser(user);
			post.setPostNo(postNo);
			
			if(type.equals("Like")) {
				postService.addLike(post);
			} else if(type.equals("DisLike")) {
				postService.addDislike(post);
			}
			
			int likes = postService.getLikes(postNo);
			int disLikes = postService.getDislikes(postNo);
			
			map.put("likes", likes);
			map.put("disLikes", disLikes);
			return map;
		}
		
		public int addDislike() throws Exception{
			return 0;
		}
}