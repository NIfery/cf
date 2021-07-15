package com.it.cf.project.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProjectDAO {
	List<ProjectVO> selectAll();
	List<ProjectVO> selectBySecondCategoryNo(int secondCategoryNo);
	int selectTotalFundingAmountByFundingNo(int fundingNo);
}