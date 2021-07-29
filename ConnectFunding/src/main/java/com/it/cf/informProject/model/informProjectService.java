package com.it.cf.informProject.model;

import java.util.List;
import java.util.Map;

public interface informProjectService {
	int insertInformProject(informProjectVO informProjectVo);
	List<Map<String, Object>> selectInformProject(int userNo);
	int deleteinformProject(int projectNo);
}
