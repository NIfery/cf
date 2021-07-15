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
}