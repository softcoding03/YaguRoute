package com.baseball.web.basket;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.baseball.service.basket.BasketService;
import com.baseball.service.domain.Basket;
import com.baseball.service.product.ProductService;

@RestController
@RequestMapping("/basket/json/*")
public class BasketRestController {
	
	public BasketRestController() {
		System.out.println(this.getClass());
	}
	
	@Autowired
	@Qualifier("basketServiceImpl")
	private BasketService basketService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	
	@PostMapping("addBasket/{prodNo}")
	public String addBasket(@RequestBody Basket basket,@PathVariable String prodNo, HttpServletRequest request) throws Exception {
		
		String message="";
		basket.setProduct(productService.getProduct(Integer.parseInt(prodNo)));
		if(basketService.getBasketList(basket).size() == 0) {
			basketService.addBasketProd(basket);
			message="장바구니에 담겼습니다.";
		}else {
			message="이미 장바구니에 담긴 상품입니다.";
		}
		System.out.println(message);
		return message;
	}
	
	@PostMapping("deletebasket/{prodNo}")
	public Basket deleteBasket(@RequestBody Basket basket,@PathVariable String prodNo) throws Exception {
		if(prodNo != null) {
			basket.setProduct(productService.getProduct(Integer.parseInt(prodNo)));
		}
		basketService.deleteBasket(basket);
		System.out.println(basket);
		
		return basket;
	}
	
	@PostMapping("deleteAllBasket")
	public Basket deleteAllBasket(@RequestBody Basket basket) throws Exception {
		System.out.println(basket);
		basketService.deleteBasket(basket);
		
		return basket;
	}
	
	@PostMapping("updateBasketProdQuantity/{prodNo}")
	public Basket updateBasketProdQuantity(@RequestBody Basket basket, @PathVariable String prodNo) throws Exception {
		basket.setProduct(productService.getProduct(Integer.parseInt(prodNo)));
		basketService.updateBasketProdQuantity(basket);
		System.out.println("updateBasketProdQuantity 성공");
		
		return basket;
	}


}
