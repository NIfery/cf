package com.it.cf.user.model;

public interface UserService {
	
	//로그인 처리 상수
	int LOGIN_OK=1;  //로그인 성공
	int NO_PWD=2; //비밀번호 불일치

	int insertUser(UserVO vo);
	UserVO selectByEmail(String userEmail);
	UserVO selectByNo(int userNo);
	int loginCheck(String userEmail, String userPwd);
	int updateProfile(UserVO vo);
}
