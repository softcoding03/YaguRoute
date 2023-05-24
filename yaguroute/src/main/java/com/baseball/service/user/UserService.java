﻿package com.baseball.service.user;

import java.util.List;
import java.util.Map;

import com.baseball.common.domain.Search;
import com.baseball.service.domain.User;

//==> 회원관리에서 서비스할 내용 추상화/캡슐화한 Service  Interface Definition  
public interface UserService {
	
	public void addUser(User user) throws Exception;
	
	public User getUser(String userId) throws Exception;
	
	public Map<String, Object>getUserList(Search search) throws Exception;
	
//	public List<String> getUserAutoComplete(Search search) throws Exception;
	
	public void updateUser(User user) throws Exception;
	
	public void withDraw(User user) throws Exception;
	
	public void updatePoint(String userPoint, String userId) throws Exception;
	
	public boolean checkDuplication(String userId) throws Exception;
	
	
}
