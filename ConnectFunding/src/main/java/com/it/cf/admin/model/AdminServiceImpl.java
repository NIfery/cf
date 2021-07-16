package com.it.cf.admin.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService{
	
	private final AdminDAO adminDao;
	
	@Override
	public int loginProc(String userid, String pwd) {
		int result=0;
		
		String dbPwd=adminDao.selectPwd(userid);
		if(dbPwd==null || dbPwd.isEmpty()) {
			result=AdminService.ID_NONE;
		}else {
			if(dbPwd.equals(pwd)) {
				result=AdminService.LOGIN_OK;
			}else {
				result=AdminService.PWD_DISAGREE;
			}
		}
		
		return result;
	}

	@Override
	public int insertAdmin(AdminVO vo) {
		return adminDao.insertAdmin(vo);
	}

	@Override
	public List<Map<String, Object>> selectPosition() {
		return adminDao.selectPosition();
	}


}
