package com.it.cf.admin.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.springframework.stereotype.Service;

import com.it.cf.common.SearchVO;
import com.it.cf.user.model.UserVO;

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

	@Override
	public List<UserVO> selectAllUser(SearchVO searchVo) {
		return adminDao.selectAllUser(searchVo);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return adminDao.selectTotalRecord(searchVo);
	}

	@Override
	public int idDuplChk(String adminId) {
		return adminDao.idDuplChk(adminId);
	}

	@Override
	public AdminVO selectByUserid(String adminId) {
		return adminDao.selectByUserid(adminId);
	}

	@Override
	public void deleteMember(String no) {
		adminDao.deleteMember(no);
		
	}



}
