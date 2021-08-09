package com.it.cf.informProject.model;

import java.util.List;
import java.util.Map;

public interface informProjectService {
	int insertInformProject(informProjectVO informProjectVo);
	List<Map<String, Object>> selectInformProject(informProjectVO informProjectVo);
	int deleteinformProject(int projectNo);
	int updateCheck(int projectNo);
	int informCheck(int projectNo, int userNo);
	int deleteInform(int projectNo, int userNo);
	int informTotalCount(int userNo);
}
