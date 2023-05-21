package com.baseball.service.trandetail;

import com.baseball.service.domain.TranDetail;

public interface TranDetailService {

	public void addTranDetail(TranDetail tranDetail) throws Exception;
	
	public TranDetail getTranDetail(int tranDetailNo) throws Exception;

}
