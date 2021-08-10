package com.it.cf.project.model;

import java.util.List;
import java.util.Map;

import com.it.cf.fdList.model.FundingListVO;

public interface ProjectService {
	List<ProjectVO> selectAllCheck();
	List<ProjectVO> selectAll(ProjectVO pageVo);
	List<ProjectVO> selectAllConfirm(ProjectVO pageVo);
	List<ProjectVO> selectAllAdmin(ProjectVO pageVo);
	int confirmProject(int projectNo);
	List<ProjectVO> selectBySecondCategoryNo(ProjectVO pageVo);
	int selectTotalFundingAmountByFundingNo(int fundingNo);
	int selectTotalRecord();
	int selectTotalRecordByUserNo(int userNo);
	int selectTotalRecordConfirm();
	int selectTotalRecordBySecondCategoryNo(int firstCategoryNo, int secondCategoryNo, int ingType);
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
	int deleteFunding(String receiptId);
	List<FundingListVO> selectFundingListByProjectNo(int projectNo);
	Map<String, Object> checkLike(int projectNo);
	Map<String, Object> selectPlanProject(int projectNo);
	int planCount (int projectNo);
	List<Map<String, Object>> selectplan();
	List<Map<String, Object>> randomList();
}
