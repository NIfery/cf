package com.it.cf.admin.model;

public interface AdminService {
	//로그인 처리에 사용하는 상수
	int LOGIN_OK=1;  //로그인 성공
	int PWD_DISAGREE=2; //비밀번호 불일치
	int ID_NONE=3; //아이디 존재하지 않음
	
	int loginProc(String userid, String pwd);
}
