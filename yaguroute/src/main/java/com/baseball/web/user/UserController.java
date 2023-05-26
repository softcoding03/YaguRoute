package com.baseball.web.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baseball.service.user.UserDao;

//==> 회원관리 Controller
@Controller
@RequestMapping("/users/*")
public class UserController {

	@Autowired 
	@Qualifier("userDao")
	private UserDao userDao;

	// 아이디 중복체크
	@RequestMapping("/userIdCheck")
	public @ResponseBody int mbidCheck(String userId) throws Exception {
		
		System.out.println(userId);
		int result = userDao.userIdCheck(userId);
		System.out.println("result : "+result);
		return result;
	}
	
	@RequestMapping("/userNickNameCheck")
	public @ResponseBody int userNickNameCheck(String userNickName) throws Exception {
		
		System.out.println(userNickName);
		int result = userDao.userNickNameCheck(userNickName);
		System.out.println("result : "+result);
		return result;
	}
}