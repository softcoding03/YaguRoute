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

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("tranDetail", tranDetail);
		modelAndView.addObject("prodQuantity", prodQuantity);
		modelAndView.addObject("prodPrice", prodPrice);
		modelAndView.addObject("totalPrice", prodQuantity * prodPrice);
		modelAndView.setViewName("forward:/transaction/addTransactionView.jsp");

		System.out.println("---/transaction/addTransactionView 작동 완료---");

		return modelAndView;
	}

}
