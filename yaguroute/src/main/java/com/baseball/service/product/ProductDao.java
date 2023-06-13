package com.baseball.service.product;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

import com.baseball.common.domain.Search;
import com.baseball.service.domain.Product;



@Mapper
public interface ProductDao {


	public void addProduct(Product product) throws Exception; //상품등록

	public Product getProduct(int prodNo) throws Exception; //상품상세조회

	public void updateProduct(Product product) throws Exception; //상품수정
	
	public int deleteProduct(int prodNo) throws Exception; //상품삭제
	
	public List<Product> getProductList(Map<String, Object> map) throws Exception; // 상품관리 (admin)
	public List<Product> getSalesProdList(Map<String, Object>map) throws Exception; // 판매상품목록 (admin, user)
	
	public int getTotalCount(Map<String, Object> map) throws Exception;
	

//	public List autoComplete() throws Exception;
	
	
}
