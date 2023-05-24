package com.baseball.service.basket;

import java.util.List;

import com.baseball.service.domain.Basket;

public interface BasketService {
	
	public void addBasketProd(Basket basket);
	
	public List<Basket> getBasketList(String userId);
	
	public void deleteBasket(Basket basket);
	
	public void updateBasketProdQuantity(Basket basket);
}
