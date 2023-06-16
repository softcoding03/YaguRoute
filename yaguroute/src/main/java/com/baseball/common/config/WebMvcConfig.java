
 package com.baseball.common.config;
 import org.springframework.beans.factory.annotation.Autowired; 
 import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry; 
 import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.baseball.common.interceptor.LoadingImageInterceptor;
import com.baseball.common.interceptor.LogonCheckInterceptor;
 
 @Configuration public class WebMvcConfig implements WebMvcConfigurer {
 
 private final LogonCheckInterceptor logonCheckInterceptor;
 private final LoadingImageInterceptor loadingImageInterceptor;
 
 @Autowired public WebMvcConfig(LogonCheckInterceptor logonCheckInterceptor,LoadingImageInterceptor loadingImageInterceptor) {
	 
 System.out.println("Hello, World!"); 
 
 this.logonCheckInterceptor = logonCheckInterceptor; 
 this.loadingImageInterceptor = loadingImageInterceptor;
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
	 "/users/kakaoLogin?code=DvELPXw684Zq5Ov50XzWk28z9FuoGFMm909En_hXF92FUBH7IpMSw-9MVmbNR11fLB4WngorDSAAAAGIvJtbTw",
	 "/users/kakaoLogin?code=QNkyEFxhPgHWb_ocx-qgKEZZjm64x1fsTkMgP86ztH8Uq82nm5glkV3mmKXRBkA6jYGZ9Ao9dGkAAAGIt2DqaQ",
	 "/users/kakaoLogin?code=ilwcYt3Tnu_wUL-x7EMFHmrlT9zACzSUpN_tGl4DXGFJgyljRa4JrXUixr855sdk45ykdQo9dBEAAAGIvKK-5g",
	 "/user/userNickNameCheck","/users/phoneCheck/", "/users/addNaverUser", "/users/addKakaoUser",
	 "https://sens.apigw.ntruss.com/sms/v2/services/",
	 "/users/findUserId/","/users/findPassword","/user/userIdCheck/", "/users/userImage", "/user/userIdCheck",
	 "/users/kakaoLogin?code=_-hgs0Ne6YuKKPi1xiLUgR9F6UfqUxDdtbPO2H5zmp2F4CCegTziSJ5q9F3uIKLyet2V1wo9cusAAAGIvLZHmA",
	 "/users/addUser", "/user/userNickNameCheck", "/user/userNickNameCheck", "/user/PartnershipProposal.html", "/user/TermsofUse.html",
	 "/user/private.html", "/user/manage.html", "http://192.168.0.116:8080/","/users/kakaoLogin?code=LcevSKMqC7cHzOZoXuo3-NsC0K9Lj8ehzaHfWVM9cmurY81Dm3-hueoqJuQ7nEcXVOVpGAoqJVIAAAGIvesKag",
	 
	 "/resources/static/index.html","/index.html","index.html","/user/favicon.ico","/","/error") // 인터셉터를 적용하지 않을 URL 패턴을 지정할 수도 있습니다. 
	 .excludePathPatterns("/js/**", "/css/**", "/images/**"); // 정적 파일 경로 패턴 추가 
	 
	 registry.addInterceptor((HandlerInterceptor)loadingImageInterceptor).addPathPatterns("/main/**","/game/**")
	 .excludePathPatterns("/js/**", "/css/**", "/images/**");
 	}
 }