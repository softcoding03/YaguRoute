package com.baseball.service.domain;

public class Emote{
	private int emoteNo;
	private int postNo;
	private String userId;
	private int like; //좋아요 유무(0:x, 1:o)
	private int disLike;
	
	public Emote() {
	}
	public int getEmoteNo() {
		return emoteNo;
	}
	public void setEmoteNo(int emoteNo) {
		this.emoteNo = emoteNo;
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
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public int getDisLike() {
		return disLike;
	}
	public void setDisLike(int disLike) {
		this.disLike = disLike;
	}
	@Override
	public String toString() {
		return "Emote [emoteNo=" + emoteNo + ", postNo=" + postNo + ", userId=" + userId + ", like=" + like
				+ ", disLike=" + disLike + "]";
	}
}