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
	
	public int selectTotalFundingAmountByFundingNo(int fundingNo) {
		return projectDao.selectTotalFundingAmountByFundingNo(fundingNo);
	}
}
