package com.it.cf.informProject.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface informProjectDAO {
	int insertInformProject(informProjectVO informProjectVo);
	List<Map<String, Object>> selectInformProject(int userNo);
	int deleteinformProject(int projectNo);
}
