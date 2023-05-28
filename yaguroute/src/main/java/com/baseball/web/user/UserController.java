package com.baseball.web.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baseball.service.domain.User;
import com.baseball.service.user.UserDao;
import com.baseball.service.user.UserService;

//==> 회원관리 Controller
@Controller
@RequestMapping("/users/*")
public class UserController {
// test용
	@Autowired 
	@Qualifier("userDao")
	private UserDao userDao;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	public UserController() {
		System.out.println(this.getClass());
	}

	@PostMapping(value="login")
	public String login(@ModelAttribute("user") User user, HttpSession session, HttpServletRequest request) throws Exception {
		
		
		
		System.out.println(user);
		
		if(userService.getUser(user.getUserId()) != null)
		{
			User dbUser = userService.getUser(user.getUserId());
			
			if(dbUser.getPassword().equals(user.getPassword())) {
				
				System.out.println("일치합니다.");
				session.setAttribute("user", dbUser);
				
				System.out.println("user : "+session.getAttribute("user"));
				
				session.setMaxInactiveInterval(5);
				return "redirect:/user/index.jsp";
			}
			else {
				System.out.println("아이디 혹은 비밀번호가 일치하지 않습니다.");
				return "redirect:/user/loginTest(new).jsp";
			}
		}
		else {
			System.out.println("아이디 혹은 비밀번호가 일치하지 않습니다.");
			return "redirect:/user/loginTest(new).jsp";
		}
		
	}
	
	@GetMapping( value="logout")
	public String logout(HttpSession session ) throws Exception{
		
		session.invalidate();
		
		return "redirect:/index.jsp";
	}
	
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