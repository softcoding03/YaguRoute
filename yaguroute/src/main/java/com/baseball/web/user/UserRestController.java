package com.baseball.web.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.baseball.service.domain.User;
import com.baseball.service.kakaologin.KakaoLoginService;
import com.baseball.service.naverlogin.NaverLoginService;
import com.baseball.service.user.UserService;

//==> 회원관리 RestController

@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	//Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("naverLoginServiceImpl")
	private NaverLoginService naverLoginService;
	
	@Autowired
	@Qualifier("kakaoLoginServiceImpl")
	private KakaoLoginService kakaoLoginService;
	
	public UserRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public User login(@RequestParam("userId") String userId, @RequestParam("password") String password, HttpSession session) throws Exception{
		
		User user = userService.getUser(userId);
		System.out.println("rockseong4444");
		System.out.println(user.getPassword()+"패스워드");
		System.out.println(user.getUserId()+"아이디");
		System.out.println("받은 아이디 : "+userId);
		System.out.println("받은 비밀번호 : "+password);
		// 아이디가 없다면...
		if(user.getPassword().equals(password)){
			session.setAttribute("user", user);
			return user;
		}
		else {
			ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
			System.out.println("비밀번호가 일치하지 않음.");
			return user;
		}
	}
	
	@RequestMapping( value="naverLogin", method=RequestMethod.GET)
	public String naverLogin(@RequestParam(value = "code", required = false) String code, HttpSession session, HttpServletRequest request) throws Exception{
		
		System.out.println("Authorization Code : "+code);
		
		// 네이버에서 토큰 발급 요청
		String access_Token = naverLoginService.getAccessToken(code);
		
		System.out.println("전달 받은 Access Token : "+access_Token);

		// 토큰으로 userInfo 요청
		Map<String, Object> userInfo = naverLoginService.getUserInfo(access_Token);
		System.out.println("네이버 userInfo : " + userInfo);
	
		
		return code;
	}
	
	@RequestMapping( value="kakaoLogin", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value= "code", required = false) String code, HttpSession session, HttpServletRequest request) throws Exception{
		
		System.out.println("Authorization Code : "+code);
		
		// 카카오에서 토큰 발급 요청
		String access_Token = kakaoLoginService.getAccessToken(code);
		System.out.println("전달 받은 Access Token : "+access_Token);
		
		// 토큰으로 userInfo 요청
		Map<String, Object> userInfo = kakaoLoginService.getUserInfo(access_Token);
		System.out.println("카카오 userInfo : "+userInfo);
		
		return "redirect:/user/kakaologin.jsp";
	}
}
