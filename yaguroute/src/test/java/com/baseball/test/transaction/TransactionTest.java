package com.baseball.test.transaction;

import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.baseball.common.domain.Search;
import com.baseball.service.domain.Product;
import com.baseball.service.domain.Transaction;
import com.baseball.service.domain.User;
import com.baseball.service.transaction.TransactionService;

@SpringBootTest
public class TransactionTest {

	@Autowired
	@Qualifier("transactionServiceImpl")
	private TransactionService transactionService;

	@Test
	public void testAddTransaction() throws Exception {
		
		User user = new User();
		Transaction transaction = new Transaction();
		
		user.setUserId("rockseong3");
		transaction.setBuyer(user);
		transaction.setImpNo("imp22");
		transaction.setMerchantNo("3");
		transaction.setReceiverName("김양수");
		transaction.setReceiverPhone("010-9856-2345");
		transaction.setReceiverAddr("서울시 당산동");
		transaction.setTranTotalPrice(58000);
		transaction.setTranPaymentOption("2");
		transaction.setDlvyRequest("경비실에 맡겨주세요");
		transaction.setTranType("P");
		transaction.setTranUsePoint(100);
		transaction.setTranAddPoint(580);

		System.out.println("마지막 insert TranNo?? " +transactionService.addTransaction(transaction)); //마지막에 insert한 transaction의 tranNo 가져오기
	}

	//@Test
	public void testGetTransaction() throws Exception {
	
		Transaction transaction = new Transaction();
		
		transaction = transactionService.getTransaction(3);

		System.out.println("TestgetTransaction:: "+transaction);
		System.out.println("getTran:: ");
	}
	
	//@Test
	public void testUpdateTransaction() throws Exception {
		Transaction transaction = new Transaction();
		transaction = transactionService.getTransaction(3);
		Assert.assertNotNull(transaction);
		
		
		transaction.setReceiverName("김동욱");
		transaction.setReceiverPhone("011-2222-3333");
		transaction.setReceiverAddr("경기도 김포시 종로1가 202호");
		transaction.setTranTotalPrice(95000);
		transaction.setTranPaymentOption("1");
		transaction.setDlvyRequest("배송 완료 후 문자주세요");
		transaction.setTranUsePoint(1000);
		transaction.setTranAddPoint(950);
		
		transactionService.updateTransaction(transaction);
		transaction = transactionService.getTransaction(3);
		
		System.out.println("testUpdateTransaction:: "+transaction);
		
	}
	
	//@Test
	public void testDeleteTransaction() throws Exception {
		
		transactionService.deleteTransaction(1);
		System.out.println("testDeleteTransaction:: ");
	}

	
	//@Test
	public void testGetTransactionList() throws Exception {
	
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(5);
		
		String userId = "john123";
		String tranType = "P";
		Map<String, Object> map = transactionService.getTransactionList(search, userId, tranType);
		List<Transaction> list = (List<Transaction>)map.get("list");
		Assert.assertEquals(5, list.size());
		 
	 	for(Transaction tran:list) {
	 		System.out.println(tran);
	 	}
		
		Integer totalCount = (Integer)map.get("totalCount");
		System.out.println("Transaction TotalCount:: "+totalCount);
				
		totalCount = (Integer)map.get("totalCount");
	}
	
		
}

