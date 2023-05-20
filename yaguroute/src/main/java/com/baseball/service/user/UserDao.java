package com.baseball.service.user;

import org.apache.ibatis.annotations.Mapper;

import com.baseball.service.domain.User;

@Mapper
public interface UserDao {
	
	public void addUser(User user)throws Exception;
	
	public User getUser(String userId) throws Exception;
	
	public void updateUser(User user) throws Exception;
	
	public void withDraw(User user) throws Exception;
}
