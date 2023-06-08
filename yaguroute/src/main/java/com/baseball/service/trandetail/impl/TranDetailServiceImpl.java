package com.baseball.service.trandetail.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.baseball.common.domain.Search;
import com.baseball.service.domain.TranDetail;
import com.baseball.service.domain.Transaction;
import com.baseball.service.domain.User;
import com.baseball.service.trandetail.TranDetailDao;
import com.baseball.service.trandetail.TranDetailService;
import com.baseball.service.user.UserDao;
import com.baseball.service.user.UserService;

@Service
public class TranDetailServiceImpl implements TranDetailService {
	
	public TranDetailServiceImpl() {
		System.out.println(this.getClass());
	
	}
	
	@Autowired
	@Qualifier("tranDetailDao")
	private TranDetailDao tranDetailDao;

		
	@Autowired
	@Qualifier("userDao")
	private UserDao userDao;

	@Override
	public TranDetail getTranDetail(int tranDetail) throws Exception {		
		return tranDetailDao.getTranDetail(tranDetail);
	}


	@Override
	public void addTranDetail(TranDetail tranDetail) throws Exception {		
		tranDetailDao.addTranDetail(tranDetail);
		tranDetailDao.updateProdStock(tranDetail);
		
	}


	@Override
	public void updateTranStatusCode(TranDetail tranDetail) throws Exception {
		tranDetailDao.updateTranStatusCode(tranDetail);
		
	}

	@Override
	public void updateRefundStatusCode(TranDetail tranDetail) throws Exception {
		tranDetailDao.updateRefundStatusCode(tranDetail);
		
	}


	@Override
	public Map<String, Object> getTranDetailList(Search search, String userId, int tranDetailNo) throws Exception {
		
		List<TranDetail> list = tranDetailDao.getTranDetailList(search, userId, tranDetailNo);
		int totalCount = tranDetailDao.getTotalCount(tranDetailNo);
		
		Map<String, Object> tranMap = new HashMap<String, Object>();
		tranMap.put("tranList", list);
		tranMap.put("totalCount", new Integer(totalCount));
		
		return tranMap;

		
	}









	
}