package com.baseball.test.user;

import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.baseball.common.domain.Search;
import com.baseball.service.domain.User;
import com.baseball.service.user.UserDao;
import com.baseball.service.user.UserService;

import junit.framework.Assert;


@SpringBootTest
public class UserTest {
	
	@Autowired
	@Qualifier("userServiceImpl")
	UserService userService;
	UserDao userDao;
	
	//@Test
	public void testAddUser() throws Exception{
		
		User user = new User();
		
		user.setUserId("락성두");
		user.setPassword("drogba");
		user.setUserPhone("01012341234");
		user.setUserName("유우자");
		user.setUserNickName("우리형");
		user.setUserAddr("경기도 시흥시 팔달구");
		user.setUserBirth("19980808");
		user.setUserEmail("rockseong@naver.com");
		user.setUserPoint(95000);
		user.setRole("user");
		user.setGender("M");
		user.setWithDraw(0);
		user.setUserImage("C://workSpringBoot");
		user.setTeamCode("HH");
		System.out.println("RockSeong 바부");
		userService.addUser(user);
		
		user = userService.getUser("rockseong4");
		
		Assert.assertEquals("rockseong4", user.getUserId());
		Assert.assertEquals("rockseong1234", user.getPassword());
		System.out.println(user);
		
	}
	
	//@Test 
	public void testGetUser() throws Exception{
		User user = new User();
		user = userService.getUser("rockseong");
		System.out.println(user);
	} 
	
	//@Test
	public void testUpdateUser() throws Exception{

		User user = new User();
		user = userService.getUser("rockseong3");
		user.setUserEmail("ronaldo@naver.com");
		user.setGender("M");
		user.setPassword("ronaldo12345");
		user.setTeamCode("SK");
		user.setUserBirth("20200505");
		user.setUserImage("ronaldo.png");
		user.setUserName("호두");
		user.setUserNickName("크리스티아누");
		user.setUserPhone("01000000000");
		
		userService.updateUser(user);
	}
	
	//@Test
	public void testgetUserList() throws Exception{
		// searchCondition은 상품명(0)으로 조회할껀지 상품번호(1)로 조회할 것인지... 그 때 사용함.
		
		Search search = new Search(); // search 객체 생성
		
		search.setCurrentPage(1); // 현재 페이지를 1로 세팅
		search.setPageSize(4); // 한 페이지당 보이는 게시물을 3개로 세팅
		Map<String, Object> map = userService.getUserList(search); // K,V형태 저장, search내부는 위 설정한 CurrentPage, pageSize 값만 설정해줌을 확인
		System.out.println("search : "+search);// search에 설정한 현재 페이지와 페이지 사이즈의 값만 설정 확인가능
		System.out.println("getUserList : "+userService.getUserList(search)); // map형태로 데이터가 들어가 있는 것을 확인한다.
		// list = [User....]라고 작성되어있다. 이유는 list는 serviceImpl에서 작성한 put.("list", list) 형태로 들어가 list라는 것에 존재하기 때문,
		// User[]는 User객체안에 데이터가 명시되어있기 때문이다.
		int totalCount = (Integer)map.get("totalCount");
		search.setCurrentPage(1); // 현재 페이지를 1로 set
		search.setPageSize(10); // 현재 페이지의 출력되는 갯수를 10으로 설정, 이보다 더 적든, 많든 설정에 문제가 없다. 
		search.setTeamCondition("0"); // 아직 Condition은 구현을 하지 않아서 임의로 0을 입력한다.
		
		List<User> userlist = (List<User>)map.get("호날두"); // 문자열이 "호날두"에 해당하는 리스트 안에 존재하는 값들을 가지고 온다.
		Assert.assertEquals(4, userlist.size()); // User가 총 4명이므로... 4를 출력한다. 4와 일치하므로.. 오류 X
		System.out.println("userList : "+userlist); // 이제 문자열 "호날두"내부에 있는 리스트를 가져와 출력한다. 
		for(User user1:userlist) {
			System.out.println(user1); // 1~4까지 존재하는 UserList를 출력한다.
		}
		System.out.println("userList : "+totalCount); // totalCount는 전체 회원 수를 출력한다.
		
	}
	
	//@Test
	public void testupdatePoint() throws Exception{
		
		User user = new User();
		user = userService.getUser("rockseong4");
		user.setUserPoint(10000);
		System.out.println(user.getUserPoint());
		System.out.println(user);
	}
	
	//@Test
	public void withDrawTest() throws Exception{
		
		User user = new User();
		user = userService.getUser("rockseong4");
		userService.withDraw(user);
		
	}
	
	
}
