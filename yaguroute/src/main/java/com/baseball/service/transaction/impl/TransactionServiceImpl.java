package com.baseball.service.transaction.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.baseball.common.domain.Search;
import com.baseball.service.basket.BasketDao;
import com.baseball.service.domain.Basket;
import com.baseball.service.domain.Product;
import com.baseball.service.domain.TranDetail;
import com.baseball.service.domain.Transaction;
import com.baseball.service.domain.User;
import com.baseball.service.product.ProductDao;
import com.baseball.service.trandetail.TranDetailDao;
import com.baseball.service.transaction.TransactionDao;
import com.baseball.service.transaction.TransactionService;
import com.baseball.service.user.UserDao;

@Service("transactionServiceImpl")
public class TransactionServiceImpl implements TransactionService {
	
	@Autowired
	@Qualifier("userDao")
	private UserDao userDao;

	@Autowired
	@Qualifier("productDao")
	private ProductDao productDao;

	@Autowired
	@Qualifier("basketDao")
	private BasketDao basketDao;	
	
	@Autowired
	@Qualifier("tranDetailDao")
	private TranDetailDao tranDetailDao;	
	
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
		
		// 포인트 업데이트
		User user = userDao.getUser("algudgod");
		
		int tranUsePoint = transaction.getTranUsePoint();
		int tranAddPoint = (transaction.getTranTotalPrice()/1000) *10 ; 
		
		user.setUserPoint(user.getUserPoint()-tranUsePoint+tranAddPoint);
		transaction.setTranAddPoint(tranAddPoint);
		
		transactionDao.addTransaction(transaction);			
		userDao.updatePoint(user);
		
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
	public Map<String, Object> getTransactionList(Search search, String userId, String tranType) throws Exception {
		List<Transaction> list = transactionDao.getTransactionList(search, userId, tranType);
		int totalCount = transactionDao.getTotalCount(userId, tranType);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public List<Transaction> getSalesList(String gameCode) throws Exception {
		return transactionDao.getSalesList(gameCode);
	}

}
