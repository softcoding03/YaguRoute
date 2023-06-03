package com.baseball.web.transaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.baseball.service.domain.Basket;
import com.baseball.service.domain.Product;
import com.baseball.service.domain.TranDetail;
import com.baseball.service.domain.Transaction;
import com.baseball.service.domain.User;
import com.baseball.service.product.ProductService;
import com.baseball.service.trandetail.TranDetailService;
import com.baseball.service.transaction.TransactionService;
import com.baseball.service.user.UserService;

@Controller
@RequestMapping("/transaction/*")
public class TransactionController {

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
	@Qualifier("productServiceImpl")
	private ProductService productService;

	public TransactionController() {
		System.out.println(this.getClass());
	}

	@Value("${commonProperties.pageUnit}")
	int pageUnit;

	@Value("${commonProperties.pageSize}")
	int pageSize;

	@GetMapping(value = "addTransaction")
	public ModelAndView addTransactionView(@RequestParam("prodNo") int prodNo,
			@RequestParam("prodQuantity") int prodQuantity, @RequestParam int prodPrice) throws Exception {

		System.out.println("---/transaction/addTransactionView 작동 시작---");

		TranDetail tranDetail = new TranDetail();
		tranDetail.setTranDetailProd(productService.getProduct(prodNo));

		Basket basket = new Basket();
		basket.setProdQuantity(prodQuantity);

		Product product = new Product();
		product.setProdPrice(prodPrice);

		Transaction transacton = new Transaction();

		int tranTotalPrice = prodQuantity * prodPrice;
		transacton.setTranTotalPrice(tranTotalPrice);

		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("tranDetail", tranDetail);
		modelAndView.addObject("prodQuantity", prodQuantity);
		modelAndView.addObject("prodPrice", prodPrice);
		modelAndView.addObject("tranTotalPrice", tranTotalPrice);
		modelAndView.setViewName("forward:/transaction/addTransactionView.jsp");
		System.out.println(tranDetail);
		System.out.println("---/transaction/addTransactionView 작동 완료---");

		return modelAndView;
	}

	@PostMapping(value = "addTransaction")
	public String addTransaction(@ModelAttribute("transaction") Transaction transaction,
	        @RequestParam("prodNo") String prodNo, @RequestParam("userId") String userId,
	        @RequestParam("impNo") String impNo, @RequestParam("merchantNo") String merchantNo,
	        @RequestParam("prodQuantity") int prodQuantity, Model model)
	        throws Exception {
		
			    System.out.println("---/transaction/addTransaction 작동 시작---");
			    System.out.println("Transaction Data:: " + transaction);
			    System.out.println("prodNo:: " + prodNo);
			    System.out.println("userId:: " + userId);
			    System.out.println("impNo:: " + impNo);
			    System.out.println("merchantNo:: " + merchantNo);
			    System.out.println("prodQuantity"+prodQuantity);
		
			    // 상품과 사용자 정보 가져오기
			    Product product = productService.getProduct(Integer.parseInt(prodNo));
			    User user = userService.getUser(userId);
		
			    // Transaction 객체 설정
			    transaction.setBuyer(user);
			    transaction.setTranType("P");
		
			    transaction.setImpNo(impNo);
			    transaction.setMerchantNo(merchantNo);
			
			    int tranNo = transactionService.addTransaction(transaction);  
			    //System.out.println("add된 transaction 정보:: "+transaction);
	
			    transaction.setTranNo(tranNo);
			    //TranDetail 객체 설정하고 add 시작
			    TranDetail tranDetail = new TranDetail();
			    tranDetail.setTranDetailProd(product);
			    tranDetail.setTranStatusCode("1"); // 구매완료
			    tranDetail.setTranDetailTran(transaction);  // 구매한 transaction 설정
			    tranDetail.setTranQuantity(prodQuantity); // 상품 수량 설정
			    tranDetail.setRefundStatusCode("1"); // 환불 상태 코드 설정
		
			    //System.out.println("setting된 tranNo 정보:: "+transaction);
			    			    
			    tranDetailService.addTranDetail(tranDetail);
		
			    
			    // 재고 업데이트 시작
			    
			    model.addAttribute("tranDetail", tranDetail);
			    model.addAttribute("transaction", transaction);
		
			    return "forward:/transaction/addTransaction.jsp";
	}
}
