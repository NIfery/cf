package com.it.cf.fdList.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FundingListDAO {

	int insertFundingList(FundingListVO FundingListVo);
	List<Map<String, Object>> selectFundingList(int userNo);
}
