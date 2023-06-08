package com.baseball.service.domain;

import java.sql.Date;


public class Product {

	//Field
	private int prodNo;
	private String prodName;
	private int prodPrice;
	private Date prodRegDate;
	private int prodStock;
	private int prodCategory;
	private String prodTranCode;
	private String prodRefundCode;
	private String prodTeamCode;
	private String prodImageFirst;
	private String prodImageSecond;
	private String prodImageThird;
	
	
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


	public int getProdCategory() {
		return prodCategory;
	}

	public void setProdCategory(int prodCategory) {
		this.prodCategory = prodCategory;
	}


	public String getProdTranCode() {
		return prodTranCode;
	}


	public void setProdTranCode(String prodTranCode) {
		this.prodTranCode = prodTranCode;
	}


	public String getProdRefundCode() {
		return prodRefundCode;
	}


	public void setProdRefundCode(String prodRefundCode) {
		this.prodRefundCode = prodRefundCode;
	}
	
	
	public String getProdTeamCode() {
		return prodTeamCode;
	}

	public void setProdTeamCode(String prodTeamCode) {
		this.prodTeamCode = prodTeamCode;
	}

	public String getProdImageFirst() {
		return prodImageFirst;
	}

	public void setProdImageFirst(String prodImageFirst) {
		this.prodImageFirst = prodImageFirst;
	}

	public String getProdImageSecond() {
		return prodImageSecond;
	}

	public void setProdImageSecond(String prodImageSecond) {
		this.prodImageSecond = prodImageSecond;
	}

	public String getProdImageThird() {
		return prodImageThird;
	}

	public void setProdImageThird(String prodImageThird) {
		this.prodImageThird = prodImageThird;
	}

	@Override
	public String toString() {
		return "Product [prodNo=" + prodNo + ", prodName=" + prodName + ", prodPrice=" + prodPrice + ", prodRegDate="
				+ prodRegDate + ", prodStock=" + prodStock + ", prodCategory=" + prodCategory + ", prodTranCode="
				+ prodTranCode + ", prodRefundCode=" + prodRefundCode + ", prodTeamCode=" + prodTeamCode
				+ ", prodImageFirst=" + prodImageFirst + ", prodImageSecond=" + prodImageSecond + ", prodImageThird="
				+ prodImageThird + "]";
	}

	
}
