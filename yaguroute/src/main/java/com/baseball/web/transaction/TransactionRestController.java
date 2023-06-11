package com.baseball.web.transaction;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.baseball.service.domain.TranDetail;
import com.baseball.service.domain.Transaction;
import com.baseball.service.domain.User;
import com.baseball.service.importAPI.ImportAPIRestService;
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
	@Qualifier("tranDetailServiceImpl")
	private TranDetailService tranDetailService;
	
	@Autowired
	@Qualifier("importAPIRestServiceImpl")
	private ImportAPIRestService importAPIRestService;
	
	
	@GetMapping("refund/{tranDetailNo}")
	public String refund(@PathVariable int tranDetailNo, HttpSession session,
							@ModelAttribute("transaction")Transaction transaction) throws Exception {
		
		System.out.println("/transaction/rest/refund 작동시작");
		System.out.println("refund로 넘어온 tranDetailNo??"+tranDetailNo);
		
		String resultData;
		//User user = (User)session.getAttribute("user");
		TranDetail tranDetail = tranDetailService.getTranDetail(tranDetailNo);
		String merchantNo = transaction.getMerchantNo();
		
		String result = importAPIRestService.importRefund(merchantNo, tranDetailNo);
		if(result.equals("success")) {
			System.out.println("환불 성공");
			tranDetailService.getTranDetail(tranDetailNo);
			tranDetailService.updateRefundStatusCode(tranDetail);
			resultData = "success";
		} else {
			System.out.println("환불 실패");
			resultData = "fail";
		}  
		return resultData;
	}

}
