package com.baseball.web.user;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.util.Map;
import java.util.UUID;
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
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.Request;
import com.baseball.common.domain.Page;
import com.baseball.common.domain.Search;
import com.baseball.service.domain.User;
import com.baseball.service.kakaologin.KakaoLoginService;
import com.baseball.service.naverlogin.NaverLoginService;
import com.baseball.service.user.UserDao;
import com.baseball.service.user.UserRestDao;
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
	@Qualifier("naverLoginServiceImpl")
	private NaverLoginService naverLoginService;
	
	@Autowired
	@Qualifier("kakaoLoginServiceImpl")
	private KakaoLoginService kakaoLoginService;
	
	@Autowired
	@Qualifier("userDao")
	private UserDao userDao;
	
	@Autowired
	@Qualifier("userRestDaoImpl")
	private UserRestDao userRestDao;
	
	public UserController() {
		System.out.println(this.getClass());
	}

	// page 설정
	@Value("${commonProperties.pageUnit}")
	private int pageUnit;
	@Value("${commonProperties.pageSize}")
	private int pageSize;

	private String userImage;
	
	@GetMapping(value = "getUsers")
	public String getUsers(@RequestParam("userId") String userId, Model model, HttpSession session) throws Exception {

		System.out.println(userId);
		
		User user = userService.getUser(userId);
		
		model.addAttribute("user", user);
		
		return "forward:/user/getUser.jsp";
	}
	
	@GetMapping(value = "getUser")
	public String getUser(String userId, Model model, HttpSession session) throws Exception {

		session.getAttribute(userId);
		
		User user = (User) session.getAttribute(userId);
		
		System.out.println(user);
		
		model.addAttribute("user", user);
		
		return "redirect:/user/getUser.jsp";
	}
	
	@PostMapping(value = "login")
	public String login(@ModelAttribute("user") User user, HttpSession session, HttpServletRequest request)
			throws Exception {

		if (userService.getUser(user.getUserId()) != null) {
			User dbUser = userService.getUser(user.getUserId());

			//&& dbUser.getWithDraw() == 0
			
			if (dbUser.getPassword().equals(user.getPassword()) && dbUser.getWithDraw() == 0) {

				System.out.println("일치합니다.");
				session.setAttribute("user", dbUser);

				System.out.println("user : " + session.getAttribute("user"));

				//session.setMaxInactiveInterval(6);

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
	public ResponseEntity<String> addUser(@RequestBody User user, HttpSession session) throws Exception {

		System.out.println("회원가입 대상 : " + user.getUserId());
		
		if(user.getUserImage() == null) {
			user.setUserImage(userImage);
		}
		
		userService.addUser(user);

		session.setAttribute("user", user);

		System.out.println("유저 세션 : "+session.getAttribute("user"));
		
		return ResponseEntity.ok("전송 성공");
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
	public @ResponseBody  ResponseEntity<String> updateUser(@RequestBody User user, Model model, HttpSession session) throws Exception {

		System.out.println("원래 값 : " + session.getAttribute("user"));
		System.out.println("새로 바꿀 값 : " + user);

		userService.updateUser(user);

		System.out.println("여긴 updateUser/POST ");
		
//		// 세션 풀기(변경되었으므로... 최신꺼 불러오기)
//		session.invalidate();
		
		// 다시 세션 접속(변경 확인)
		session.setAttribute("user", user);
		
		return ResponseEntity.ok("전송 성공");
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
		System.out.println("listUser size : "+userId.size());
		
		return userId;
	}

	@GetMapping(value = "findPassword")
	public String findPassword() throws Exception {

		System.out.println("사용자 패스워드 찾기");

		return "forward:/user/findPassword.jsp";
	}
	
	@PostMapping(value="findPassword") 
	public @ResponseBody List<String> findPassword(@RequestParam("userPhone")String userPhone, @RequestParam("userId") String userId, Search search) throws Exception{
		
		System.out.println("입력받은 휴대폰 번호 : "+userPhone);
		System.out.println("입력받은 아이디 : "+userId);
		
		List<User> listUser = (List<User>) userDao.findUserId(userPhone); // findUserId와 겹쳐 일단 이 sql 사용...
		List<String> password123 = new ArrayList<>();
		
		for (User user : listUser) {
			if(user.getUserPhone().equals(userPhone) && user.getUserId().equals(userId)) {
				System.out.println(user.getPassword());
				password123.add(user.getPassword());
			}
		}
		
		System.out.println("listPassword: "+password123);
		
		return password123;
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

			session.invalidate();
			System.out.println("탈퇴 완료");
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
	
	@PostMapping(value="addNaverUser")
	public String addNaverUser(@ModelAttribute("user") User user, HttpSession session) throws Exception{
		
		System.out.println("가져온 User 정보 : "+user);
		
		userService.addUser(user);
		
		// session 등록
		session.setAttribute("user", user);
		return "redirect:/main.jsp";
	}
	
	@GetMapping( value="naverLogin")
	public String naverLogin(@RequestParam(value = "code", required = false) String code, User user, Model model, HttpSession session, HttpServletRequest request) throws Exception{
		
		System.out.println("Authorization Code : "+code);
		
		// 네이버에서 토큰 발급 요청
		String access_Token = naverLoginService.getAccessToken(code);
		
		System.out.println("전달 받은 Access Token : "+access_Token);

		// 토큰으로 userInfo 요청
		Map<String, Object> userInfo = naverLoginService.getUserInfo(access_Token);
		System.out.println("네이버 userInfo : " + userInfo);
		
		user.setUserId((String) userInfo.get("userId"));
		user.setUserName((String) userInfo.get("userName"));
		user.setUserNickName((String) userInfo.get("userNickName"));
		user.setUserBirth((String) userInfo.get("userBirth"));
		user.setUserEmail((String) userInfo.get("userEmail"));
		user.setUserAddr((String) userInfo.get("userAddr"));
		user.setPassword((String) userInfo.get("password"));
		user.setUserPhone((String) userInfo.get("userPhone"));
		user.setGender((String) userInfo.get("gender"));
		user.setTeamCode((String) userInfo.get("teamCode"));
		user.setUserImage((String) userInfo.get("userImage"));
		
		if (userService.getUser(user.getUserId()) != null) {
			
			User dbUser = userService.getUser(user.getUserId());
			System.out.println(dbUser);
			if (dbUser.getUserId().equals(user.getUserId())) {

				System.out.println("이미 존재하는 아이디입니다.");
				//System.out.println("첫 가입 유저... userPoint 올려드림.");
				session.setAttribute("user", dbUser);
				
				return "redirect:/main.jsp";
			}
		}
		else {
			System.out.println("추가 정보 입력");
			return "redirect:/user/addNaverUser.jsp";
			}
		System.out.println("아무 값이 입력되지 않은 관계로 처음 로그인 화면 돌아갑니다.");
		return "redirect:/user/loginTest(new).jsp";
	}
	@GetMapping( value="kakaoLogin")
	public String kakaoLogin(@RequestParam(value= "code", required = false) String code,User user, HttpSession session, HttpServletRequest request, Model model) throws Exception{
		
		System.out.println("Authorization Code : "+code);
		
		// 카카오에서 토큰 발급 요청
		String access_Token = kakaoLoginService.getAccessToken(code);
		System.out.println("전달 받은 Access Token : "+access_Token);
		
		// 토큰으로 userInfo 요청
		Map<String, Object> userInfo = kakaoLoginService.getUserInfo(access_Token);
		System.out.println("카카오 userInfo : "+userInfo);
		
		user.setUserId((String) userInfo.get("userId"));
		user.setUserName((String) userInfo.get("userName"));
		user.setUserNickName((String) userInfo.get("userNickName"));
		user.setUserBirth((String) userInfo.get("userBirth"));
		user.setUserEmail((String) userInfo.get("userEmail"));
		user.setUserAddr((String) userInfo.get("userAddr"));
		user.setPassword((String) userInfo.get("password"));
		user.setUserPhone((String) userInfo.get("userPhone"));
		user.setGender((String) userInfo.get("gender"));
		user.setTeamCode((String) userInfo.get("teamCode"));
		user.setUserImage((String) userInfo.get("userImage"));
		
//		/*카카오 연결끊기 */
//		String accessToken = "RrsBCAMVZxK8_olj8oXo6JxlDGGrrUIbIc3732Q-CisNHgAAAYh13k_G";
//
//		// HttpHeaders 설정
//		HttpHeaders headers = new HttpHeaders();
//		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
//		headers.set("Authorization", "Bearer " + accessToken);
//
//		// 요청 파라미터 설정
//		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
//		params.add("target_id_type", "user_id"); // 연결을 끊을 대상 ID의 타입 (user_id 또는 app_user_id)
//		params.add("target_id", "2751306335"); // 연결을 끊을 대상 ID
//
//		// HttpEntity 설정
//		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(params, headers);
//
//		// RestTemplate을 사용하여 API 호출
//		RestTemplate restTemplate = new RestTemplate();
//		ResponseEntity<String> response = restTemplate.exchange(
//		    "https://kapi.kakao.com/v1/user/unlink",
//		    HttpMethod.POST,
//		    requestEntity,
//		    String.class
//		);
//
//		// 응답 처리
//		if (response.getStatusCode().is2xxSuccessful()) {
//		    System.out.println("카카오 아이디 연결이 성공적으로 끊어졌습니다.");
//		} else {
//		    System.out.println("카카오 아이디 연결 끊기 실패");
//		}
//		
//		/*카카오 연결 끊기*/
		
		if (userService.getUser(user.getUserId()) != null) {
			
			User dbUser = userService.getUser(user.getUserId());
			System.out.println(dbUser);
			if (dbUser.getUserId().equals(user.getUserId())) {

				System.out.println("이미 존재하는 아이디입니다.");
				//System.out.println("첫 가입 유저... userPoint 올려드림.");
				session.setAttribute("user", dbUser);
				return "redirect:/main.jsp";
				
			}
		}
		else {
			System.out.println("추가정보 기기??");
			return "forward:/user/addKakaoUser.jsp";
	}
		System.out.println("아무 값이 입력되지 않은 관계로 처음 로그인 화면 돌아갑니다.");
		return "redirect:/user/loginTest(new).jsp";
	}
	
	@PostMapping(value="addKakaoUser")
	public String addKakaoUser(@ModelAttribute("user") User user, HttpSession session) throws Exception{
		
		System.out.println("가져온 User 정보 : "+user);
		
		userService.addUser(user);
		
		// session 등록
		session.setAttribute("user", user);
		return "redirect:/main.jsp";
	}
	
	@PostMapping("userImage")
	public String addUserImage(@ModelAttribute("file") MultipartFile file, User user) throws Exception {

		System.out.println("userImage ㅎㅇ");
		
		userImage = userRestDao.getUserImage(file);
		
		return userImage;
	}	
}