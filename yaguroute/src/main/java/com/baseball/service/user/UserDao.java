package com.baseball.service.user;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.baseball.common.domain.Search;
import com.baseball.service.domain.User;

@Mapper
public interface UserDao {
	
	public void addUser(User user)throws Exception;
	
	public User getUser(String userId) throws Exception;
	
	public List<User> getUserList(Search search) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;
	
//	public List<String> getUserAutoComplete() throws Exception;
	
	public void updateUser(User user) throws Exception;
	
	public void withDraw(User user) throws Exception;
	
	public void updatePoint(User user) throws Exception;
}
