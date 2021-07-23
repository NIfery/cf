package com.it.cf.fdList.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.it.cf.common.SearchVO;

@Mapper
public interface FundingListDAO {

	int insertFundingList(FundingListVO FundingListVo);
	List<Map<String, Object>> selectFundingList(int userNo);
	List<Map<String, Object>> searchFundingList(SearchVO searchVo);
	int selectTotalRecord(SearchVO searchVo);
//	List<Map<String, Object>> searchFundingList(FundingListVO fundinglistVo);
//	int selectTotalRecord(FundingListVO fundinglistVo);
}
