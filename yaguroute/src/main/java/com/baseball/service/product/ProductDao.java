package com.baseball.service.product;

import org.apache.ibatis.annotations.Mapper;

import com.baseball.service.domain.Product;



@Mapper
public interface ProductDao {

	
	//Add
	public void addProduct(Product product) throws Exception;
	
	
}
