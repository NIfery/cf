package com.it.cf.project.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProjectServiceImpl implements ProjectService{
	private final ProjectDAO projectDao;
	
	public List<ProjectVO> selectAll() {
		return projectDao.selectAll();
	}
	
	public List<ProjectVO> selectBySecondCategoryNo(int secondCategoryNo) {
		return projectDao.selectBySecondCategoryNo(secondCategoryNo);
	}
	
	public int selectTotalFundingAmountByFundingNo(int fundingNo) {
		return projectDao.selectTotalFundingAmountByFundingNo(fundingNo);
	}
}
