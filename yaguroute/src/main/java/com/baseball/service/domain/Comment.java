package com.baseball.service.domain;

import java.sql.Date;

public class Comment {
	
	private int commentNo;
	private int postNo;
	private String gameCode;
	private int prodNo;
	private int secondCommentNo;
	private User user;
	private Date commentDate;
	private String commentContents;
	private String commentImage;
	private String grade;
	private int changed;  //0:default, 1:수정됨, 2:삭제됨, 3:본문이 삭제됨
	
	public Comment(){
	}
	
	public int getCommentNo() {
        return commentNo;
    }
    public void setCommentNo(int commentNo) {
        this.commentNo = commentNo;
    }

    public int getPostNo() {
        return postNo;
    }
    public void setPostNo(int postNo) {
        this.postNo = postNo;
    }

    public String getGameCode() {
        return gameCode;
    }
    public void setGameCode(String gameCode) {
        this.gameCode = gameCode;
    }

    public int getProdNo() {
        return prodNo;
    }
    public void setProdNo(int prodNo) {
        this.prodNo = prodNo;
    }

    public int getSecondCommentNo() {
        return secondCommentNo;
    }
    public void setSecondCommentNo(int secondCommentNo) {
        this.secondCommentNo = secondCommentNo;
    }

    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }

    public Date getCommentDate() {
        return commentDate;
    }
    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    public String getCommentContents() {
        return commentContents;
    }
    public void setCommentContents(String commentContents) {
        this.commentContents = commentContents;
    }

    public String getCommentImage() {
        return commentImage;
    }
    public void setCommentImage(String commentImage) {
        this.commentImage = commentImage;
    }

    public String getGrade() {
        return grade;
    }
    public void setGrade(String grade) {
        this.grade = grade;
    }
    
    public int getChanged() {
        return changed;
    }
    public void setChanged(int changed) {
        this.changed = changed;
    }

	// Override
	public String toString() {
		return "CommnetVO : [commentNo]" + commentNo
		+ "[postNo]" + postNo+ "[gameCode]" + gameCode + "[prodNo]" + prodNo + "[secondCommentNo]" + secondCommentNo+ "[user]" + user
		+ "[commentDate]" + commentDate+ "[commentContents]" 
		+ commentContents+ "[commentImage]" + commentImage+ "[grade]" + grade+ "[changed]" + changed;
	}	
}