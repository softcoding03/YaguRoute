package com.baseball.test.post;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.baseball.common.domain.Search;
import com.baseball.service.domain.Post;
import com.baseball.service.domain.User;
import com.baseball.service.post.PostDao;
import com.baseball.service.post.PostService;


@SpringBootTest
public class TestPost{
	
	@Autowired
	@Qualifier("postServiceImpl")
	private PostService postService;
	
	@Autowired
	@Qualifier("postDao")
	private PostDao postDao;
	
	@Test
	public void testGetPost() throws Exception {
		System.out.println("get 시작");
		System.out.println("  쿼리 결과 값?"+postService.getPost(9));
		System.out.println("get 끝");
	}
	
	//특정 팀의 모든 게시글 조회
	//@Test
	public void getPostList() throws Exception{
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setSearchCondition("0");
		search.setSearchKeyword("love");
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("teamCode", "OB");
		map.put("search", search);
		map = postService.getPostList(map);
		
		List<Post> list = (List<Post>)map.get("postList");
		for(Post post:list) {
			System.out.println(post);
		}
		Integer totalCount = (Integer)map.get("totalCount");	
		System.out.println("총 레코드 수? "+totalCount);
	}
	
	//특정 팀의 게시글중에서 추천수가 가장 많은 5개 게시물 list get(추천수가 동일하면 조회수로 우선순위)
	//@Test
	public void getPostBestList() throws Exception{
		String teamCode ="OB";
		List<Post> list = postService.getPostBestList(teamCode);
		for(Post post:list) {
			System.out.println(post);
		}
	}
	
	//@Test
	public void testAddPost() throws Exception {
		System.out.println("insert 시작");
		Post post = new Post();
		User user = new User();
		user.setUserId("john123");
		post.setUser(user);
		post.setTeamCode("OB");
		post.setPostTitle("게시물 제목");
		post.setPostContents("게시물 내용");
			postService.addPost(post);
		System.out.println("insert 끝");
	}
	
	//@Test
	public void testDeletePost() throws Exception {
		System.out.println("delete 시작");
			postService.deletePost(11);
		System.out.println("delete 끝");
	}
	
	//@Test
	public void testUpdatePost() throws Exception {
		System.out.println("update 시작");
		Post post = new Post();
		post.setPostNo(10);
		post.setPostTitle("제목이 변경되었습니다.");
		post.setPostContents("내용이 변경되었습니다.");
			postService.updatePost(post);
		System.out.println("update 끝");
	}
	
	//@Test
	public void testgetLikes() throws Exception{
		System.out.println("getLikes() 시작");
		System.out.println("  select 결과값은?"+postService.getLikes(2));
		System.out.println("getLikes() 끝");
	}
	
	//@Test
	public void testgetDislikes() throws Exception{
		System.out.println("getDislikes() 시작");
		System.out.println("  select 결과값은?"+postService.getDislikes(2));
		System.out.println("getDislikes() 끝");
	}
	
	//@Test
	public void testaddViews() throws Exception{
		System.out.println("addViews() 시작");
		postService.addViews(1);
		System.out.println("addViews() 끝");
	}
	
	//좋아요 클릭 시 상태 변경 프로시저
	//@Test
	public void testaddLike() throws Exception{
		System.out.println("addlike프로시 시작");
		Post post = new Post();
		User user = new User();
		user.setUserId("john123");
		post.setUser(user);
		post.setPostNo(2);
		
		postService.addLike(post);
		System.out.println("addlike프로시 끝");
	}

	//싫어요 클릭 시 상태 변경 프로시저
	//@Test
	public void testaddDislike() throws Exception{
		System.out.println("adddislike프로시 시작");
		Post post = new Post();
		User user = new User();
		user.setUserId("john123");
		post.setUser(user);
		post.setPostNo(2);
		
		postService.addDislike(post);
		System.out.println("adddislike프로시 끝");
	}
	
}