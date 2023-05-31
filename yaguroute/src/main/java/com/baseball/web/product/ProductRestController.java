package com.baseball.web.product;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RestController;

import com.baseball.service.domain.Product;
import com.baseball.service.product.ProductService;




@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 구현 않음
		
	public ProductRestController(){
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping(value="json/getProduct/{prodNo}", method=RequestMethod.GET)
	public Product getproduct( @PathVariable int prodNo) throws Exception {
		
		System.out.println("/product/json/getProduct :GET");
		
		//Business Logic
		return productService.getProduct(prodNo);
	
	}

	
	@PostMapping(value="json/addProduct")
	public Product addProduct( @RequestBody Product product) throws Exception {
		
		productService.addProduct(product);
		
		return product;
		
	}
	
	@GetMapping(value="json/updateProduct/{prodNo}")
	public Product updateProduct( @PathVariable int prodNo) throws Exception {
		
		System.out.println("/product/json/updateProduct : GET");
		
		return productService.getProduct(prodNo);
		
	}

	@PostMapping(value="json/updateProduct")
	public Product updateProduct( @RequestBody Product product) throws Exception{
		
		System.out.println("/product/json/updateProduct: POST");
		
		productService.updateProduct(product);
		
		return product;
	}
	
	@GetMapping(value="json/autoComplete")
	public List<String> autoComplete() throws Exception {

		
		System.out.println("/product/json/autoComplete: GET");
		
		List<String> list = productService.autoComplete();
				
		
		return list;
	
	}
}


