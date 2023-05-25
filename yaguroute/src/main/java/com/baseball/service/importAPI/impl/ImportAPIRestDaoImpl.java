package com.baseball.service.importAPI.impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import com.baseball.service.domain.Product;
import com.baseball.service.importAPI.ImportAPIRestDao;


@Repository("importAPIRestDaoImpl")
public class ImportAPIRestDaoImpl implements ImportAPIRestDao {
	
	//field
	@Value("${imp_key}")
	private String imp_key;
	
	@Value("${imp_secret}")
	private String imp_secret;
		
	//Constructor
	public ImportAPIRestDaoImpl() {
		System.out.println("ImportAPIRestDaoImpl Start...");
	}
	
//Naver SENS 문자 발송 로직
	public String sendSMS(String contents, String userPhone) throws Exception{
		String result;
		
		String hostNameUrl = "https://sens.apigw.ntruss.com";     		// 호스트 URL
		String requestUrl= "/sms/v2/services/";               			// 요청 URL
		String requestUrlType = "/messages";                      		// 요청 URL
		String accessKey = "HoFpKO3WT9dHwGbJhDe5";                     	// 네이버 클라우드 플랫폼 회원에게 발급되는 개인 인증키			// Access Key : https://www.ncloud.com/mypage/manage/info > 인증키 관리 > Access Key ID
		String secretKey = "SET9yjOk6tNijRDhpxVy0DjPdMswALE8YepbtqoT";  // 2차 인증을 위해 서비스마다 할당되는 service secret key	// Service Key : https://www.ncloud.com/mypage/manage/info > 인증키 관리 > Access Key ID	
		String serviceId = "ncp:sms:kr:305202255084:200ok";       // 프로젝트에 할당된 SMS 서비스 ID							// service ID : https://console.ncloud.com/sens/project > Simple & ... > Project > 서비스 ID
		String method = "POST";											// 요청 method
		String timestamp = Long.toString(System.currentTimeMillis()); 	// current timestamp (epoch)
		requestUrl += serviceId + requestUrlType;
		String apiUrl = hostNameUrl + requestUrl;
		
		// JSON 을 활용한 body data 생성
		JSONObject bodyJson = new JSONObject();
		JSONObject toJson = new JSONObject();
		JSONArray  toArr = new JSONArray();
		
		//body 부분에 들어갈 내용들 작성. 
		//예약 문자 발송을 위해선 APi참고 할 것.
		bodyJson.put("type","SMS");
		bodyJson.put("contentType","COMM");
		bodyJson.put("from","01097833446");					// Mandatory, 발신번호, 사전 등록된 발신번호만 사용 가능		
		bodyJson.put("content","이거안보내지는버그걸림");							// Mandatory(필수), 기본 메시지 내용, SMS: 최대 80byte, LMS, MMS: 최대 2000byte
		toJson.put("content",contents);						// Optional, messages.content	개별 메시지 내용, SMS: 최대 80byte, LMS, MMS: 최대 2000byte
		toJson.put("to", userPhone);						// Mandatory(필수), messages.to	수신번호, -를 제외한 숫자만 입력 가능
		toArr.add(toJson);
		bodyJson.put("messages", toArr);					// Mandatory(필수), 아래 항목들 참조 (messages.XXX), 최대 1,000개
		//한글 에러 해결하기 위한 인코딩
		String body = new String(bodyJson.toString().getBytes("UTF-8"), "UTF-8");
		System.out.println("  세팅 body? "+body);
		
		try {
			URL url = new URL(apiUrl);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setUseCaches(false);
			con.setDoOutput(true);
			con.setDoInput(true);
			con.setRequestProperty("content-type", "application/json");
			con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
			con.setRequestProperty("x-ncp-iam-access-key", accessKey);
			con.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature(requestUrl, timestamp, method, accessKey, secretKey));
			con.setRequestMethod(method);
			con.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			
			wr.write(body.getBytes("UTF-8"));
			wr.flush();
			wr.close();
			
			int responseCode = con.getResponseCode();
			BufferedReader br;
			System.out.println("responseCode" +" " + responseCode);
			if(responseCode == 202) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			
			result=response.toString();
		
		} catch (Exception e) {
			System.out.println(e);
			result="SMS 전송 실패";
		}
		return result;
	}
	
	private String makeSignature(String url, String timestamp, String method, String accessKey, String secretKey) throws NoSuchAlgorithmException, InvalidKeyException {
	    String space = " ";                    // one space
	    String newLine = "\n";                 // new line
	    String message = new StringBuilder()
	        .append(method)
	        .append(space)
	        .append(url)
	        .append(newLine)
	        .append(timestamp)
	        .append(newLine)
	        .append(accessKey)
	        .toString();
	    SecretKeySpec signingKey;
	    String encodeBase64String;
		try {
			signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
			Mac mac = Mac.getInstance("HmacSHA256");
			mac.init(signingKey);
			byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
		    encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);
		} catch (UnsupportedEncodingException e) {
			encodeBase64String = e.toString();
		}
		System.out.println("   encodeBase64String는? "+encodeBase64String);
	  return encodeBase64String;
	}
	
	
//Import 환불 요청 로직
	public String importRefund(String merchantNo, int amount) throws Exception{
		
		String resultData;
		
		//access_token 발급을 위한 api요청
		HttpURLConnection con =null;
		String access_token = null;
		URL url = new URL("https://api.iamport.kr/users/getToken"); //토큰 받아올 주소
		con = (HttpURLConnection)url.openConnection();
		con.setRequestMethod("POST");
		con.setRequestProperty("Content-Type", "application/json");
		con.setRequestProperty("Accept", "application/json");
		con.setDoOutput(true);
		
		JSONObject obj = new JSONObject();
		obj.put("imp_key", imp_key);
		obj.put("imp_secret", imp_secret);
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(con.getOutputStream()));
		bw.write(obj.toString());
		bw.flush();
		bw.close();
		
		//서버로부터 응답 데이터 받기
		String a =null;
		int result = 0;
		int responseCode = con.getResponseCode();
		System.out.println("  응답코드?"+responseCode);
		if(responseCode == 200) {
			System.out.println("  응답성공 !");
			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			StringBuilder sb = new StringBuilder();
			String line = null;
			while ((line = br.readLine()) != null) {
				sb.append(line+"\n");
			}
			br.close();
			System.out.println(""+sb.toString());
			result = 1; // 성공 시 1 반환
			a = sb.toString(); //{"code":0,"message":null,"response":{"access_token":"0d48967625d8bdc10436308979c60b780932d27d","now":1683142902,"expired_at":1683144628}}
			JSONObject jsonObject = (JSONObject) new JSONParser().parse(a);
			access_token = (String) ((JSONObject) jsonObject.get("response")).get("access_token");//accesskey추출
			System.out.println(access_token);
			
			///결제취소 로직
			HttpsURLConnection conn = null;
			url = new URL("https://api.iamport.kr/payments/cancel");
	 
			conn = (HttpsURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-type", "application/json");
			conn.setRequestProperty("Accept", "application/json");
			conn.setRequestProperty("Authorization", access_token);
			conn.setDoOutput(true);
			
			JSONObject json = new JSONObject();
			json.put("merchant_uid", merchantNo);
			if(amount != 0) {
				json.put("amount", amount); //생략하면 모든 금액 환불, 입력하면 부분환불	
			}
 	 
		    bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			bw.write(json.toString());
			bw.flush();
			bw.close();
			br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
			br.close();
			conn.disconnect();
			
			resultData ="success";
		} else {
			resultData=" 결제취소 실패 ㅠㅠ"+con.getResponseMessage();
		}
		return resultData;
	}
	
}