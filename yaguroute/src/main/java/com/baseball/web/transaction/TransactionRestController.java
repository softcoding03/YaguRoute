package com.baseball.web.transaction;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.baseball.service.domain.Product;
import com.baseball.service.domain.TranDetail;
import com.baseball.service.domain.Transaction;
import com.baseball.service.domain.User;
import com.baseball.service.importAPI.ImportAPIRestService;
import com.baseball.service.product.ProductService;
import com.baseball.service.trandetail.TranDetailService;
import com.baseball.service.transaction.TransactionService;
import com.baseball.service.user.UserService;

@RestController
@RequestMapping("/transaction/rest/*")
public class TransactionRestController {
	
	@Autowired
	@Qualifier("transactionServiceImpl")
	private TransactionService transactionService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("tranDetailServiceImpl")
	private TranDetailService tranDetailService;
	
	@Autowired
	@Qualifier("importAPIRestServiceImpl")
	private ImportAPIRestService importAPIRestService;
	
	
	@GetMapping("refund/{tranDetailNo}")
	public String refund(@PathVariable int tranDetailNo, HttpSession session) throws Exception {
		
		System.out.println("/transaction/rest/refund 작동시작");
		System.out.println("refund로 넘어온 tranDetailNo??"+tranDetailNo);
		
		String resultData;
		TranDetail tranDetail = tranDetailService.getTranDetail(tranDetailNo);
		String merchantNo = tranDetail.getTranDetailTran().getMerchantNo();	
		System.out.println("merchantNo"+merchantNo);
//		User user = (User)session.getAttribute("user");


		System.out.println("user:: "+tranDetail.getTranDetailTran().getBuyer()); //userId만 존재. algudgod
		String userId = tranDetail.getTranDetailTran().getBuyer().getUserId(); 
		User user = userService.getUser(userId);
		System.out.println("userPhone"+user.getUserPhone()); 
		String userPhone = user.getUserPhone();
		String contents;
		
		String result = importAPIRestService.importRefund(merchantNo, 0);
		
		if(result.equals("success")) {
			System.out.println("환불 성공");
			tranDetailService.getTranDetail(tranDetailNo);

			contents = user.getUserName()+"님께서 결제하신 상품의 취소가 완료 되었습니다." +
					"[야구루트 결제 취소내역] \n 결제 취소 금액: "+tranDetail.getTranDetailTran().getTranTotalPrice()+"원"+
					"\n "+tranDetail.getTranDetailTran().getTranDate();
			result = importAPIRestService.sendSMS(contents, userPhone);
			System.out.println("sendSMS 요청:: "+result);	
			
			int tranUsePoint = tranDetail.getTranDetailTran().getTranUsePoint(); // 사용했던 포인트
			int tranAddPoint = tranDetail.getTranDetailTran().getTranAddPoint(); // 적립된 포인트
			System.out.println("tranUsePoint"+tranUsePoint);
			System.out.println("tranAddPoint"+tranAddPoint);
		
			int userPoint = user.getUserPoint();
			System.out.println("userPoint"+userPoint);  //UserPoint 업데이트를 위한 호출  안찍힘
			
			user.setUserPoint(user.getUserPoint()+tranUsePoint-tranAddPoint); // userPoint 재 셋팅
			
			userService.updatePoint(user);
					
			int tranQuantity = tranDetail.getTranQuantity(); // 구매한 총 수량
			System.out.println("tranQuantity"+tranQuantity);
			Product product = new Product(); 		
			int prodStock = tranDetail.getTranDetailProd().getProdStock();
			System.out.println("prodStock"+prodStock);
			product.setProdStock(prodStock+tranQuantity);
			
			productService.updateProduct(product);
			System.out.println("userPoint, 재고 update끝"+product);
			resultData = "success";
		} else {
			System.out.println("환불 실패");
			resultData = "fail";
		} 
		System.out.println(resultData);
		return resultData;
	}

	@GetMapping("sendSMS")
	public String sendSMS(HttpSession session) throws Exception {
//		System.out.println("tranDetailNo"+tranDetailNo);
		System.out.println("sendSMS 작동 시작");
//		TranDetail tranDetail = tranDetailService.getTranDetail(tranDetailNo);
		User user = (User)session.getAttribute("user");
		String userPhone = user.getUserPhone();
		String contents;
		contents = user.getUserName()+"님께서 주문하신 상품이 결제 완료 되었습니다.";
		
		String result = importAPIRestService.sendSMS(contents, userPhone); // 번호와 내용을 변수로 보내는 것
		System.out.println("sendSMS 작동 종료?"+result);
		return result;
	}
	
}
