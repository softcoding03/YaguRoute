package com.baseball.service.user;

import java.util.Map;

public interface UserRestDao {

	public String getAccessTokenNaver (String authorizationCode) throws Exception;
	
	public Map<String, Object> getNaverUserInfo (String accessToken) throws Exception;
	
	public String getAccessTokenKakao (String authorizationCode) throws Exception;
	
	public Map<String, Object> getKakaoUserInfo (String accessToken)throws Exception;
	
}
