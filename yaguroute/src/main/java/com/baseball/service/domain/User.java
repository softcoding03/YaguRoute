package com.baseball.service.domain;

import com.baseball.common.domain.Team;

//==>회원정보를 모델링(추상화/캡슐화)한 Bean

public class User {
	
	//field
	private String userId;
	private String userName;
	private String userNickName;
	private String userBirth;
	private int userPoint;
	private String userEmail;
	private String userAddr;
	private String password;
	private String passwordCheck;
	private String userPhone;
	private int phoneCheck;
	private String role;
	private String userImage;
	private String gender;
	private int withDraw;
	private String teamCode;
	
	//method
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserAddr() {
		return userAddr;
	}
	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}
	public int getUserPoint() {
		return userPoint;
	}
	public void setUserPoint(int userPoint) {
		this.userPoint = userPoint;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPasswordCheck() {
		return passwordCheck;
	}
	public void setPasswordCheck(String passwordCheck) {
		this.passwordCheck = passwordCheck;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public int getPhoneCheck() {
		return phoneCheck;
	}
	public void setPhoneCheck(int phoneCheck) {
		this.phoneCheck = phoneCheck;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getUserNickName() {
		return userNickName;
	}
	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}
	public String getUserImage() {
		return userImage;
	}
	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String string) {
		this.gender = string;
	}
	public int getWithDraw() {
		return withDraw;
	}
	public void setWithDraw(int withDraw) {
		this.withDraw = withDraw;
	}
	
	public String getTeamCode() {
		return teamCode;
	}
	public void setTeamCode(String teamCode) {
		this.teamCode = teamCode;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", userBirth=" + userBirth + ", userPoint="
				+ userPoint + ", userEmail=" + userEmail + ", userAddr=" + userAddr + ", password=" + password
				+ ", passwordCheck=" + passwordCheck + ", userPhone=" + userPhone + ", phoneCheck=" + phoneCheck + ", role="
				+ role + "]";
	}

}
