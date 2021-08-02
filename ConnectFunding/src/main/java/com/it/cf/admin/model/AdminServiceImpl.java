package com.it.cf.admin.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.it.cf.chat.model.MessageSendVO;
import com.it.cf.common.SearchVO;
import com.it.cf.user.model.UserVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService{
	
	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);

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
	@Transactional
	public int deleteUserMulti(List<UserVO> list) {
		logger.info("deleteUserMulti list.size={}",list.size());
		int cnt=0;
		try {
			for(UserVO vo : list) {
				int userNo=vo.getUserNo();
				logger.info("deleteUserMulti userNo={}",userNo);
				if(userNo!=0) {  //체크한 회원만 삭제
					logger.info("deleteUserMulti, userNo={}",userNo);
					cnt=adminDao.deleteUser(userNo);
					logger.info("deleteUserMulti cnt={}",cnt);
				}
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		logger.info("cnt={}",cnt);
		return cnt;
	}

	@Override
	public List<AdminVO> selectAllAdmin(SearchVO searchVo) {
		return adminDao.selectAllAdmin(searchVo);
	}

	@Override
	public int selectTotalRecord2(SearchVO searchVo) {
		return adminDao.selectTotalRecord2(searchVo);
	}

	@Override
	@Transactional
	public int deleteAdminMulti(List<AdminVO> list) {
		logger.info("deleteAdminMulti list.size={}",list.size());
		int cnt=0;
		try {
			for(AdminVO vo : list) {
				int adminNo=vo.getAdminNo();
				logger.info("deleteAdminMulti adminNo={}",adminNo);
				if(adminNo!=0) {  //체크한 운영자만 삭제
					logger.info("deleteAdminMulti, adminNo={}",adminNo);
					cnt=adminDao.deleteAdmin(adminNo);
					logger.info("deleteAdminMulti cnt={}",cnt);
				}
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		logger.info("cnt={}",cnt);
		return cnt;
	}

	@Override
	public int checkPwd(String adminId, String adminPwd) {
		String dbPwd = adminDao.selectPwd(adminId);
		
		int result=0;
		if(adminPwd.equals(dbPwd)) {
			result= PWD_OK;
		}else {
			result= PWD_NO;
		}
		return result;
	}

	@Override
	public int updatePwd(AdminVO vo) {
		return adminDao.updatePwd(vo);
	}




}
