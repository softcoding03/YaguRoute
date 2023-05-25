package com.baseball.service.importAPI;


public interface ImportAPIRestService {
	
	public String importRefund(String merchantNo, int amount) throws Exception;
	public String sendSMS(String contents, String userPhone) throws Exception;
}