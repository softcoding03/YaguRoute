package com.baseball.service.product.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.baseball.service.domain.Product;
import com.baseball.service.product.ProductDao;
import com.baseball.service.product.ProductService;

@Service("productServiceImpl")
public class ProductServiceImpl implements ProductService {

	
	//Field
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
	public List<Product> getProductList(Product product) throws Exception {
	    return productDao.getProductList(product);
	    
	}
	
	



}
