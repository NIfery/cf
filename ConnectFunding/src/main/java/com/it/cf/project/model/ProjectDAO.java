package com.it.cf.project.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProjectDAO {
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
