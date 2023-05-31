package com.baseball.web.user;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URISyntaxException;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Map;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amazonaws.Request;
import com.baseball.common.domain.Page;
import com.baseball.common.domain.Search;
import com.baseball.service.domain.User;
import com.baseball.service.user.UserDao;
import com.baseball.service.user.UserService;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.mysql.cj.Session;

//==> 회원관리 Controller
@Controller
@RequestMapping("/users/*")
public class UserController {

	// test용
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("userDao")
	private UserDao userDao;
	
	
	public UserController() {
		System.out.println(this.getClass());
	}

	// page 설정
	@Value("${commonProperties.pageUnit}")
	private int pageUnit;
	@Value("${commonProperties.pageSize}")
	private int pageSize;

	@GetMapping(value = "getUser")
	public String getUser(@ModelAttribute("user") User user, Model model, HttpSession session) throws Exception {

		user = (User) session.getAttribute("user");

		System.out.println("조회할 사용자 : " + user);

		model.addAttribute("user", user);

		return "redirect:/user/getUser.jsp";
	}

	@PostMapping(value = "login")
	public String login(@ModelAttribute("user") User user, HttpSession session, HttpServletRequest request)
			throws Exception {

		System.out.println("user user user login: " + user);

		if (userService.getUser(user.getUserId()) != null) {
			User dbUser = userService.getUser(user.getUserId());

			if (dbUser.getPassword().equals(user.getPassword())) {

				System.out.println("일치합니다.");
				session.setAttribute("user", dbUser);

				System.out.println("user : " + session.getAttribute("user"));

				// session.setMaxInactiveInterval(3000);

				return "redirect:/user/index.jsp";
			} else {
				System.out.println("아이디 혹은 비밀번호가 일치하지 않습니다.");
				return "redirect:/user/index.jsp";
			}
		} else {
			System.out.println("아이디 혹은 비밀번호가 일치하지 않습니다.");
			return "redirect:/user/index.jsp";
		}
	}

	@GetMapping(value = "logout")
	public String logout(HttpSession session) throws Exception {

		session.invalidate();
		return "redirect:/user/loginTest(new).jsp";
	}

	@PostMapping(value = "addUser")
	public String addUser(@ModelAttribute("user") User user, HttpSession session) throws Exception {

		System.out.println("회원가입 대상 : " + user.getUserId());
		userService.addUser(user);

		session.setAttribute("user", user);

		return "redirect:/main.jsp";
	}

	@GetMapping(value = "updateUser")
	public String updateUserView(User user, HttpSession session, Model model) throws Exception {

		user = (User) session.getAttribute("user");
		if (user != null) {

			System.out.println("정보 수정 대상 아이디 : " + user.getUserId());
			model.addAttribute("user");

			return "redirect:/user/updateUserView.jsp";

		} else {

			return "redirect:/user/loginTest(new).jsp";
		}
	}

	@PostMapping(value = "updateUser")
	public String updateUser(@ModelAttribute("user") User user, Model model, HttpSession session) throws Exception {

		System.out.println("원래 값 : " + session.getAttribute("user"));
		System.out.println("새로 바꿀 값 : " + user);

		userService.updateUser(user);

		return "redirect:/users/getUser";
	}

	@RequestMapping(value = "listUser") // 관리자 전용
	public String listUser(@ModelAttribute("search") Search search, Model model) throws Exception {

		System.out.println("user/listUser");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		System.out.println(search);
		search.setPageSize(pageSize);
		// B/L 수행
		Map<String, Object> map = userService.getUserList(search);
		System.out.println("search :::: " + search);
		System.out.println("CurrentPage : " + search.getCurrentPage());
		System.out.println("SearchKeyword : " + search.getSearchKeyword());
		System.out.println("totalCount : " + map.get("totalCount"));
		System.out.println(pageUnit);
		System.out.println(pageSize);
		Page resultPage = new Page(search.getCurrentPage(), (int) map.get("totalCount"), pageUnit, pageSize);
		// Model 과 View 연결
		System.out.println("1234 : " + search.getSearchKeyword());
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
	
	// findUserId...
	@PostMapping(value="findUserId") 
	public @ResponseBody List<String> findUserId(@RequestParam("userPhone")String userPhone, Search search) throws Exception{
		System.out.println(userPhone);
		search.setPageSize(10000); // 일단 10000명으로 설정...?
		System.out.println("입력받은 휴대폰 번호 : "+userPhone);
		
		List<User> listUser = (List<User>) userDao.findUserId(userPhone); // 이것은 입력한 휴대폰 번호를 갖고 있는 아이디를 가져온다.
		List<String> userId = new ArrayList<>();
		
		for (User user : listUser) {
			if(user.getUserPhone().equals(userPhone)) {
				System.out.println(user.getUserId());
				userId.add(user.getUserId());
			}
		}
		
		System.out.println("listUser"+userId);
		
		return userId;
	}

	@GetMapping(value = "findPassword")
	public String findPassword() throws Exception {

		System.out.println("사용자 패스워드 찾기");

		return "forward:/user/findPassword.jsp";
	}

	@RequestMapping(value = "withDrawView", method = RequestMethod.GET) // GET
	public String withDrawView() throws Exception {

		System.out.println("사용자 탈퇴유무 변경을 위함 : GET");

		return "redirect:/user/withDrawView.jsp";
	}

	@RequestMapping(value = "withDraw") // POST
	public @ResponseBody int withDraw(@RequestParam("password") String password, HttpSession session) throws Exception {

		int withDrawCheck = 0;

		System.out.println("탈퇴유무 변경 POST");

		User dbUser = (User) session.getAttribute("user");
		String result = dbUser.getPassword();

		System.out.println(dbUser.getPassword().length());
		System.out.println(password.length());

		if (password.equals(result)) {

			withDrawCheck = 1;
			userService.withDraw(dbUser);

			return withDrawCheck;
		} else {
			System.out.println("비밀번호 불일치");
			return withDrawCheck;
		}
	}
	
	// phoneCheck[인증번호 발송]
	@RequestMapping(value = "phoneCheck", method = RequestMethod.POST)
	public @ResponseBody String phoneCheck(@RequestParam("userPhone") String phone, @RequestParam("rnd") String rnd, HttpServletRequest request) throws ClientProtocolException, IOException, URISyntaxException {

		System.out.println("welcome~~");
		System.out.println(phone);

		String hostNameUrl = "https://sens.apigw.ntruss.com"; // 도메인
		String requestUrl = "/sms/v2/services/";
		String requestUrlType = "/messages";
		String accessKey = "QJBLE3FkYnN44nDIiFfZ";
		String secretKey = "f8JTJ44m4cFQwO188ImbioHA16VvQIJP2FNp8BUU";
		String serviceId = "ncp:sms:kr:305152260305:phone0501";
		String method = "POST";
		String time = Long.toString(System.currentTimeMillis());
		requestUrl += serviceId + requestUrlType;
		String apiUrl = hostNameUrl + requestUrl;

		// Header 생성
		System.out.println("11111111111111111111111111");
		JsonObject bodyJson = new JsonObject();
		JsonObject toJson = new JsonObject();
		JsonArray toArr = new JsonArray();

		System.out.println("22222222222222222222222222");
		
		// 난수와 함께 전송
		toJson.addProperty("content", "Going 본인인증 [" + rnd + "]");
		toJson.addProperty("to", phone);
		toArr.add(toJson);
		System.out.println("33333333333333333333333333");
		System.out.println("toArr : " + toArr);

		// 메시지 Type (sms | lms)
		bodyJson.addProperty("type", "sms");
		bodyJson.addProperty("contentType", "COMM");
		bodyJson.addProperty("content", "1234");
		bodyJson.addProperty("countryCode", "82");
		bodyJson.addProperty("from", "01098669138");
		bodyJson.add("messages", toArr);

		String body = bodyJson.toString();
		System.out.println("body : " + body);

		try {
			URL url = new URL(apiUrl);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setUseCaches(false);
			con.setDoOutput(true);
			con.setDoInput(true);
			con.setRequestProperty("content-type", "application/json");
			con.setRequestProperty("x-ncp-apigw-timestamp", time);
			con.setRequestProperty("x-ncp-iam-access-key", accessKey);
			con.setRequestProperty("x-ncp-apigw-signature-v2",
					makeSignature(requestUrl, time, method, accessKey, secretKey));
			con.setRequestMethod(method);

			System.out.println("con : " + con);

			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.write(body.getBytes());
			wr.flush();

			int responseCode = con.getResponseCode();
			BufferedReader br;
			System.out.println("responseCode" + " " + responseCode);
			if (responseCode == 202) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}

			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			wr.close();
			br.close();

			System.out.println("wr : " + wr);
			System.out.println("br : " + br);
			System.out.println(response.toString());

		} catch (Exception e) {
			System.out.println(e);
		}
		// 이 함수 return 없었는데 View에 아무것도 리턴 없으면 자기 컨트롤러/자기 함수 로 들어가는듯
		// 그래서 아무 페이지나 리턴시켜줬더니 200나옴아하... 감사합니다
		return rnd;
	}

	public static String makeSignature(String url, String time, String method, String accessKey, String secretKey)
			throws NoSuchAlgorithmException, InvalidKeyException {

		String space = " ";
		String newLine = "\n";

		String message = new StringBuilder().append(method).append(space).append(url).append(newLine).append(time)
				.append(newLine).append(accessKey).toString();

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

		System.out.println("encode Base 64 String : " + encodeBase64String);
		System.out.println("message(String) : " + message);
		return encodeBase64String;
	}
}