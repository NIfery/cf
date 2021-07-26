package com.it.cf.project.model;

import java.util.List;
import java.util.Map;

import com.it.cf.fdList.model.FundingListVO;

public interface ProjectService {
	List<ProjectVO> selectAll(ProjectVO pageVo);
	List<ProjectVO> selectBySecondCategoryNo(ProjectVO pageVo);
	int selectTotalFundingAmountByFundingNo(int fundingNo);
	int selectTotalRecord();
	int selectTotalRecordBySecondCategoryNo(int firstCategoryNo, int secondCategoryNo);
	List<FirstCategoryVO> selectFirstCategory();
	List<SecondCategoryVO> selectSecondCategory(String firstCategory);
	int insertProject(ProjectVO vo);
	Map<String, Object> selectByNo(int projectNo);
	int selectFundingUserCount(int projectNo);
	String selectFirstCategoryNo(int secondCategoryNo);
	int updateProject(ProjectVO vo);
	String selectDBPwd(int userNo);
	int deleteFundingList(int projectNo);
	int deleteProject(int projectNo);
	int insertFunding(FundingListVO vo);
}
