package com.it.cf.admin.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminDAO {
	int loginProc(String userid, String pwd);
	String selectPwd(String userid);
}