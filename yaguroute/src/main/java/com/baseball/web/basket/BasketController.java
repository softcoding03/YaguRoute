package com.baseball.web.basket;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.baseball.service.basket.BasketService;
import com.baseball.service.domain.Basket;
import com.baseball.service.domain.User;

@Controller
@RequestMapping("/basket/*")
public class BasketController {
	
	public BasketController() {
		System.out.println(this.getClass());
	}
	
	@Autowired
	@Qualifier("basketServiceImpl")
	private BasketService basketService;
	
	@GetMapping("getBasketList")
	public String getBasketList(HttpSession session ,HttpServletRequest request) {
		User user = (User)session.getAttribute("user");
		
		Basket basket = new Basket();
		basket.setUserId(user.getUserId());
		System.out.println(basket);
		List<Basket> basketList = basketService.getBasketList(basket);
		int totalPrice = 0;
		for(Basket basketTmp : basketList) {
			totalPrice += basketTmp.getProduct().getProdPrice()*basketTmp.getProdQuantity();
		}
		
		System.out.println(totalPrice);
		
		request.setAttribute("basketSize", basketList.size());
		request.setAttribute("totalPrice", totalPrice);
		request.setAttribute("basketList", basketList);
		
		return "/basket/getBasketList.jsp";
	}
	
}
