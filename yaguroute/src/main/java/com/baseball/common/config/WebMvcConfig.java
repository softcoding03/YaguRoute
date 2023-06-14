
 package com.baseball.common.config;
 import org.springframework.beans.factory.annotation.Autowired; 
 import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry; 
 import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
 import com.baseball.common.interceptor.LogonCheckInterceptor;
 
 @Configuration public class WebMvcConfig implements WebMvcConfigurer {
 
 private final LogonCheckInterceptor logonCheckInterceptor;
 
 @Autowired public WebMvcConfig(LogonCheckInterceptor logonCheckInterceptor) {
	 
 System.out.println("Hello, World!"); 
 
 this.logonCheckInterceptor = logonCheckInterceptor; 
 
 }
 
 @Override public void addInterceptors(InterceptorRegistry registry) { 
	 
	 registry.addInterceptor((HandlerInterceptor) logonCheckInterceptor)
	
	 .addPathPatterns("/**") // 인터셉터를 적용할 URL 패턴을 지정합니다.
	 .excludePathPatterns("/user/loginTest(new).jsp",
	 "/users/login","/user/index.jsp",
	 "/user/addKakaoUser.jsp","/user/addNaverUser.jsp",
	 "/users/findPassword","/users/findUserId", "/user/addUser.jsp",
	 "/users/naverLogin?code=4vyS2vLJzYxTHVCq0x&state=",
	 "/users/naverLogin", "/users/kakaoLogin", 
	 "/users/kakaoLogin?code=QNkyEFxhPgHWb_ocx-qgKEZZjm64x1fsTkMgP86ztH8Uq82nm5glkV3mmKXRBkA6jYGZ9Ao9dGkAAAGIt2DqaQ",
	 "/user/userNickNameCheck","/users/phoneCheck/", "/users/addNaverUser", "/users/addKakaoUser",
	 "https://sens.apigw.ntruss.com/sms/v2/services/",
	 "/users/findUserId/","/users/findPassword","/user/userIdCheck/", "/users/userImage", "/user/userIdCheck",
	 "/users/addUser", "/user/userNickNameCheck", "/user/userNickNameCheck") // 인터셉터를 적용하지 않을 URL 패턴을 지정할 수도 있습니다. 
	 .excludePathPatterns("/js/**", "/css/**", "/images/**"); // 정적 파일 경로 패턴 추가 
	 
 	}
 }