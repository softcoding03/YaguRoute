package com.baseball.service.user.impl;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.baseball.service.domain.User;
import com.baseball.service.user.UserRestDao;
import com.fasterxml.jackson.databind.ObjectMapper;

@Repository("userRestDaoImpl")
public class UserRestDaoImpl implements UserRestDao{

	// userRestDaoImpl 생성 이유 : 외부(네이버, 카카오)에서 데이터를 가져오기 때문에
	
	public UserRestDaoImpl() {
		System.out.println("UserRestDaoImpl success");
	}
	
	@Override
	public String getAccessToken(String authorizationCode) throws Exception {
		// TODO Auto-generated method stub
		String access_Token = "";
		String refresh_Token = "";
		
		URL obj = new URL("https://nid.naver.com/oauth2.0/token");
		
		// HTTP 연결 생성
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		
		// HTTP 요청 메소드 생성
		con.setRequestMethod("POST");
		con.setDoOutput(true);
		con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
		
		// HTTP 요청 필요한 파라미터 설정
		String postParams = "grant_type=authorization_code" + 
				"&client_id=" + "SLklwWhn8OnVgyPdEeSU" +
				"&redirect_uri=" + "http://192.168.0.116:8080/user/naver" + 
				"&code=" + authorizationCode +
				"&client_secret=" + "qV43i4IrXX";
		
		// HTTP 요청에 파라미터를 추가
		DataOutputStream ds = new DataOutputStream(con.getOutputStream());
		ds.writeBytes(postParams);
		ds.flush();
		
		// 결과 코드 200 O.K.
		int responseCode = con.getResponseCode();
		System.out.println("결과 코드 : "+responseCode);
		
		BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		String line = "";
		String result = "";
		System.out.println("Buffered Reader : "+br);
		
		while ((line = br.readLine()) != null) {
			result += line;
			System.out.println(result); // 여기서 access_token 값을 얻을 수 있다. 
		}
		System.out.println("response body : " + result);
		
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, Object> map = objectMapper.readValue(result, Map.class);
		
		access_Token = map.get("access_token").toString();
		refresh_Token = map.get("refresh_token").toString();
		
		return access_Token;
	}

	@Override
	public Map<String, Object> getUserInfo(String accessToken) throws Exception {
		// TODO Auto-generated method stub
		
		Map<String, Object> userInfo = new HashMap<>();
		
		URL url = new URL("https://openapi.naver.com/v1/nid/me");
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("POST");
		con.setRequestProperty("Authorization", "Bearer " + accessToken);
		
		int responseCode = con.getResponseCode();
		System.out.println("결과 코드 : "+responseCode);
		
		BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		String line = "";
		String result = "";
		
		while ((line = br.readLine()) != null) {
			result += line;
		}
		System.out.println("responseBody : "+ result);
		
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, Object> map = objectMapper.readValue(result, Map.class);
		System.out.println("map : "+map);
		
		Map<String, Object> properties = (Map<String, Object>) map.get("response");
		
		String userId = properties.get("id").toString();
		String userNickName = properties.get("nickname").toString();
		String userName = properties.get("name").toString();
		String userEmail = properties.get("email").toString();
		String userImage = properties.get("profile_image").toString();
		String userPhone = properties.get("mobile").toString();

		String userBirth1 = properties.get("birthday").toString();
		String userBirth2 = properties.get("birthyear").toString();
		
		String gender = properties.get("gender").toString();
		
		userInfo.put("userId", userId);
		userInfo.put("userNickName", userNickName);
		userInfo.put("userName", userName);
		userInfo.put("userEmail", userEmail);
		userInfo.put("userImage", userImage);
		userInfo.put("userPhone", userPhone);
		userInfo.put("userBirth", userBirth1+userBirth2);
		userInfo.put("gender", gender);
		
		System.out.println("userId : "+userId + " userNickName : "+userNickName+" userName : "+userName+" userEmail : "+userEmail+" userImage : "+userImage+" userPhone : "+userPhone+" userBirth : "+userBirth1+userBirth2+" gender : "+gender);
		
		return userInfo;
	}
	
	
}
