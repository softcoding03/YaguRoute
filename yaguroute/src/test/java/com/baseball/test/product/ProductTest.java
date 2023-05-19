package com.baseball.test.product;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.baseball.service.domain.Product;
import com.baseball.service.product.ProductService;

public class ProductTest {

	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	
	@Test
	public void testAddProduct() throws Exception {
		
		Product product = new Product();
		product.setProdNo(3);
		product.setProdName("정수빈레고피규어");
		product.setProdPrice(24000);
		product.setProdStock(400);
		product.setProdCategory("잡화");
		product.setProdImage("testImageFile");
		product.setProdteamCode("OB");
			
		productService.addProduct(product);
		
		Assert.assertEquals(3, product.getProdNo());
		Assert.assertEquals("정수빈레고피규어", product.getProdName());
		Assert.assertEquals(0, 0);
		Assert.assertEquals(0, 0);
		Assert.assertEquals(0, 0);
		Assert.assertEquals(0, 0);
		Assert.assertEquals(0, 0);

	}
}
