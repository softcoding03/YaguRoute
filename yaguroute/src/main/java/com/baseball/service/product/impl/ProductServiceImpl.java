package com.baseball.service.product.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baseball.service.domain.Product;
import com.baseball.service.product.ProductDao;
import com.baseball.service.product.ProductService;

@Service("productServiceImpl")
public class ProductServiceImpl implements ProductService {

	
	//Field
	@Autowired
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
	
	



}
