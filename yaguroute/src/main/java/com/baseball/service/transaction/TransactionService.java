package com.baseball.service.transaction;

import com.baseball.service.domain.Transaction;

public interface TransactionService {
	
	public void addTransaction(Transaction transaction) throws Exception;
	
	public Transaction getTransaction(int tranNo) throws Exception;

	public void updateTransaction(Transaction transaction) throws Exception;
	
	public int deleteTransaction(int tranNo) throws Exception;
}
