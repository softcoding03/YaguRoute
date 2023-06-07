package com.baseball.service.post.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.baseball.common.domain.Search;
import com.baseball.service.domain.Emote;
import com.baseball.service.domain.Post;
import com.baseball.service.post.PostDao;
import com.baseball.service.post.PostService;


@Service("postServiceImpl")

//@Transactional()
public class PostServiceImpl implements PostService {
	
	@Autowired
	@Qualifier("postDao")
	PostDao postDao;
	
	public PostServiceImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public Post getPost(int postNo) throws Exception {
		return postDao.getPost(postNo);
	}

	@Override
	public void addPost(Post post) throws Exception {
		postDao.addPost(post);
	}

	@Override
	public void deletePost(int postNo) throws Exception {
		postDao.deletePost(postNo);
		postDao.deleteEmote(postNo);
		postDao.updateComment(postNo);
	}
	
	@Override
	public void updatePost(Post post) throws Exception {
		postDao.updatePost(post);
	}

	@Override
	public void addLike(Post post) throws Exception {
		postDao.addLike(post);
	}

	@Override
	public void addDislike(Post post) throws Exception {
		postDao.addDislike(post);
	}

	@Override
	public int getLikes(int postNo) throws Exception {
		return postDao.getLikes(postNo);
	}

	@Override
	public int getDislikes(int postNo) throws Exception {
		return postDao.getDislikes(postNo);
	}

	@Override
	public void addViews(int postNo) throws Exception {
		postDao.addViews(postNo);
	}

	@Override
	public Map<String,Object> getPostList(Map<String,Object> map) throws Exception {
		List<Post> list = postDao.getPostList(map);
		int totalCount = postDao.getTotalCount(map);
		
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("postList", list);
		resultMap.put("totalCount", new Integer(totalCount));
		return resultMap;
	}
	
	@Override
	public Map<String,Object> getMyPostList(Map<String,Object> map) throws Exception {
		List<Post> list = postDao.getMyPostList(map);
		int totalCount = postDao.getTotalCount(map);
		
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("postList", list);
		resultMap.put("totalCount", new Integer(totalCount));
		return resultMap;
	}

	@Override
	public List<Post> getPostBestList(String teamCode) throws Exception {
		return postDao.getPostBestList(teamCode);
	}

	@Override
	public int getLastPostNo() throws Exception {
		return postDao.getLastPostNo();
	}

	@Override
	public List<Post> getNoticeList(String teamCode) throws Exception {
		return postDao.getNoticeList(teamCode);
	}

	@Override
	public Emote getEmote(Emote emote) throws Exception {
		return postDao.getEmote(emote);
	}
	
}
