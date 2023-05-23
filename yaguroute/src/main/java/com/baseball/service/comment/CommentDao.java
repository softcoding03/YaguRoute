package com.baseball.service.comment;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.baseball.service.domain.Comment;

@Mapper
public interface CommentDao {
	
	public void addComment(Comment comment) throws Exception;
	public void deleteComment(int commentNo) throws Exception;
	public List<Comment> getCommentList(Comment comment) throws Exception;
}
