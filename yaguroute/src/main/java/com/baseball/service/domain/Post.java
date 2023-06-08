package com.baseball.service.domain;

import java.sql.Timestamp;

public class Post {
	
	private int postNo;
	private User user;  //userId, userNickName, userImage 담아줘야함.
	private String teamCode;
	private String postTitle;
	private String postContents;
	private Timestamp postDate;
	private int postViews;

	private String postType; //0:잡담 1:응원 2:중고판매 3:중고구매 4:notice
	private int postLikes;
	private int postDislikes;
	private int postComments;
	


	public Post(){
	}
	public int getPostComments() {
		return postComments;
	}

	public void setPostComments(int postComments) {
		this.postComments = postComments;
	}
	public int getPostNo() {
        return postNo;
    }
    public void setPostNo(int postNo) {
        this.postNo = postNo;
    }

    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }

    public String getTeamCode() {
        return teamCode;
    }
    public void setTeamCode(String teamCode) {
        this.teamCode = teamCode;
    }

    public String getPostTitle() {
        return postTitle;
    }
    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public String getPostContents() {
        return postContents;
    }
    public void setPostContents(String postContents) {
        this.postContents = postContents;
    }

    public Timestamp getPostDate() {
        return postDate;
    }
    public void setPostDate(Timestamp postDate) {
        this.postDate = postDate;
    }

    public int getPostViews() {
        return postViews;
    }
    public void setPostViews(int postViews) {
        this.postViews = postViews;
    }

    public String getPostType() {
        return postType;
    }
    public void setPostType(String postType) {
        this.postType = postType;
    }

    public int getNotice() {
        return notice;
    }
    public void setNotice(int notice) {
        this.notice = notice;
    }
    
    public int getPostLikes() {
        return postLikes;
    }
    public void setPostLikes(int postLikes) {
        this.postLikes = postLikes;
    }
    
    public int getPostDislikes() {
        return postDislikes;
    }
    public void setPostDislikes(int postDislikes) {
        this.postDislikes = postDislikes;
    }
	@Override
	public String toString() {
		return "Post [postNo=" + postNo + ", user=" + user + ", teamCode=" + teamCode + ", postTitle=" + postTitle
				+ ", postContents=" + postContents + ", postDate=" + postDate + ", postViews=" + postViews
				+ ", postType=" + postType + ", postLikes=" + postLikes + ", postDislikes=" + postDislikes
				+ ", postComments=" + postComments + "]";
	}

}