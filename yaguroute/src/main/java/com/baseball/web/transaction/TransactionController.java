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

import com.baseball.service.domain.Transaction;
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

	public TransactionController() {
		System.out.println(this.getClass());
	}
	
	@Value("${commonProperties.pageUnit}")
	int pageUnit;

	@Value("${commonProperties.pageSize}")
	int pageSize;
	

	@PostMapping(value="addTransaction")
	public String addTransaction(@ModelAttribute("transaction") Transaction transaction,
			Model model) throws Exception {
		
		System.out.println("---/transaction/addTransaction 작동 시작---");
		
		
		
		return "forward:/transaction/addTransaction.jsp";
	}

}
