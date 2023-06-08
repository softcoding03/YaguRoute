package com.baseball.service.trandetail;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.baseball.common.domain.Search;
import com.baseball.service.domain.TranDetail;
import com.baseball.service.domain.Transaction;

@Mapper
public interface TranDetailDao {
	
	public void addTranDetail(TranDetail tranDetail) throws Exception;
	
	public void updateProdStock(TranDetail tranDetail) throws Exception;
	
	public TranDetail getTranDetail(int tranDetailNo) throws Exception;
	
	public void updateTranStatusCode(TranDetail tranDetail) throws Exception;			  //TranCode
	
	public void updateRefundStatusCode(TranDetail tranDetail) throws Exception;			  //RefundCode
	
	public List<TranDetail> getTranDetailList(Search search, String userId, int tranDetailNo) throws Exception; 	//구매현황조회(사용자)
	
	//public List<TranDetail> getDlvyTranList(Map<String, Object> map) throws Exception;		//배송현황조회(관리자)
		
	public int getTotalCount(int tranDetailNo) throws Exception;
	
}
