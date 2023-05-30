package com.baseball.service.product;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.baseball.common.domain.Search;
import com.baseball.service.domain.Product;



@Mapper
public interface ProductDao {

	

	public void addProduct(Product product) throws Exception;

	public Product getProduct(int prodNo) throws Exception;

	public void updateProduct(Product product) throws Exception;
	
	public int deleteProduct(int prodNo) throws Exception;
	
	public List<Product> getProductList(Map<String, Object> map) throws Exception;
	
	public int getTotalCount(Map<String, Object> map) throws Exception;

	//public List autoComplete() throws Exception;
	
	
}
