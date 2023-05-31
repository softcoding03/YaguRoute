package com.baseball.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.baseball.common.domain.Search;
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
		System.out.println(this.getClass());
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

	@Override
	public Map<String, Object> getUserList(Search search) throws Exception {
		// TODO Auto-generated method stub
		/*현재 데이터가 4개임을 알 수 있는 이유는 mapper로 이동해서 include한 userList의 개수를 가져왔기 때문이다.*/
		
		List<User> list = userDao.getUserList(search); 
		int totalCount = userDao.getTotalCount(search); // totalCount는 따로 service, serviceImpl에 메소드 형태로 만들지 않는다. 
		Map<String, Object> map = new HashMap<String, Object>(); // Map<String,Object> 객체 생성
		
		map.put("list", list); // "list" 문자 내부에 정렬되어 list=[User [userId = beatles123.. 라고 저장된다.]]
		map.put("totalCount", totalCount);
		
		System.out.println("map : "+map);
		
//		System.out.println("userServiceImpl에서의 list... : "+map);
		
		return map;
	}

	@Override
	public List<String> getUserAutoComplete(Search search) throws Exception {
		// TODO Auto-generated method stub
		/* AutoComplete 구현하기*/
		return null;
	}

	@Override
	public boolean phoneCheck(String userPhone) throws Exception {
		// TODO Auto-generated method stub
		/* 휴대폰 인증 구현하기 */
		return false;
	}
}
