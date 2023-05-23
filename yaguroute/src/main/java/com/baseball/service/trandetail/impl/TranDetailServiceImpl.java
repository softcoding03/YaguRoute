package com.baseball.service.trandetail.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.baseball.common.domain.Search;
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

	@Override
	public void updateTranStatusCode(TranDetail tranDetail) throws Exception {
		tranDetailDao.updateTranStatusCode(tranDetail);
		
	}

	@Override
	public void updateRefundStatusCode(TranDetail tranDetail) throws Exception {
		tranDetailDao.updateRefundStatusCode(tranDetail);
		
	}

	@Override
	public Map<String, Object> getDeliveryList(Search search, int tranNo) throws Exception {
		List<TranDetail> list = tranDetailDao.getDeliveryList(search, tranNo);
		int totalCount = tranDetailDao.getTotalCount(tranNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	
}