package com.it.cf.project.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.it.cf.fdList.model.FundingListVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProjectServiceImpl implements ProjectService{
	private final ProjectDAO projectDao;
	
	public List<ProjectVO> selectAllCheck() {
		return projectDao.selectAllCheck();
	}
	
	public List<ProjectVO> selectAll(ProjectVO pageVo) {
		return projectDao.selectAll(pageVo);
	}
	
	public List<ProjectVO> selectAllConfirm(ProjectVO pageVo) {
		return projectDao.selectAllConfirm(pageVo);
	}
	
	public List<ProjectVO> selectAllAdmin(ProjectVO pageVo) {
		return projectDao.selectAllAdmin(pageVo);
	}
	
	public int confirmProject(int projectNo) {
		return projectDao.confirmProject(projectNo);
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
	
	public int selectTotalRecordByUserNo(int userNo) {
		return projectDao.selectTotalRecordByUserNo(userNo);
	}
	
	public int selectTotalRecordConfirm() {
		return projectDao.selectTotalRecordConfirm();
	}
	
	public int selectTotalRecordBySecondCategoryNo(int firstCategoryNo, int secondCategoryNo, int ingType) {
		return projectDao.selectTotalRecordBySecondCategoryNo(firstCategoryNo, secondCategoryNo, ingType);
	}
	
	public List<FirstCategoryVO> selectFirstCategory() {
		return projectDao.selectFirstCategory();
	}
	
	public List<SecondCategoryVO> selectSecondCategory(String firstCategory) {
		return projectDao.selectSecondCategory(firstCategory);
	}
	
	public int insertProject(ProjectVO vo) {
		return projectDao.insertProject(vo);
	}
	
	public Map<String, Object> selectByNo(int projectNo) {
		return projectDao.selectByNo(projectNo);
	}
	
	public int selectFundingUserCount(int projectNo) {
		return projectDao.selectFundingUserCount(projectNo);
	}
	
	public String selectFirstCategoryNo(int secondCategoryNo) {
		return projectDao.selectFirstCategoryNo(secondCategoryNo);
	}
	
	public int updateProject(ProjectVO vo) {
		return projectDao.updateProject(vo);
	}

	public String selectDBPwd(int userNo) {
		return projectDao.selectDBPwd(userNo);
	}
	public int deleteFundingList(int projectNo) {
		return projectDao.deleteFundingList(projectNo);
	}
	public int deleteProject(int projectNo) {
		return projectDao.deleteProject(projectNo);
	}
	
	public int insertFunding(FundingListVO vo) {
		return projectDao.insertFunding(vo);
	}
	
	public int deleteFunding(String receiptId) {
		return projectDao.deleteFunding(receiptId);
	}
	
	@Override
	public List<FundingListVO> selectFundingListByProjectNo(int projectNo) {
		return projectDao.selectFundingListByProjectNo(projectNo);
	}

	@Override
	public Map<String, Object> checkLike(int projectNo) {
		return projectDao.checkLike(projectNo);
	}

	@Override
	public Map<String, Object> selectPlanProject(int projectNo) {
		return projectDao.selectPlanProject(projectNo);
	}

	@Override
	public int planCount(int projectNo) {
		return projectDao.planCount(projectNo);
	}

	@Override
	public List<Map<String, Object>> selectplan() {
		return projectDao.selectplan();
	}

	@Override
	public List<Map<String, Object>> randomList() {
		return projectDao.randomList();
	}
	
	@Override
	public List<Map<String, Object>> randomListMain() {
		return projectDao.randomListMain();
	}
}
