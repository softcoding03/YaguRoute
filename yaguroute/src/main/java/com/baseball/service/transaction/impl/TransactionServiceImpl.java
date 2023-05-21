package com.baseball.service.transaction.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.baseball.service.domain.Transaction;
import com.baseball.service.transaction.TransactionDao;
import com.baseball.service.transaction.TransactionService;

@Service("transactionServiceImpl")
public class TransactionServiceImpl implements TransactionService {
	
	@Autowired
	@Qualifier("transactionDao")
	private TransactionDao transactionDao;
	public void setTransactionDao(TransactionDao transactionDao) {
		this.transactionDao = transactionDao;
	}
	
	public TransactionServiceImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public void addTransaction(Transaction transaction) throws Exception {
		transactionDao.addTransaction(transaction);
		
	}

	@Override
	public Transaction getTransaction(int transaction) throws Exception {
		return transactionDao.getTransaction(transaction);
	}

	@Override
	public void updateTransaction(Transaction transaction) throws Exception {
		transactionDao.updateTransaction(transaction);
		
	}

	@Override
	public int deleteTransaction(int tranNo) throws Exception {
		return transactionDao.deleteTransaction(tranNo);
	}
	

}
