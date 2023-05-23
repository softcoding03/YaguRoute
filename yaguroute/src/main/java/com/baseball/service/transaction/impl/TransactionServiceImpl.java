package com.baseball.service.transaction.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.baseball.common.domain.Search;
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
	public int addTransaction(Transaction transaction) throws Exception {
		transactionDao.addTransaction(transaction);
		return transactionDao.getLastTranNo();
		
	}

	@Override
	public Transaction getTransaction(int tranNo) throws Exception {
		return transactionDao.getTransaction(tranNo);
	}

	@Override
	public void updateTransaction(Transaction transaction) throws Exception {
		transactionDao.updateTransaction(transaction);
		
	}

	@Override
	public int deleteTransaction(int tranNo) throws Exception {
		return transactionDao.deleteTransaction(tranNo);
	}

	@Override
	public Map<String, Object> getTransactionList(Search search, String userId) throws Exception {
		List<Transaction> list = transactionDao.getTransactionList(search, userId);
		int totalCount = transactionDao.getTotalCount(userId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

}
