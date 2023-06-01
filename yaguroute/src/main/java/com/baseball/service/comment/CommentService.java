package com.baseball.service.comment;

import java.util.Map;

import com.baseball.service.domain.Comment;

public interface CommentService {
	
	public void addComment(Comment comment) throws Exception;
	public void updateComment(Comment comment) throws Exception;
	public Comment getComment(int commentNo) throws Exception;
	public void deleteComment(int commentNo) throws Exception;
	public Map<String,Object> getCommentList(Comment comment) throws Exception;
}
