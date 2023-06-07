package com.baseball.service.post;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.baseball.service.domain.Emote;
import com.baseball.service.domain.Post;

@Mapper
public interface PostDao {
	public Post getPost(int postNo) throws Exception;
	public List<Post> getPostList(Map<String,Object> map) throws Exception;
	public List<Post> getMyPostList(Map<String,Object> map) throws Exception;
	public List<Post> getPostBestList(String teamCode) throws Exception;
	public List<Post> getNoticeList(String teamCode) throws Exception;
	public Emote getEmote(Emote emote) throws Exception;
	public void addPost(Post post) throws Exception;
	
	//게시물 삭제(본문,댓글,emote 모두 삭제)
	public void deletePost(int postNo) throws Exception;
	public void deleteEmote(int postNo) throws Exception;
	public void updateComment(int postNo) throws Exception;
	
	public void updatePost(Post post) throws Exception;
	public int getLikes(int postNo) throws Exception;
	public int getDislikes(int postNo) throws Exception;
	public void addLike(Post post) throws Exception;
	public void addDislike(Post post) throws Exception;
	public void addViews(int postNo) throws Exception;
	public int getTotalCount(Map<String,Object> map) throws Exception;
	public int getLastPostNo() throws Exception;
}