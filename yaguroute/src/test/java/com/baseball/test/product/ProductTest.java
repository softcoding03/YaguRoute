package com.baseball.test.product;

import java.util.HashMap;
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
		product.setProdNo(66);
		product.setProdName("서울정수빈");
		product.setProdPrice(24000);
		product.setProdStock(500);
		product.setProdCategory(4);
		product.setProdTeamCode("KT");
		product.setProdImageFirst("testImageFile12");
		product.setProdImageSecond("testImageFile23");
		product.setProdImageThird("testImageFile34");
		
			
		productService.addProduct(product);
		product = productService.getProduct(66);
		
		//System.out.println("addProductTest:: "+product);
		
		Assert.assertEquals(66, product.getProdNo());
		Assert.assertEquals("서울정수빈", product.getProdName());
		Assert.assertEquals(24000, product.getProdPrice());
		Assert.assertEquals(500, product.getProdStock());
		Assert.assertEquals(4, product.getProdCategory());
		Assert.assertEquals("KT", product.getProdTeamCode());
		Assert.assertEquals("testImageFile12", product.getProdImageFirst());
		Assert.assertEquals("testImageFile23", product.getProdImageSecond());		
		Assert.assertEquals("testImageFile34", product.getProdImageThird());

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
		//Assert.assertEquals("yang_old_uniform.jpg", product.getProdImage());
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
		//Assert.assertEquals("/images/sk_uniform.jpg", product.getProdImage());
		Assert.assertEquals("HH", product.getProdTeamCode());
		
	
		product.setProdName("정은원 홈 유니폼");
		product.setProdPrice(120000);
		product.setProdStock(50);
		product.setProdCategory(1);
		//product.setProdImage("testImageFile");
		product.setProdTeamCode("HH");
		
		
		productService.updateProduct(product);
		
		product = productService.getProduct(1);
		Assert.assertNotNull(product);
		
		//System.out.println("testUpdate 가랏! :: "+product);
		
		Assert.assertEquals("정은원 홈 유니폼", product.getProdName());
		Assert.assertEquals(120000, product.getProdPrice());
		Assert.assertEquals(50, product.getProdStock());
		Assert.assertEquals("유니폼", product.getProdCategory());
		//Assert.assertEquals("testImageFile", product.getProdImage());
		Assert.assertEquals("HH", product.getProdTeamCode());
	}
	
	//@Test
	public void testDeleteProduct() throws Exception {
			
		productService.deleteProduct(3);
			
		System.out.println("testDelete:: ");
		
	}
	
	//@Test
//	public void testGetProductList() throws Exception {
		
//		Search search = new Search ();
//		search.setCurrentPage(1);
//		search.setPageSize(3);
		
//		Map<String,Object> map = productService.getProductList(search);
	 	
//	 	List<Object> list = (List<Object>)map.get("list");
//	 	Assert.assertEquals(5, list.size());
//		
		
//	 	System.out.println("어디에 있니 잘 왔니? "+list);
	 	
//	 	Integer totalCount = (Integer)map.get("totalCount");
//	 	System.out.println(totalCount);
	 	
//	 	System.out.println("=======================================");
	 	
//		Map<String, Object> map = new HashMap<String,Object>();
//		map.put("prodTeamCode", "HH");
//		map.put("search", search);
//		map = productService.getProductList(search);
		
			
//		List<Product> prodlist = (List<Product>)map.get("prodlist");
//	 	for(Product prod:prodlist) {
//	 		System.out.println(prod);
//	 	}
//			
//	 	totalCount = (Integer)map.get("totalCount");
//	 	System.out.println(totalCount);
		
	
			
		
//	}
	
	
}
