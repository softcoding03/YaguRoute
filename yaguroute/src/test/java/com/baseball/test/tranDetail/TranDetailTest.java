package com.baseball.test.tranDetail;

import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.baseball.common.domain.Search;
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
	
	//@Test
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
		tranDetail.setRefundStatusCode("0");
	
		tranDetailService.addTranDetail(tranDetail);
		tranDetail = tranDetailService.getTranDetail(2);
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
	
	//@Test
	public void testUpdateRefundStatusCode() throws Exception {

		TranDetail tranDetail = new TranDetail();
		
		tranDetail.setTranDetailNo(5);
		tranDetail.setRefundStatusCode("1");
		
		tranDetailService.updateRefundStatusCode(tranDetail);
		
		System.out.println("updateRefundStatusCode:: "+tranDetail);
		
	}
	
	@Test
	public void testGetDeliveryList() throws Exception {
	
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(5);
		
		int tranNo = 3;
		
		Map<String, Object> map = tranDetailService.getDeliveryList(search, tranNo);
		List<TranDetail> list = (List<TranDetail>)map.get("list");
	
		System.out.println("DeliveryListTest:: "+list);
		
		Integer totalCount = (Integer)map.get("totalCount");
		System.out.println("total찍혔나요 진짜 마지막 희망이다 살려주라22222: "+totalCount);
		
		System.out.println("=======================================");
		
		
		totalCount = (Integer)map.get("totalCount");
		System.out.println(totalCount);
	}
}
