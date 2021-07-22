package com.it.cf.fdList.model;

import java.util.List;
import java.util.Map;

public interface FundingListService {
	
	int insertFundingList(FundingListVO FundingListVo);
	List<Map<String, Object>> selectFundingList(int userNo);
}
