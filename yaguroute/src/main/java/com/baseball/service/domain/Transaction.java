package com.baseball.service.domain;

import java.sql.Date;
import java.time.*;

public class Transaction {
	
	//Field
	private int tranNo;
	private User buyer;
	private String impNo;
	private String merchantNo;
	private String receiverName;
	private String receiverPhone;
	private String receiverAddr;
	private int tranTotalPrice;
	private String tranPaymentOption;
	private String dlvyRequest;
	private Date tranDate;
	private String tranType;
	private int tranAddPoint;
	private int tranUsePoint;
	private int refundStatus;
	private LocalDateTime refundableDate;


	public Transaction() {
		
	}

	public LocalDateTime getRefundableDate() {
		return refundableDate;
	}
	public void setRefundableDate(LocalDateTime refundableDate) {
		this.refundableDate = refundableDate;
	}
	
	public int getTranNo() {
		return tranNo;
	}


	public void setTranNo(int tranNo) {
		this.tranNo = tranNo;
	}


	public User getBuyer() {
		return buyer;
	}


	public void setBuyer(User buyer) {
		this.buyer = buyer;
	}


	public String getImpNo() {
		return impNo;
	}


	public void setImpNo(String impNo) {
		this.impNo = impNo;
	}


	public String getReceiverName() {
		return receiverName;
	}


	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}


	public String getReceiverPhone() {
		return receiverPhone;
	}


	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}


	public int getTranTotalPrice() {
		return tranTotalPrice;
	}


	public void setTranTotalPrice(int tranTotalPrice) {
		this.tranTotalPrice = tranTotalPrice;
	}


	public String getTranPaymentOption() {
		return tranPaymentOption;
	}


	public void setTranPaymentOption(String tranPaymentOption) {
		this.tranPaymentOption = tranPaymentOption;
	}


	public String getDlvyRequest() {
		return dlvyRequest;
	}


	public void setDlvyRequest(String dlvyRequest) {
		this.dlvyRequest = dlvyRequest;
	}


	public Date getTranDate() {
		return tranDate;
	}


	public void setTranDate(Date tranDate) {
		this.tranDate = tranDate;
	}


	public String getTranType() {
		return tranType;
	}


	public void setTranType(String tranType) {
		this.tranType = tranType;
	}


	public int getTranAddPoint() {
		return tranAddPoint;
	}


	public void setTranAddPoint(int tranAddPoint) {
		this.tranAddPoint = tranAddPoint;
	}


	public int getTranUsePoint() {
		return tranUsePoint;
	}


	public void setTranUsePoint(int tranUsePoint) {
		this.tranUsePoint = tranUsePoint;
	}


	public String getReceiverAddr() {
		return receiverAddr;
	}


	public void setReceiverAddr(String receiverAddr) {
		this.receiverAddr = receiverAddr;
	}


	public String getMerchantNo() {
		return merchantNo;
	}


	public void setMerchantNo(String merchantNo) {
		this.merchantNo = merchantNo;
	}
	
	public int getRefundStatus() {
		return refundStatus;
	}
	public void setRefundStatus(int refundStatus) {
		this.refundStatus = refundStatus;
	}
	
	@Override
	public String toString() {
		return "Transaction [tranNo=" + tranNo + ", buyer=" + buyer + ", impNo=" + impNo + ", merchantNo=" + merchantNo
				+ ", receiverName=" + receiverName + ", receiverPhone=" + receiverPhone + ", receiverAddr="
				+ receiverAddr + ", tranTotalPrice=" + tranTotalPrice + ", tranPaymentOption=" + tranPaymentOption
				+ ", dlvyRequest=" + dlvyRequest + ", tranDate=" + tranDate + ", tranType=" + tranType
				+ ", tranAddPoint=" + tranAddPoint + ", tranUsePoint=" + tranUsePoint + ", refundStatus=" + refundStatus
				+ ", refundableDate=" + refundableDate + "]";
	}
		
}