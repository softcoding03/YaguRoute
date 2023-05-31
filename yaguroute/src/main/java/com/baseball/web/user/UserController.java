package com.baseball.web.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baseball.common.domain.Page;
import com.baseball.common.domain.Search;
import com.baseball.service.domain.User;
import com.baseball.service.user.UserDao;
import com.baseball.service.user.UserService;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

//==> 회원관리 Controller
@Controller
@RequestMapping("/users/*")
public class UserController {
	
	// test용
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	public UserController() {
		System.out.println(this.getClass());
	}
	
	// page 설정
	@Value("${commonProperties.pageUnit}")
    private int pageUnit;
    @Value("${commonProperties.pageSize}")
    private int pageSize;
	
	@GetMapping(value="getUser") 
	public String getUser(@ModelAttribute("user") User user, Model model, HttpSession session) throws Exception{
		
		System.out.println("조회할 사용자 : " + session.getAttribute(user.getUserId()));
		session.getAttribute(user.getUserId());
		
		model.addAttribute("user", user);
		
		return "redirect:/user/getUser.jsp";
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
				
				session.setMaxInactiveInterval(3000);
				
				return "redirect:/user/index.jsp";
			}
			else {
				System.out.println("아이디 혹은 비밀번호가 일치하지 않습니다.");
				return "redirect:/user/index.jsp";
			}
		}
		else {
			System.out.println("아이디 혹은 비밀번호가 일치하지 않습니다.");
			return "redirect:/user/index.jsp";
		}
	}
	
	@GetMapping( value="logout")
	public String logout(HttpSession session ) throws Exception{
		
		session.invalidate();
		return "redirect:/user/loginTest(new).jsp";
	}
	
	@PostMapping(value="addUser")
	public String addUser(@ModelAttribute("user") User user, HttpSession session) throws Exception {

		System.out.println("회원가입 대상 : "+user.getUserId());
		userService.addUser(user);
		
		session.setAttribute("user", user);
		
		return "redirect:/main.jsp";	
	}
	
	@PostMapping(value="updateUser")
	public String updateUser(@ModelAttribute("user") User user, HttpSession session) throws Exception {
		System.out.println("정보 수정 대상 : "+user.getUserId());
		userService.updateUser(user);
		
		return "redirect:/user/getUser";
	}
	
	@RequestMapping(value="listUser") // 관리자 전용 
	public String listUser(@ModelAttribute("search") Search search, Model model) throws Exception{
		
		System.out.println("search : "+search);
		
		System.out.println("user/listUser");
		
		if(search.getCurrentPage() == 0 ) {
			search.setCurrentPage(1);
		} 
		System.out.println(search);
		search.setPageSize(pageSize);
		// B/L 수행
		Map<String, Object> map = userService.getUserList(search);
		System.out.println("search :::: "+search);
		System.out.println("CurrentPage : "+search.getCurrentPage());
		System.out.println("SearchKeyword : "+search.getSearchKeyword());
		System.out.println("totalCount : "+map.get("totalCount"));
		System.out.println(pageUnit);
		System.out.println(pageSize);
		Page resultPage = new Page(search.getCurrentPage(), (int) map.get("totalCount"), pageUnit, pageSize);
		// Model 과 View 연결
		System.out.println("1234 : "+search.getSearchKeyword());
				model.addAttribute("list", map.get("list"));
				model.addAttribute("resultPage", resultPage);
				model.addAttribute("search", search);
				
		return "forward:/user/listUser.jsp";
	}
	
	@GetMapping(value="findUserId")
	public String findUserId() throws Exception{
		
		System.out.println("사용자 아이디 찾기");
		
		return "forward:/user/findUserId.jsp";
	}
	
	@GetMapping(value="findPassword")
	public String findPassword() throws Exception{
		
		System.out.println("사용자 패스워드 찾기");
		
		return "forward:/user/findPassword.jsp";
	}
	
	@RequestMapping(value="withDraw", method=RequestMethod.GET) // GET
	public String withDrawView() throws Exception{

		System.out.println("사용자 탈퇴유무 변경을 위함 : GET");
		
		return "redirect:/user/withDraw.jsp";
	}
	
	@RequestMapping(value="withDraw", method=RequestMethod.POST) // POST
	public String withDraw(@ModelAttribute("user") User user) throws Exception{

		System.out.println("사용자의 탈퇴유무가 변경됩니다. 0(false) -> 1(true)");
		
		userService.withDraw(user);
		
		return "redirect:/user/loginTest(new).jsp";
	}
	
}