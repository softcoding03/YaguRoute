package com.baseball.service.trandetail.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.baseball.service.domain.TranDetail;
import com.baseball.service.trandetail.TranDetailDao;
import com.baseball.service.trandetail.TranDetailService;

@Service("tranDetailServiceImpl")
public class TranDetailServiceImpl implements TranDetailService {
	
	@Autowired
	@Qualifier("tranDetailDao")
	private TranDetailDao tranDetailDao;
	public void setTranDetailDao(TranDetailDao tranDetailDao) {
		this.tranDetailDao = tranDetailDao;
	}
	
	public TranDetailServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addTranDetail(TranDetail tranDetail) throws Exception {
		tranDetailDao.addTranDetail(tranDetail);
		
	}

	@Override
	public TranDetail getTranDetail(int tranDetail) throws Exception {		
		return tranDetailDao.getTranDetail(tranDetail);
	}
}