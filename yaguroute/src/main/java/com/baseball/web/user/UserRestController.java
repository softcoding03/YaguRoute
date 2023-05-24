package com.baseball.web.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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
	
	public UserRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="naverLogin", method=RequestMethod.GET)
	public String naverLogin(@RequestParam(value = "code", required = false) String code, HttpSession session, HttpServletRequest request) throws Exception{
		
		System.out.println("Authorization Code : "+code);
		
		// 네이버에서 토큰 발급 요청
		String access_Token = naverLoginService.getAccessToken(code);
		
		System.out.println("Controller [accessToken] : "+access_Token);

		// 토큰으로 userInfo 요청
		Map<String, Object> userInfo = naverLoginService.getUserInfo(access_Token);
		System.out.println("userInfo : " + userInfo);
	
		
		return code;
	}
}
