package com.baseball.test.comment;

import java.util.List;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.baseball.service.comment.CommentDao;
import com.baseball.service.comment.CommentService;
import com.baseball.service.domain.Comment;

import io.opentelemetry.exporter.logging.SystemOutLogExporter;


@SpringBootTest
public class TestComment{
	
	
	@Autowired
	@Qualifier("commentServiceImpl")
	private CommentService commentService;
	
	@Autowired
	@Qualifier("commentDao")
	private CommentDao commentDao;
	
	
	//@Test
	public void addComment() throws Exception{
		System.out.println("addComment() 시작");
		Comment comment = new Comment();
		comment.setPostNo(4);
		comment.setUserId("john123");
		comment.setCommentContents("댓글 내용2");
		System.out.println("세팅 comment?"+comment);
			commentService.addComment(comment);
		System.out.println("addComment() 끝");
	}
	
	//@Test
	public void deleteComment() throws Exception{
		System.out.println("deleteComment() 시작");
			commentService.deleteComment(13);
		System.out.println("deleteComment() 끝");
	}
	
	//@Test
	public void updateComment() throws Exception{
		System.out.println("updateComment() 시작");
			//commentService.updateComment(13);
		System.out.println("updateComment() 끝");
	}
	
	
	
	//@Test
	public void getCommentList() throws Exception{
		System.out.println("getCommentList() 시작");
		Comment comment = new Comment();
		comment.setPostNo(4);
		List<Comment> list = commentService.getCommentList(comment);
			System.out.println("select 결과 값"+list);
		System.out.println("getCommentList() 끝");
	}
	
}