﻿package com.baseball.service.domain;

import java.sql.Date;

public class Transaction {
	
	//Field
	private int tranNo;
	private User buyer;
	private String impNo;
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

	
	
	public Transaction() {
		
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


	@Override
	public String toString() {
		return "Transaction [tranNo=" + tranNo + ", buyer=" + buyer + ", impNo=" + impNo + ", receiverName="
				+ receiverName + ", receiverPhone=" + receiverPhone + ", receiverAddr=" + receiverAddr
				+ ", tranTotalPrice=" + tranTotalPrice + ", tranPaymentOption=" + tranPaymentOption + ", dlvyRequest="
				+ dlvyRequest + ", tranDate=" + tranDate + ", tranType=" + tranType + ", tranAddPoint=" + tranAddPoint
				+ ", tranUsePoint=" + tranUsePoint + "]";
	}		
	
		
}