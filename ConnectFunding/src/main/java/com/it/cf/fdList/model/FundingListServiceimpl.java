package com.it.cf.fdList.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FundingListServiceimpl implements FundingListService{

	private final FundingListDAO fundingListDao;

	@Override
	public int insertFundingList(FundingListVO FundingListVo) {
		return fundingListDao.insertFundingList(FundingListVo);
	}

	@Override
	public List<Map<String, Object>> selectFundingList(int userNo) {
		return fundingListDao.selectFundingList(userNo);
	}
	
	
}
