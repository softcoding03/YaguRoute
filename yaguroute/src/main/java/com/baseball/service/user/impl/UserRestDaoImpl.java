package com.baseball.service.user.impl;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.baseball.service.domain.User;
import com.baseball.service.user.UserRestDao;
import com.fasterxml.jackson.databind.ObjectMapper;

@Repository("userRestDaoImpl")
public class UserRestDaoImpl implements UserRestDao{

	// userRestDaoImpl 생성 이유 : 외부(네이버, 카카오)에서 데이터를 가져오기 때문에
	
	public UserRestDaoImpl() {
		System.out.println(this.getClass());
	}
	
	@Value("${fileUploadPath}")
	private String fileUploadPath;
	
	@Override
	public String getAccessTokenNaver(String authorizationCode) throws Exception {
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
	public Map<String, Object> getNaverUserInfo(String accessToken) throws Exception {
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
		userInfo.put("userBirth", userBirth2+userBirth1);
		userInfo.put("gender", gender);
		
		System.out.println("userId : "+userId + " userNickName : "+userNickName+" userName : "+userName+" userEmail : "+userEmail+" userImage : "+userImage+" userPhone : "+userPhone+" userBirth : "+userBirth1+userBirth2+" gender : "+gender);
		
		return userInfo;
	}

	@Override
	public String getAccessTokenKakao(String authorizationCode) throws Exception {
		// TODO Auto-generated method stub
		String access_Token = "";
		String refresh_Token = "";
		String url = "https://kauth.kakao.com/oauth/token";
		
		URL obj;
		obj = new URL(url);
		
		
		// HTTP 연결 생성
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		
		// HTTP 요청 메소드 설정
		con.setRequestMethod("POST");
		con.setDoOutput(true);
		
		// HTTP 요청 헤더 설정
		con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
		
		// HTTP 요청에 필요한 파라미터 설정
		String postParams = "grant_type=authorization_code" +
			"&client_id=" + "492090239797ebad0d3181db65216b78" +
			"&redirect_uri=" + "http://192.168.0.116:8080/users/kakaoLogin" +
			"&code=" + authorizationCode;
		
		
		// HTTP 요청 본문에 파라미터 추가
		con.setDoOutput(true);
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		wr.writeBytes(postParams);
		wr.flush();
		
		// 결과 코드가 200이라면 성공
		int responseCode = con.getResponseCode();
		System.out.println("responseCode : " + responseCode);
		
		BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		String line = "";
		String result = "";
		
		while((line = br.readLine())!= null) {
			result += line;
		}
		System.out.println("responseBody : "+result);
		
		
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, Object> map = objectMapper.readValue(result, Map.class);
		System.out.println("가져온 정보 : "+map);
		
		access_Token = map.get("access_token").toString();
		refresh_Token = map.get("refresh_token").toString();
		
		System.out.println("accessToken : "+access_Token);
		System.out.println("refreshToken : "+refresh_Token);
		
		return access_Token;
	}

	@Override
	public Map<String, Object> getKakaoUserInfo(String accessToken) throws Exception {
		// TODO Auto-generated method stub
		
		Map<String, Object> userInfo = new HashMap<>();
		String postUrl = "https://kapi.kakao.com/v2/user/me";
		
		URL obj = new URL(postUrl);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		
		con.setRequestMethod("POST");
		con.setRequestProperty("Authorization", "Bearer " + accessToken);
		
		int responseCode = con.getResponseCode();
		System.out.println("결과 : "+responseCode);
		
		BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		
		String line = "";
		String result = "";
		
		while((line = br.readLine()) != null) {
			result += line;
		}
		
		ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> map = objectMapper.readValue(result, Map.class);
        
        System.out.println("5678"+map+"5678");
        
        Map<String, Object> properties = (Map<String, Object>) map.get("properties");
        Map<String, Object> kakaoAccount = (Map<String, Object>) map.get("kakao_account");
        
        String userId = map.get("id").toString();
        String userName = properties.get("nickname").toString();
        String userImage = properties.get("profile_image").toString();
        String userEmail = kakaoAccount.get("email").toString();
        String gender = kakaoAccount.get("gender").toString();
        
        System.out.println("userId : "+userId);
        System.out.println("userName : "+userName);
        System.out.println("userImage : "+userImage);
        System.out.println("userEmail : "+userEmail);
        System.out.println("gender : "+gender);
        
        userInfo.put("userId", userId);
        userInfo.put("userName", userName);
        userInfo.put("userImage", userImage);
        userInfo.put("userEmail", userEmail);
        userInfo.put("gender", gender);
        
		return userInfo;
	}

	@Override
	public String getUserImage(@ModelAttribute("file") MultipartFile file) throws Exception {
		// TODO Auto-generated method stub
		
		String filePath = null;
		
		if (!file.isEmpty()) {
      try {
      	
      	  String fileName = file.getOriginalFilename();
         
          filePath =  fileUploadPath + File.separator + fileName;
          
          File save = new File(filePath);
          file.transferTo(save);
          
          System.out.println("File uploaded successfully: " + fileName);
      } catch (Exception e) {
          // 업로드 실패 시 예외 처리
          System.out.println("Failed to upload file: " + e.getMessage());
      	}
		} else {
      // 업로드할 파일이 없는 경우 예외 처리
      System.out.println("No file selected for upload");
  	}
		
		return filePath;
	}
	
	
}
