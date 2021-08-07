package com.it.cf.user.model;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface UserDAO {

	int insertUser(UserVO vo);
	UserVO selectByEmail(String userEmail);
	UserVO selectByNo(int userNo);
	String selectPwd(String userEmail);
	int updateProfile(UserVO vo);
	int updatePwd(UserVO vo);
	int checkEmail(String userEmail);
	int checkNickname(String userNickname);
}
