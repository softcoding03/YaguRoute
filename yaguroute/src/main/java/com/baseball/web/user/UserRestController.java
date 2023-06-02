package com.baseball.web.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.asynchttpclient.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.baseball.service.domain.User;
import com.baseball.service.kakaologin.KakaoLoginService;
import com.baseball.service.naverlogin.NaverLoginService;
import com.baseball.service.user.UserDao;
import com.baseball.service.user.UserService;

//==> 회원관리 RestController

@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	//Field
	@Autowired 
	@Qualifier("userDao")
	private UserDao userDao;
	
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
	
	// 아이디 중복체크
	@RequestMapping("/userIdCheck")
	public @ResponseBody int mbidCheck(String userId) throws Exception {
		
		System.out.println(userId);
		int result = userDao.userIdCheck(userId);
		System.out.println("result : "+result);
		return result;
	}
	
	// 닉네임 중복체크	
	@RequestMapping("/userNickNameCheck")
	public @ResponseBody int userNickNameCheck(String userNickName) throws Exception {
		
		System.out.println(userNickName);
		int result = userDao.userNickNameCheck(userNickName);
		System.out.println("result : "+result);
		return result;
	}
	
}
