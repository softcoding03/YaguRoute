package com.baseball.service.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.baseball.service.domain.User;
import com.baseball.service.user.UserDao;
import com.baseball.service.user.UserService;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService{

	//Field
	@Autowired
	@Qualifier("userDao")
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	// Constructor
	public UserServiceImpl() {
		System.out.println("userServiceImpl Success...");
	}
	
	// Method
	@Override
	public void addUser(User user) throws Exception {
		// TODO Auto-generated method stub
		userDao.addUser(user);
	}

	@Override
	public User getUser(String userId) throws Exception {
		// TODO Auto-generated method stub
		return userDao.getUser(userId);
	}

	@Override
	public void updateUser(User user) throws Exception {
		// TODO Auto-generated method stub
		userDao.updateUser(user);
	}

	@Override
	public void withDraw(User user) throws Exception {
		// TODO Auto-generated method stub
		userDao.withDraw(user);
	}

	@Override
	public boolean checkDuplication(String userId) throws Exception {
		// TODO Auto-generated method stub
		boolean result = true;
		User user = userDao.getUser(userId);
		if(user != null) {
			result=false;
		}
		return result;
	}

	@Override
	public void updatePoint(User user) throws Exception {
		// TODO Auto-generated method stub
		userDao.updatePoint(user);
	}
	
}
