package com.baseball.service.transaction;

import org.apache.ibatis.annotations.Mapper;

import com.baseball.service.domain.Transaction;

@Mapper
public interface TransactionDao {
	
	//Add
	public void addTransaction(Transaction transaction) throws Exception;
	
	public Transaction getTransaction(int tranNo) throws Exception;

	public void updateTransaction(Transaction transaction) throws Exception;
	
	public int deleteTransaction(int tranNo) throws Exception;
	
	
	
}
