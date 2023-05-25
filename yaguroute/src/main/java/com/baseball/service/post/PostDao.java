package com.baseball.service.post;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.baseball.service.domain.Post;

@Mapper
public interface PostDao {
	public Post getPost(int postNo) throws Exception;
	public List<Post> getPostList(String teamCode) throws Exception;
	public List<Post> getPostBestList(String teamCode) throws Exception;
	public void addPost(Post post) throws Exception;
	public void deletePost(int postNo) throws Exception;
	public void updatePost(Post post) throws Exception;
	public int getLikes(int postNo) throws Exception;
	public int getDislikes(int postNo) throws Exception;
	public void addLike(Post post) throws Exception;
	public void addDislike(Post post) throws Exception;
	public void addViews(int postNo) throws Exception;
}