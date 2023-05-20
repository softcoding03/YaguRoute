package com.baseball.service.comment;

import java.util.List;

import com.baseball.service.domain.Comment;

public interface CommentService {
	
	public void addComment(Comment comment) throws Exception;
	public void deleteComment(int commentNo) throws Exception;
	public List<Comment> getCommentList(Comment comment) throws Exception;
}
