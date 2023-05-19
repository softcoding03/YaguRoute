package com.baseball.service.user;

import com.baseball.service.domain.User;

public interface UserDao {
	
	public void addUser(User user)throws Exception;
	public User getUser(String userId) throws Exception;
	public void updateUser(User user) throws Exception;
}
