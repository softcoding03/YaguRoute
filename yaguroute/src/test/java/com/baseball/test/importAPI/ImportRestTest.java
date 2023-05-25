package com.baseball.test.importAPI;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.baseball.service.importAPI.ImportAPIRestService;

@SpringBootTest
public class ImportRestTest{
	
	@Autowired
	@Qualifier("importAPIRestServiceImpl")
	private ImportAPIRestService importAPIRestService;
	
	//문자메세지 전송 메소드
	@Test
	public void sendSMS() throws Exception{
		String userPhone; //수신자 번호
		//String[] phoneNumber = Phone.split("-"); //body에서는 번호만 입력되어야 함(-제외)
		//String userPhone = phoneNumber[0]+phoneNumber[1]+phoneNumber[2];
		String contents; //메세지 내용
		
		userPhone ="01097833446";
		contents = "김미형씨 서울지검입니다. 대출사기 사건에 피의자로 지명되셨습니다.";
		
		String result = importAPIRestService.sendSMS(contents, userPhone); //번호와 내용을 변수로 보내줄 것
		System.out.println("SMS전송 요청 결과는?"+result);
	}
	
	
	
	//환불 요청 메소드
	//@Test
	public void importRefund() throws Exception{
		
		String merchantId; //주문번호
		int amount = 0;	//가격  ( ! 부분취소인 경우 default 0 으로 사용할것 !)
		
		//----상품에서 환불요청인 경우
		List<String> list = new ArrayList<String>();
		String prodNo1 = "4";
		String prodNo2 = "1";
		list.add(prodNo1);
		list.add(prodNo2); //환불 후 해당하는 상품의 TranDetail 테이블의 refund 코드변경 위함
		
		//----ticket에서 환불요청인 경우
		int tranNo = 30; //환불 후 해당하는 transaction의 refund 코드변경 위함
		
		merchantId ="35g82dif5410222"; //해당 구매정보의 merchant_id 
		//amount = 100;
		
		String result = importAPIRestService.importRefund(merchantId, amount); //주문번호&가격으로 환불 요청
		System.out.println(" 결과는 ? " +result);
		if(result.equals("success")) {
			System.out.println("성공...환불완료 후 진행할 로직을 작성하시오...");
		} else {
			System.out.println("다시 시도하세요...");
		}
		
		// 환불 후에 환불 상태코드 변경 및
		// 화면단에서 NaverSENS 메세지 전송을 위한 유저 정보를 리턴해줘야함.
	}
}