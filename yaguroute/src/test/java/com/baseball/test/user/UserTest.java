package com.baseball.test.user;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;
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
	public void testGetMeeting() throws Exception{
		
//		Meeting meeting = new Meeting();
//		
//		meeting = meetingService.getMeeting(1);
//		
//		Assert.assertEquals("Meeting 1", meeting.getMeetingName());
//		Assert.assertEquals("Seoul", meeting.getMeetingAddr());
//		Assert.assertEquals("Introduction 1", meeting.getMeetingIntro());
//		Assert.assertEquals(37.123456, meeting.getMeetingLat(),0);
//		Assert.assertEquals(127.654321, meeting.getMeetingLng(),0);
//		Assert.assertEquals(0, meeting.getEntryFee());
//		//Assert.assertEquals("2023-05-17", meeting.getMeetingDate());
//		//Assert.assertEquals("12:00:00", meeting.getMeetingStartTime());
//		//Assert.assertEquals("15:00:00", meeting.getMeetingEndTime());
//		Assert.assertEquals(1, meeting.getMeetingSuccess());
//		Assert.assertEquals("123 Main Street", meeting.getMeetingDetailAddr());
	}
	
	//@Test
	public void testAddUser() throws Exception{
		
		User user = new User();
		
//		user.setUserId("rockseong4");
//		user.setPassword("rockseong1234");
//		user.setUserPhone("01012341234");
//		user.setUserName("유우자");
//		user.setUserNickName("호날두이3");
//		user.setUserAddr("경기도 시흥시 팔달구");
//		user.setUserBirth("19980808");
//		user.setUserEmail("rockseong@naver.com");
//		user.setUserPoint("95000");
//		user.setRole("user");
//		user.setGender("M");
//		user.setWithDraw(0);
//		user.setUserImage("C://workSpringBoot");
//		user.setTeamCode("HH");
//		System.out.println("RockSeong 바부");
//		userService.addUser(user);
		
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
	public void testUpdateMeeting() throws Exception{

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
	
//	@Test
//	public void testupdatePoint() throws Exception{
//		
//		User user = new User();
//		user = userService.getUser("rockseong4");
//		userService.updatePoint("10000");
//		System.out.println(user);
//		
//	}
	
	//@Test
	public void withDrawTest() throws Exception{
		
		User user = new User();
		user = userService.getUser("rockseong4");
		userService.withDraw(user);
		
	}
	
	//@Test
	public void testGetMeetingListFromRarentClubNo() throws Exception{
		
//		Map<String, Object> map = meetingService.getMeetingListFromRarentClubNo(1);
//		
//		List<Object> list = (List<Object>)map.get("list");
//		
//		Assert.assertEquals(3, list.size());

	}
	
	//@Test
	public void testAddMeetingMember() throws Exception{
		
		
//		Map<String, String> map = new HashMap<>();
//		map.put("userNo", "1");
//		map.put("meetingNo", "2");
//				
//				
//		meetingService.addMeetingMember(map);

	}
	
	//@Test
	public void testUpdateMeetingMember() throws Exception{
//		
//		
//		Map<String, String> map = new HashMap<>();
//		map.put("memberNo", "1");
//		map.put("state", "1");
//
//				
//		meetingService.updateMember(map);

	}
	
	//@Test
	public void testDeleteMeetingMember() throws Exception{	
				
//		meetingService.deleteMeetingMember(1);

	}

}
