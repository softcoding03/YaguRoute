package com.baseball.service.kakaologin.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.baseball.service.kakaologin.KakaoLoginService;
import com.baseball.service.user.UserRestDao;

@Service("kakaoLoginServiceImpl")
public class KakaoLoginServiceImpl implements KakaoLoginService{

	//Field
	@Autowired
	@Qualifier("userRestDaoImpl")
	private UserRestDao userRestDao;
	
	//Constructor
	public KakaoLoginServiceImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public String getAccessToken(String authorizationCode) throws Exception {
		// TODO Auto-generated method stub
		return userRestDao.getAccessTokenKakao(authorizationCode);
	}

	@Override
	public Map<String, Object> getUserInfo(String accessToken) throws Exception {
		// TODO Auto-generated method stub
		return userRestDao.getKakaoUserInfo(accessToken);
	}

}
