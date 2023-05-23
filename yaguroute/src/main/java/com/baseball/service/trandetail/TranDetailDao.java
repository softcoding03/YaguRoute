package com.baseball.service.trandetail;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.baseball.common.domain.Search;
import com.baseball.service.domain.TranDetail;
import com.baseball.service.domain.Transaction;

@Mapper
public interface TranDetailDao {
	
	public void addTranDetail(TranDetail tranDetail) throws Exception;

	public TranDetail getTranDetail(int tranDetailNo) throws Exception;
	
	public void updateTranStatusCode(TranDetail tranDetail) throws Exception;			  //TranCode

	public void updateTranCodeByProd(TranDetail tranDetail) throws Exception;			  //TranCode By Prod
	
	public void updateRefundStatusCode(TranDetail tranDetail) throws Exception;			  //RefundCode

	public void updateRefundCodeByProd(TranDetail tranDetail) throws Exception;			  //RefundCode By Prod
	
	public List<TranDetail>getDeliveryList(Search search, int tranNo) throws Exception; 	 //배송현황조회 (admin)
	
	public int getTotalCount(int tranNo) throws Exception;
	
}
