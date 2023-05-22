package com.baseball.service.transaction;

import java.util.Map;

import com.baseball.common.domain.Search;
import com.baseball.service.domain.Transaction;

public interface TransactionService {
	
	public void addTransaction(Transaction transaction) throws Exception;
	
	public Transaction getTransaction(int tranNo) throws Exception;

	public void updateTransaction(Transaction transaction) throws Exception;
	
	public int deleteTransaction(int tranNo) throws Exception;
	
	public Map<String, Object>getTransactionList(Search search, String userId) throws Exception;
	
}
