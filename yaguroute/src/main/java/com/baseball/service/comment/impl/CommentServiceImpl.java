package com.baseball.service.comment.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.baseball.service.comment.CommentDao;
import com.baseball.service.comment.CommentService;
import com.baseball.service.domain.Comment;


@Service("commentServiceImpl")


public class CommentServiceImpl implements CommentService {
	
	@Autowired
	@Qualifier("commentDao")
	CommentDao commentDao;
			
	@Override
	public void addComment(Comment comment) throws Exception {
		commentDao.addComment(comment);
	}

	@Override
	public void deleteComment(int commentNo) throws Exception {
		commentDao.deleteComment(commentNo);
	}

	@Override
	public List<Comment> getCommentList(Comment comment) throws Exception {
		return commentDao.getCommentList(comment);
	}
	
	
}