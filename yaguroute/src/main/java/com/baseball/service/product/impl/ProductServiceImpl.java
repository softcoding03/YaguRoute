package com.baseball.service.product.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.baseball.common.domain.Search;
import com.baseball.service.domain.Product;
import com.baseball.service.product.ProductDao;
import com.baseball.service.product.ProductService;

@Service("productServiceImpl")
public class ProductServiceImpl implements ProductService {


	@Autowired
	@Qualifier("productDao")
	private ProductDao productDao;
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	
	public ProductServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addProduct(Product product) throws Exception {
		productDao.addProduct(product);
		
	}

	@Override
	public Product getProduct(int product) throws Exception {
		return productDao.getProduct(product);
	}

	@Override
	public void updateProduct(Product product) throws Exception {
		productDao.updateProduct(product);
		
	}

	@Override
	public int deleteProduct(int product) throws Exception {
		return productDao.deleteProduct(product);
	}

	@Override
	public Map<String, Object> getProductList(Map<String,Object> map) throws Exception {
		List<Product> list= productDao.getProductList(map);
		int totalCount = productDao.getTotalCount(map);
		
		Map<String, Object> prodMap = new HashMap<String, Object>();
		prodMap.put("prodList", list );
		prodMap.put("totalCount", new Integer(totalCount));
		
		return prodMap;
		
	}

	@Override
	public Map<String, Object> getSalesProdList(Map<String, Object> map) throws Exception {
		List<Product> List = productDao.getSalesProdList(map);
		int totalCount = productDao.getTotalCount(map);
		
		Map<String, Object> salesMap = new HashMap<String, Object>();
		salesMap.put("salesList", List);
		salesMap.put("totalCount", new Integer(totalCount));
		
		return salesMap;
	}

	
//	@Override
//	public List<String> autoComplete() throws Exception {
//		return productDao.autoComplete();
//	}

}
