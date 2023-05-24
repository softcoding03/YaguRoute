package com.baseball.service.user;

import java.util.Map;

public interface UserRestDao {

	public String getAccessToken (String authorizationCode) throws Exception;
	
	public Map<String, Object> getUserInfo(String accessToken) throws Exception;
}
