package com.baseball.service.trandetail;

import java.util.List;
import java.util.Map;

import com.baseball.common.domain.Search;
import com.baseball.service.domain.TranDetail;
import com.baseball.service.domain.Transaction;

public interface TranDetailService {

	public void addTranDetail(TranDetail tranDetail) throws Exception;
	
	public TranDetail getTranDetail(int tranDetailNo) throws Exception;
	
	public void updateTranStatusCode(TranDetail tranDetail) throws Exception;
	
	public void updateRefundStatusCode(TranDetail tranDetail) throws Exception;
	
	public Map<String, Object> getTranDetailList(Search search, String userId, int tranDetailNo) throws Exception;

	//public Map<String, Object> getDlvyTranList(Map<String, Object> map) throws Exception;
	

}
