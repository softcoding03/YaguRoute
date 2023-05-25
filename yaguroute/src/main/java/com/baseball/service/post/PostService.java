package com.baseball.service.post;

import java.util.List;
import java.util.Map;

import com.baseball.service.domain.Post;

public interface PostService {
	
	public Post getPost(int postNo) throws Exception;
	public Map<String,Object> getPostList(Map<String,Object> map) throws Exception; //해당 팀의 전체 게시글 조회
	public List<Post> getPostBestList(String teamCode) throws Exception; //해당 팀의 전체 게시글 중 좋아요 순위로 1~5위까지 get list
	public void addPost(Post post) throws Exception;
	public void deletePost(int postNo) throws Exception;
	public void updatePost(Post post) throws Exception;
	public int getLikes(int postNo) throws Exception; //해당 게시물 좋아요 수
	public int getDislikes(int postNo) throws Exception; //해당 게시물 싫어요 수
	public void addLike(Post post) throws Exception; //좋아요 버튼 클릭
	public void addDislike(Post post) throws Exception; //싫어요 버튼 클릭
	public void addViews(int postNo) throws Exception; //조회수 추가
	
}
