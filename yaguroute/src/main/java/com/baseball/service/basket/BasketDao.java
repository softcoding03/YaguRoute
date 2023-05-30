package com.baseball.service.basket;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.baseball.service.domain.Basket;

@Mapper
public interface BasketDao {
	
	public void addBasketProd(Basket basket);
	
	public List<Basket> getBasketList(Basket basket);
	
	public void deleteBasket(Basket basket);
	
	public void updateBasketProdQuantity(Basket basket);

}
