package com.baseball.service.domain;

public class TranDetail {

	private int tranDetailNo;
	private Product tranDetailProd;
	private Transaction tranDetailTran;
	private String tranStatusCode;
	private String refundTranStatusCode;
	private int tranQuantity;
	
	
	public TranDetail() {
	}


	public int getTranDetailNo() {
		return tranDetailNo;
	}


	public void setTranDetailNo(int tranDetailNo) {
		this.tranDetailNo = tranDetailNo;
	}


	public Product getTranDetailProd() {
		return tranDetailProd;
	}


	public void setTranDetailProd(Product tranDetailProd) {
		this.tranDetailProd = tranDetailProd;
	}


	public Transaction getTranDetailTran() {
		return tranDetailTran;
	}


	public void setTranDetailTran(Transaction tranDetailTran) {
		this.tranDetailTran = tranDetailTran;
	}


	public String getTranStatusCode() {
		return tranStatusCode;
	}


	public void setTranStatusCode(String tranStatusCode) {
		this.tranStatusCode = tranStatusCode;
	}


	public String getRefundTranStatusCode() {
		return refundTranStatusCode;
	}


	public void setRefundTranStatusCode(String refundTranStatusCode) {
		this.refundTranStatusCode = refundTranStatusCode;
	}


	public int getTranQuantity() {
		return tranQuantity;
	}


	public void setTranQuantity(int tranQuantity) {
		this.tranQuantity = tranQuantity;
	}
	
	
	
}
