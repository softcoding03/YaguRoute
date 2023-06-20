package com.baseball.service.product;

import java.util.List;
import java.util.Map;

import com.baseball.common.domain.Search;
import com.baseball.service.domain.Product;



public interface ProductService {

	public void addProduct(Product product) throws Exception;
	
	public Product getProduct(int prodNo) throws Exception;
	
	public void updateProduct(Product product) throws Exception;
	
	public void deleteProduct(int prodNo) throws Exception;
	
	public Map<String, Object> getProductList(Map<String,Object> map) throws Exception;
	
	public Map<String, Object> getSalesProdList(Map<String,Object>map) throws Exception;
	
	public List<String> autoComplete() throws Exception;
	
}
