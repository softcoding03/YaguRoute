package com.baseball.test.basket;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.baseball.service.basket.BasketDao;
import com.baseball.service.domain.Basket;
import com.baseball.service.product.ProductDao;

@SpringBootTest
public class BasketTests {

	public BasketTests() {
		// TODO Auto-generated constructor stub
	}
	
	@Autowired
	@Qualifier("basketDao")
	private BasketDao basketDao;
	
	@Autowired
	@Qualifier("productDao")
	private ProductDao prodDao;
	
	@Test
	public void addBasketProd() throws Exception{
		Basket basket = new Basket();
		basket.setProdQuantity(2);
		basket.setProduct(prodDao.getProduct(6));
		basket.setUserId("rockseong3");
		basketDao.addBasketProd(basket);
	}
	
	//@Test
	public void getBasketList() {
		Basket bas = new Basket();
		bas.setUserId("rockseong3");
		List<Basket> basket = basketDao.getBasketList(bas);
		for(Basket tmp : basket) {
			System.out.println(tmp);
		}
	}
	
	//@Test
	public void deleteBasket() throws Exception{
		Basket basket = new Basket();
		basket.setUserId("rockseong3");
		basketDao.deleteBasket(basket);
	}
	
	//@Test
	public void updateBasketProdQuantity() throws Exception {
		Basket basket = new Basket();
		basket.setProdQuantity(20);
		basket.setUserId("rockseong3");
		basket.setProduct(prodDao.getProduct(2));
		basketDao.updateBasketProdQuantity(basket);
	}

}
