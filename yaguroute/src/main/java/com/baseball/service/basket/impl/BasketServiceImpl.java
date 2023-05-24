package com.baseball.service.basket.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.baseball.service.basket.BasketDao;
import com.baseball.service.basket.BasketService;
import com.baseball.service.domain.Basket;

public class BasketServiceImpl implements BasketService {
	
	@Autowired
	@Qualifier("basketDao")
	private BasketDao basketDao;

	public BasketServiceImpl() {
		System.out.println(this.getClass());
	}

	public void addBasketProd(Basket basket) {
		basketDao.addBasketProd(basket);
	}
	
	public List<Basket> getBasketList(String userId){
		return basketDao.getBasketList(userId);
	}
	
	public void deleteBasket(Basket basket) {
		basketDao.deleteBasket(basket);
	}
	
	public void updateBasketProdQuantity(Basket basket) {
		basketDao.updateBasketProdQuantity(basket);
	}
	
}
