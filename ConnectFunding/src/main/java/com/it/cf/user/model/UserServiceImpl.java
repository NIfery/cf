package com.it.cf.user.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

	private final UserDAO userDao;

	@Override
	public int insertUser(UserVO vo) {
		return userDao.insertUser(vo);
	}

	@Override
	public UserVO selectByEmail(String userEmail) {
		return userDao.selectByEmail(userEmail);
	}

	@Override
	public int loginCheck(String userEmail, String userPwd) {
		String dbPwd = userDao.selectPwd(userEmail);
		
		int result=0;
		if(dbPwd.equals(userPwd)) {
			result=LOGIN_OK;
		}else {
			result=NO_PWD;
		}//
		
		return result;
	}

	@Override
	public int updateProfile(UserVO vo) {
		return userDao.updateProfile(vo);
	}

	@Override
	public UserVO selectByNo(int userNo) {
		return userDao.selectByNo(userNo);
	}
	
	@Override
	public int updatePwd(UserVO vo) {
		return userDao.updatePwd(vo);
	}//

	//비밀번호 변경 전에 현재 비밀번호 입력, 일치여부 확인
	@Override
	public int checkPwd(String userEmail, String pwd) {
		String dbPwd = userDao.selectPwd(userEmail);
		
		int result=0;
		if(pwd.equals(dbPwd)) {
			result= PWD_OK;
		}else {
			result= PWD_NO;
		}
		return result;
	}

	@Override
	public int checkEmail(String userEmail) {
		int result=0;
		
		int count = userDao.checkEmail(userEmail);
		if(count>0) {
			result=UNUSABLE_EMAIL;	//2
		}else {
			result=USABLE_EMAIL;	//1
		}
		
		return result;
	}//

}
