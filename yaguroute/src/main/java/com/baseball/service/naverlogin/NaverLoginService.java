package com.baseball.service.naverlogin;

import java.util.Map;

public interface NaverLoginService {

	public String getAccessToken(String code) throws Exception;
	
	public Map<String, Object> getUserInfo(String accessToken) throws Exception;
}
