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
	
	public List<TranDetail> getTranDetailList(Search search, String userId) throws Exception; 	//구매내역조회(사용자)
	
	public List<TranDetail> getDlvyTranList(Search search, int tranNo) throws Exception;		//배송현황조회(관리자)
		
	public int getTotalCount(Search search, String userId) throws Exception; // userId가 아니면(null이면) tranNo
	
}
