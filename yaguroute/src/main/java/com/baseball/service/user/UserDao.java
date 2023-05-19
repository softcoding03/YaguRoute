package com.baseball.service.user;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.baseball.service.domain.User;
@Mapper
@Repository
public interface UserDao {
	
	public void addUser(User user)throws Exception;
	
	public User getUser(String userId) throws Exception;
	
	public void updateUser(User user) throws Exception;
}
