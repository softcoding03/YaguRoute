package com.baseball.service.naverlogin.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.baseball.service.naverlogin.NaverLoginService;
import com.baseball.service.user.UserRestDao;

@Service("naverLoginServiceImpl")
public class NaverLoginServiceImpl implements NaverLoginService{

	//Constructor
	public NaverLoginServiceImpl() {
	System.out.println(this.getClass());
			// TODO Auto-generated constructor stub
	}
		
	@Autowired
	@Qualifier("userRestDaoImpl")
	private UserRestDao userRestDao;
	
	@Override
	public String getAccessToken(String code) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("111111111111"+code);
		return userRestDao.getAccessTokenNaver(code);
	}

	@Override
	public Map<String, Object> getUserInfo(String accessToken) throws Exception {
		// TODO Auto-generated method stub
		return userRestDao.getNaverUserInfo(accessToken);
	}

}
