package com.baseball.service.post.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baseball.service.domain.Post;
import com.baseball.service.post.PostDao;
import com.baseball.service.post.PostService;


@Service("postServiceImpl")

//@Transactional()
public class PostServiceImpl implements PostService {
	
	@Autowired
	@Qualifier("postDao")
	PostDao postDao;
	
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
	
}
