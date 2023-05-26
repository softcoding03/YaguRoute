package com.baseball.service.comment.impl;

import java.util.HashMap;
import java.util.Map;

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
	public Map<String,Object> getCommentList(Comment comment) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list1", commentDao.getCommentList1(comment));
		map.put("list2", commentDao.getCommentList2(comment));
		return map;
	}

	@Override
	public Comment getComment(int commentNo) throws Exception {
		return commentDao.getComment(commentNo);
	}
}