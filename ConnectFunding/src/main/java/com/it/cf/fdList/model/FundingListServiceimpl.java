package com.it.cf.fdList.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.it.cf.common.SearchVO;

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

	@Override
	public List<Map<String, Object>> searchFundingList(FDListViewVO fdListViewVo) {
		return fundingListDao.searchFundingList(fdListViewVo);
	}

	@Override
	public int selectTotalRecord(FDListViewVO fdListViewVo) {
		return fundingListDao.selectTotalRecord(fdListViewVo);
	}

	@Override
	public int selectFollowCheck(String userName) {
		return fundingListDao.selectFollowCheck(userName);
	}

//	@Override
//	public List<Map<String, Object>> searchFundingList(SearchVO searchVo) {
//		return fundingListDao.searchFundingList(searchVo);
//	}
//
//	@Override
//	public int selectTotalRecord(SearchVO searchVo) {
//		return fundingListDao.selectTotalRecord(searchVo);
//	}
	
}
