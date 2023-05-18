package com.baseball.service.domain;

public class Basket {
	//Field
	private int basketNo;
	private Product product;
	private int prodQuantity;
	
	public int getBasketNo() {
		return basketNo;
	}
	public void setBasketNo(int basketNo) {
		this.basketNo = basketNo;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getProdQuantity() {
		return prodQuantity;
	}
	public void setProdQuantity(int prodQuantity) {
		this.prodQuantity = prodQuantity;
	}
	
	@Override
	public String toString() {
		return "Basket [basketNo=" + basketNo + ", product=" + product + ", prodQuantity="
				+ prodQuantity + "]";
	}
	
}
