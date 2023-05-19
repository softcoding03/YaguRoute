package com.baseball.service.user;

import com.baseball.service.domain.User;

//==> 회원관리에서 서비스할 내용 추상화/캡슐화한 Service  Interface Definition  
public interface UserService {
	
	public void addUser(User user) throws Exception;
	
	public User getUser(String userId) throws Exception;
	
	public void updateUser(User user) throws Exception;
	
}
