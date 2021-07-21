package com.it.cf.project.model;

import java.util.List;

public interface ProjectService {
	List<ProjectVO> selectAll(ProjectVO pageVo);
	List<ProjectVO> selectBySecondCategoryNo(ProjectVO pageVo);
	int selectTotalFundingAmountByFundingNo(int fundingNo);
	int selectTotalRecord();
	int selectTotalRecordBySecondCategoryNo(int secondCategoryNo);
	List<FirstCategoryVO> selectFirstCategory();
	List<SecondCategoryVO> selectSecondCategory(String firstCategory);
	int createTotalFunding();
	int insertProject(ProjectVO vo);
}
