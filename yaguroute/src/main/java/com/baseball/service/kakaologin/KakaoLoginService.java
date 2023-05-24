package com.baseball.service.kakaologin;

import java.util.Map;

public interface KakaoLoginService {

	public String getAccessToken (String authorizationCode) throws Exception;
	
	public Map<String, Object> getUserInfo(String accessToken) throws Exception;
}
