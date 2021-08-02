package com.it.cf.fdList.model;

import java.util.List;
import java.util.Map;

import com.it.cf.common.SearchVO;

public interface FundingListService {
	
	int insertFundingList(FundingListVO FundingListVo);
	List<Map<String, Object>> selectFundingList(int userNo);
//	List<Map<String, Object>> searchFundingList(SearchVO searchVo);
//	int selectTotalRecord(SearchVO searchVo);
	List<Map<String, Object>> searchFundingList(FDListViewVO fdListViewVo);
	int selectTotalRecord(FDListViewVO fdListViewVo);
	int selectFollowCheck(String userName);

}
