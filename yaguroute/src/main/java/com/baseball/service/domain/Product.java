package com.baseball.service.domain;

import java.sql.Date;

public class Product {

	//Field
	private int prodNo;
	private String prodName;
	private int prodPrice;
	private Date prodRegDate;
	private int prodStock;
	private String prodCategory;
	private String prodImage;
	private String proTranCode;
	private String proRefundCode;

	
	//Constructor
	public Product() {
		
	}

	//Method
	public int getProdNo() {
		return prodNo;
	}


	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}


	public String getProdName() {
		return prodName;
	}


	public void setProdName(String prodName) {
		this.prodName = prodName;
	}


	public int getProdPrice() {
		return prodPrice;
	}


	public void setProdPrice(int prodPrice) {
		this.prodPrice = prodPrice;
	}


	public Date getProdRegDate() {
		return prodRegDate;
	}


	public void setProdRegDate(Date prodRegDate) {
		this.prodRegDate = prodRegDate;
	}


	public int getProdStock() {
		return prodStock;
	}


	public void setProdStock(int prodStock) {
		this.prodStock = prodStock;
	}


	public String getProdCategory() {
		return prodCategory;
	}


	public void setProdCategory(String prodCategory) {
		this.prodCategory = prodCategory;
	}


	public String getProdImage() {
		return prodImage;
	}


	public void setProdImage(String prodImage) {
		this.prodImage = prodImage;
	}


	public String getProTranCode() {
		return proTranCode;
	}


	public void setProTranCode(String proTranCode) {
		this.proTranCode = proTranCode;
	}


	public String getProRefundCode() {
		return proRefundCode;
	}


	public void setProRefundCode(String proRefundCode) {
		this.proRefundCode = proRefundCode;
	}

	
	
}
