package com.baseball.service.trandetail;

import org.apache.ibatis.annotations.Mapper;

import com.baseball.service.domain.TranDetail;

@Mapper
public interface TranDetailDao {
	
	public void addTranDetail(TranDetail tranDetail) throws Exception;

	public TranDetail getTranDetail(int tranDetailNo) throws Exception;
}
