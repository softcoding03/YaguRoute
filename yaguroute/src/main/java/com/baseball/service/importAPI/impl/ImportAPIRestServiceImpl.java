package com.baseball.service.importAPI.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.baseball.service.importAPI.ImportAPIRestDao;
import com.baseball.service.importAPI.ImportAPIRestService;

@Service("importAPIRestServiceImpl")
public class ImportAPIRestServiceImpl implements ImportAPIRestService{
	
	//field
		@Autowired
		@Qualifier("importAPIRestDaoImpl")
		private ImportAPIRestDao importAPIRestDao;
		
		//Constructor
		public ImportAPIRestServiceImpl() {
			System.out.println("ImportAPIRestServiceImpl strart...");
		}
		
		@Override
		public String importRefund(String merchantNo, int amount) throws Exception {
			return importAPIRestDao.importRefund(merchantNo, amount);
		}
		
		public String sendSMS(String contents, String userPhone) throws Exception{
			return importAPIRestDao.sendSMS(contents, userPhone);
		}
}