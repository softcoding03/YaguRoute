package com.baseball.test.tranDetail;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.baseball.service.domain.Product;
import com.baseball.service.domain.TranDetail;
import com.baseball.service.domain.Transaction;
import com.baseball.service.trandetail.TranDetailService;
import com.baseball.service.trandetail.impl.TranDetailServiceImpl;

@SpringBootTest
public class TranDetailTest {

	@Autowired
	@Qualifier("tranDetailServiceImpl")
	private TranDetailService tranDetailService;
	
	@Test
	public void testAddTranDetail() throws Exception {
		
		Product product = new Product();
		Transaction transaction = new Transaction();
		TranDetail tranDetail = new TranDetail();
		
		tranDetail.setTranDetailNo(2);
		product.setProdNo(4);
		tranDetail.setTranDetailProd(product);
		
		transaction.setTranNo(4);
		tranDetail.setTranDetailTran(transaction);
		
		tranDetail.setTranStatusCode("0");
		tranDetail.setTranQuantity(2);
		tranDetail.setRefundTranStatusCode("0");
	
		tranDetailService.addTranDetail(tranDetail);
		tranDetail = tranDetailService.getTranDetail(2);
	}
	
}
