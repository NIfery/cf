package com.it.cf.project.model;

import java.util.List;

public interface ProjectService {
	List<ProjectVO> selectAll();
	int selectTotalFundingAmountByFundingNo(int fundingNo);
}
