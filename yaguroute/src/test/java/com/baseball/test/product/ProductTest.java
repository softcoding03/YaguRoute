package com.baseball.test.product;

import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.baseball.common.domain.Search;
import com.baseball.service.domain.Product;
import com.baseball.service.product.ProductService;


@SpringBootTest
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
		product.setProdTeamCode("OB");
		
			
		productService.addProduct(product);
		product = productService.getProduct(3);
		
		//System.out.println("addProductTest:: "+product);
		
		Assert.assertEquals(3, product.getProdNo());
		Assert.assertEquals("정수빈레고피규어", product.getProdName());
		Assert.assertEquals(24000, product.getProdPrice());
		Assert.assertEquals(400, product.getProdStock());
		Assert.assertEquals("잡화", product.getProdCategory());
		Assert.assertEquals("testImageFile", product.getProdImage());
		Assert.assertEquals("OB", product.getProdTeamCode());

	}
	
	//@Test
	public void testGetProduct() throws Exception {
		
		Product product = new Product();
		
		product = productService.getProduct(2);
		
		//System.out.println("TestgetProuct 할 수 있다 :: "+product);
		
		//==> API 확인
		Assert.assertEquals(2, product.getProdNo());
		Assert.assertEquals("양의지 올드 유니폼", product.getProdName());
		Assert.assertEquals(120000, product.getProdPrice());
		Assert.assertEquals(50, product.getProdStock());
		Assert.assertEquals("유니폼", product.getProdCategory());
		Assert.assertEquals("yang_old_uniform.jpg", product.getProdImage());
		Assert.assertEquals("OB", product.getProdTeamCode());
		
	}
	
	//@Test
	public void testUpdateProduct() throws Exception {
		
		Product product = productService.getProduct(1);
		Assert.assertNotNull(product);
		
		Assert.assertEquals("정은원 원정 유니폼", product.getProdName());
		Assert.assertEquals(10000, product.getProdPrice());
		Assert.assertEquals(10, product.getProdStock());
		Assert.assertEquals("유니폼", product.getProdCategory());
		Assert.assertEquals("/images/sk_uniform.jpg", product.getProdImage());
		Assert.assertEquals("HH", product.getProdTeamCode());
		
	
		product.setProdName("정은원 홈 유니폼");
		product.setProdPrice(120000);
		product.setProdStock(50);
		product.setProdCategory("유니폼");
		product.setProdImage("testImageFile");
		product.setProdTeamCode("HH");
		
		
		productService.updateProduct(product);
		
		product = productService.getProduct(1);
		Assert.assertNotNull(product);
		
		//System.out.println("testUpdate 가랏! :: "+product);
		
		Assert.assertEquals("정은원 홈 유니폼", product.getProdName());
		Assert.assertEquals(120000, product.getProdPrice());
		Assert.assertEquals(50, product.getProdStock());
		Assert.assertEquals("유니폼", product.getProdCategory());
		Assert.assertEquals("testImageFile", product.getProdImage());
		Assert.assertEquals("HH", product.getProdTeamCode());
	}
	
	//@Test
	public void testDeleteProduct() throws Exception {
			
		productService.deleteProduct(3);
			
		System.out.println("testDelete:: ");
		
	}
	
	//@Test
	public void testGetProductList() throws Exception {
		
		Search search = new Search ();
		search.setCurrentPage(1);
		search.setPageSize(3);
		Map<String, Object> map = productService.getProductList(search);
		
		List<Product> list = (List<Product>)map.get("list");
		Assert.assertEquals(3, list.size());
		
		
		Integer totalCount = (Integer)map.get("totalCount");		
		System.out.println("==================");
		
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("");
	 	
	 	map = productService.getProductList(search);
	 	
	 	List<Product> prodlist = (List<Product>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 
	 	//==> console 확인
	 	for(Product prod:prodlist) {
	 		System.out.println(prod);
	 	}
	 	System.out.println("productListTest:: "+totalCount);
		System.out.println("==================");
		
	 	totalCount = (Integer)map.get("totalCount");
	 	
			
		
	}
	
	
}
