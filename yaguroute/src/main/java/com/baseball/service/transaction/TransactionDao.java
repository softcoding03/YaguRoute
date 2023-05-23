package com.baseball.service.transaction;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.baseball.common.domain.Search;
import com.baseball.service.domain.Transaction;

@Mapper
public interface TransactionDao {
	
	//Add
	public void addTransaction(Transaction transaction) throws Exception;
	
	public int getLastTranNo() throws Exception;
	
	public Transaction getTransaction(int tranNo) throws Exception;

	public void updateTransaction(Transaction transaction) throws Exception;
	
	public int deleteTransaction(int tranNo) throws Exception;

	public List<Transaction>getTransactionList(Search search, String userId) throws Exception;   //구매현황조회 (user)
	
	public int getTotalCount(String userId) throws Exception;
}
