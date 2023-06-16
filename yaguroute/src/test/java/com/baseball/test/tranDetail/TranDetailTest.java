package com.baseball.test.tranDetail;

import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.baseball.common.domain.Search;
import com.baseball.service.domain.Product;
import com.baseball.service.domain.TranDetail;
import com.baseball.service.domain.Transaction;
import com.baseball.service.domain.User;
import com.baseball.service.trandetail.TranDetailDao;
import com.baseball.service.trandetail.TranDetailService;
import com.baseball.service.trandetail.impl.TranDetailServiceImpl;

@SpringBootTest
public class TranDetailTest {

	@Autowired
	@Qualifier("tranDetailServiceImpl")
	private TranDetailService tranDetailService;
	
	//@Test
	public void testAddTranDetail() throws Exception {
		
		
		//User user = new User();
		Product product = new Product();
		Transaction transaction = new Transaction();
		TranDetail tranDetail = new TranDetail();
		
		tranDetail.setTranDetailNo(16);
		product.setProdNo(1);
		tranDetail.setTranDetailProd(product);
		
		transaction.setTranNo(27);
		tranDetail.setTranDetailTran(transaction);
		
		tranDetail.setTranStatusCode("0");
		tranDetail.setTranQuantity(15);
		tranDetail.setRefundStatusCode("0");
	
		System.out.println("TranDetail ????"+tranDetail);
		
		tranDetailService.addTranDetail(tranDetail);
		
		tranDetail = tranDetailService.getTranDetail(16);
		System.out.println("TranDetail ????"+tranDetail);
	}
	
	//@Test
	public void testGetTranDetail() throws Exception {
		
		TranDetail tranDetail = new TranDetail();
		tranDetail = tranDetailService.getTranDetail(7);
		
		System.out.println("getTranDetailTest:: "+tranDetail);
		
	}
	
	//@Test
	public void testUpdateTranStatusCode() throws Exception {
		
		
		TranDetail tranDetail = new TranDetail();
//		Product product = new Product();
//		Transaction transaction = new Transaction();
		
		tranDetail.setTranDetailNo(3);
		tranDetail.setTranStatusCode("1");
		
		tranDetailService.updateTranStatusCode(tranDetail);
		
		System.out.println("updateTranStatusCode:: "+tranDetail);
	}
	
	@Test
	public void testUpdateRefundStatusCode() throws Exception {

		TranDetail tranDetail = new TranDetail();
		
		tranDetail.setTranDetailNo(30);
		tranDetail.setRefundStatusCode("2");
		System.out.println("updateRefundStatusCode:: "+tranDetail);
		tranDetailService.updateRefundStatusCode(tranDetail);
		
		
		
	}

}
