package com.baseball.service.domain;

import java.sql.Date;

public class Post {
	
	private int postNo;
	private String userId;
	private String teamCode;
	private String postTitle;
	private String postContents;
	private Date postDate;
	private int postViews;
	private String postType;
	private int notice;
	private int postLikes;
	private int postDislikes;
	
	public Post(){
	}
	
	public int getPostNo() {
        return postNo;
    }
    public void setPostNo(int postNo) {
        this.postNo = postNo;
    }

    public String getUserId() {
        return userId;
    }
    public void setUserId(String userId) {
        this.userId = userId;
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

    public Date getPostDate() {
        return postDate;
    }
    public void setPostDate(Date postDate) {
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
    
    public int getPostDisLikes() {
        return postDislikes;
    }
    public void setPostDisLikes(int postDislikes) {
        this.postDislikes = postDislikes;
    }
	

	// Override
    public String toString() {
        return "PostVO: [postNo=" + postNo +
                ", userId='" + userId + '\'' +
                ", teamCode='" + teamCode + '\'' +
                ", postTitle='" + postTitle + '\'' +
                ", postContents='" + postContents + '\'' +
                ", postDate=" + postDate +
                ", postViews=" + postViews +
                ", postType='" + postType + '\'' +
                ", notice=" + notice +
                ", postLikes=" + postLikes +
                ", postDislikes=" + postDislikes +
                ']';
    }


}