package com.baseball.service.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.baseball.service.domain.Product;



@Mapper
public interface ProductDao {

	
	//Add
	public void addProduct(Product product) throws Exception;
	//Select One
	public Product getProduct(int prodNo) throws Exception;
	//Update
	public void updateProduct(Product product) throws Exception;
	//Delete
	public int deleteProduct(int prodNo) throws Exception;
	
	
	//getList
	public List<Product> getProductList (Product product) throws Exception;
	
	
}
