package com.it.cf.project.model;

import java.util.List;

public interface ProjectService {
	List<ProjectVO> selectAll();
	List<ProjectVO> selectBySecondCategoryNo(int secondCategoryNo);
	int selectTotalFundingAmountByFundingNo(int fundingNo);
}
