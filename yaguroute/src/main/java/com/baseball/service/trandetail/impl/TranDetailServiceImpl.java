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
		System.out.println("ㅋㅋㅋ 진짜 들어와야됨"+tranDetail);
		tranDetailDao.updateRefundStatusCode(tranDetail);
		
	}


	@Override
	public Map<String, Object> getTranDetailList(Search search, String userId) throws Exception {
		List<TranDetail> list = tranDetailDao.getTranDetailList(search, userId);
		int totalCount = tranDetailDao.getTotalCount(search, userId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tranList", list);
		map.put("totalCount",new Integer(totalCount));
		return map;
	}


	@Override
	public Map<String, Object> getDlvyTranList(Search search) throws Exception {
		List<TranDetail> list = tranDetailDao.getDlvyTranList(search);
		int totalCount = tranDetailDao.getTotalCount(search, null);   //null == x
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dlvyList", list); 
		map.put("totalCount",new Integer(totalCount));
		return map;
	}


	@Override
	public List<TranDetail> getBestTranList() throws Exception {
		
		return tranDetailDao.getBestTranList();
	}


}