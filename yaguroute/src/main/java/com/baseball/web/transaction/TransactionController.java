package com.baseball.web.transaction;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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

import com.baseball.common.domain.Page;
import com.baseball.common.domain.Search;
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
	public ModelAndView addTransactionView(@RequestParam("prodNo") List<Integer> prodNo,
			@RequestParam("prodQuantity") List<Integer> prodQuantity, @RequestParam List<Integer> prodPrice) throws Exception {

		System.out.println("---/transaction/addTransactionView 작동 시작---");

		List<TranDetail> tranDetailList = new ArrayList<>();
		List<Basket> basketList = new ArrayList<>();
		List<Product> prodList = new ArrayList<>();
		List<Transaction> tranList = new ArrayList<>();
		
		int prodSize = prodNo.size();
		
		int totalPrice = 0;
		
		for(int i =0; i<prodSize;i++) {
			TranDetail tranDetail = new TranDetail();
			tranDetail.setTranDetailProd(productService.getProduct(prodNo.get(i)));
			Basket basket = new Basket();
			basket.setProdQuantity(prodQuantity.get(i));
			Product product = new Product();
			product.setProdPrice(prodPrice.get(i));
			Transaction transacton = new Transaction();
			int tranTotalPrice = prodQuantity.get(i) * prodPrice.get(i);
			totalPrice += tranTotalPrice;
			System.out.println(totalPrice);
			transacton.setTranTotalPrice(tranTotalPrice);
			
			tranDetailList.add(tranDetail);
			basketList.add(basket);
			prodList.add(product);
			tranList.add(transacton);
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("prodCount", tranList.size());
		modelAndView.addObject("totalPrice", totalPrice);
		modelAndView.addObject("tranDetailList", tranDetailList);
		modelAndView.addObject("prodQuantity", prodQuantity);
		modelAndView.addObject("prodPrice", prodPrice);
		modelAndView.addObject("tranList", tranList);
		modelAndView.setViewName("forward:/transaction/addTransactionView.jsp");
		
		System.out.println("---/transaction/addTransactionView 작동 완료---");

		return modelAndView;
	}

	@PostMapping(value = "addTransaction")
	public String addTransaction(@ModelAttribute("transaction") Transaction transaction,
	        @RequestParam("prodNo") List<String> prodNo, @RequestParam("userId") String userId,
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
			    List<Product> prodList = new ArrayList<>();
			    for(String str : prodNo) {
			    	Product product = productService.getProduct(Integer.parseInt(str));
			    	prodList.add(product);
			    }
			    
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
			    //System.out.println("setting된 tranNo 정보:: "+transaction);
			    TranDetail tranDetail = new TranDetail();
			    tranDetail.setTranStatusCode("1"); // 1:구매완료 2:배송중 3:배송완료
			    tranDetail.setTranDetailTran(transaction);  // 구매한 transaction 설정
			    tranDetail.setTranQuantity(prodQuantity); // 구매한 상품 수량 설정
			    tranDetail.setRefundStatusCode("1"); // 환불 상태 코드 설정
			    for(Product prod : prodList) {
			    	tranDetail.setTranDetailProd(prod);
			    	tranDetailService.addTranDetail(tranDetail);
			    	int updateQuantity = prod.getProdStock() - prodQuantity;
			    	prod.setProdStock(updateQuantity);
				    		    
				    productService.updateProduct(prod);
			    }
			    
			    // 재고 업데이트 시작			
			    
			    
			    model.addAttribute("tranDetail", tranDetail);
			    model.addAttribute("transaction", transaction);
		
			    return "forward:/transaction/addTransaction.jsp";
	}
	
	@RequestMapping("getTransaction")
	public ModelAndView getTransaction(@RequestParam("tranNo") int tranNo) throws Exception {
		
		System.out.println("tranNo:: "+tranNo);
		System.out.println("/transaction/getTransaction 작동 시작");

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("transaction", transactionService.getTransaction(tranNo));
		modelAndView.setViewName("forward:/transaction/getTransaction.jsp");
		
		return modelAndView;
	}

	@GetMapping("listTransaction")
	public String getTranDetailList (@ModelAttribute("search")Search search, HttpSession session, Model model) throws Exception {
		
		System.out.println("search" +search); //당연히 값 없음
		System.out.println("/transaction/listTransaction 작동 시작");
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(8);
		System.out.println("데이터가 들어간" + search);
		
		User user = (User)session.getAttribute("user");
		String userId = user.getUserId();
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map = tranDetailService.getTranDetailList(search, userId);
		
		List<TranDetail> list = (List<TranDetail>) map.get("tranList");
		
		// 페이지 객체 생성 & map에서 product totalCount(총 개수) 출력
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		
		model.addAttribute("list", map.get("tranList"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("userId", userId);
		
		return "forward:/transaction/listTransaction.jsp";
	}

	@GetMapping("dlvyTranList")
	public String getDlvyTranList (@ModelAttribute("search")Search search, Model model) throws Exception {
		
		System.out.println("search" +search); //당연히 값 없음
		System.out.println("/transaction/getDlvyTranList 작동 시작");
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		System.out.println("데이터가 들어간" + search);
		
		
		Map<String, Object> map = tranDetailService.getDlvyTranList(search);
		
		List<TranDetail> list = (List<TranDetail>) map.get("dlvyList");
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		model.addAttribute("list", map.get("dlvyList"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/transaction/dlvyTranList.jsp";
	}
	
		
	
	@RequestMapping("updateTranStatusCode")
	public ModelAndView updateTranStatusCode(@ModelAttribute("tranDetail")TranDetail tranDetail) throws Exception {
		
		tranDetailService.updateTranStatusCode(tranDetail);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/transaction/dlvyTranList");

		return modelAndView;
		
	}
	
	@RequestMapping("updateRefundStatusCode")
	public ModelAndView updateRefundStatusCode(@ModelAttribute("tranDetail")TranDetail tranDetail) throws Exception {
		
		tranDetailService.updateRefundStatusCode(tranDetail);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/transaction/dlvyTranList");

		return modelAndView;
		
	}
	
}
