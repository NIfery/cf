package com.it.cf.admin.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminDAO {
	int loginProc(String userid, String pwd);
	String selectPwd(String userid);
	int insertAdmin(AdminVO vo);
	List<Map<String, Object>> selectPosition();
}
