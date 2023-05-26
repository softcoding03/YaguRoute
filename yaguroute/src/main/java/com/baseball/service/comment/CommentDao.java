package com.baseball.service.comment;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.baseball.service.domain.Comment;

@Mapper
public interface CommentDao {
	
	public void addComment(Comment comment) throws Exception;
	public Comment getComment(int commentNo) throws Exception;
	public void deleteComment(int commentNo) throws Exception;
	public List<Comment> getCommentList1(Comment comment) throws Exception;
	public List<Comment> getCommentList2(Comment comment) throws Exception;
}
