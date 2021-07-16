package com.it.cf.project.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProjectServiceImpl implements ProjectService{
	private final ProjectDAO projectDao;
	
	public List<ProjectVO> selectAll(ProjectVO pageVo) {
		return projectDao.selectAll(pageVo);
	}
	
	public List<ProjectVO> selectBySecondCategoryNo(ProjectVO pageVo) {
		return projectDao.selectBySecondCategoryNo(pageVo);
	}
	
	public int selectTotalFundingAmountByFundingNo(int fundingNo) {
		return projectDao.selectTotalFundingAmountByFundingNo(fundingNo);
	}
	
	public int selectTotalRecord() {
		return projectDao.selectTotalRecord();
	}
	
	public int selectTotalRecordBySecondCategoryNo(int secondCategoryNo) {
		return projectDao.selectTotalRecordBySecondCategoryNo(secondCategoryNo);
	}
}
