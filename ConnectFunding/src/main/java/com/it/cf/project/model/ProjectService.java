package com.it.cf.project.model;

import java.util.List;
import java.util.Map;

public interface ProjectService {
	List<ProjectVO> selectAll(ProjectVO pageVo);
	List<ProjectVO> selectBySecondCategoryNo(ProjectVO pageVo);
	int selectTotalFundingAmountByFundingNo(int fundingNo);
	int selectTotalRecord();
	int selectTotalRecordBySecondCategoryNo(int firstCategoryNo, int secondCategoryNo);
	List<FirstCategoryVO> selectFirstCategory();
	List<SecondCategoryVO> selectSecondCategory(String firstCategory);
	int createTotalFunding();
	int insertProject(ProjectVO vo);
	Map<String, Object> selectByNo(int projectNo);
	int selectFundingUserCount(int projectNo);
}
