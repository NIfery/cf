package com.it.cf.admin.model;

import java.util.List;
import java.util.Map;

import com.it.cf.chat.model.MessageSendVO;
import com.it.cf.common.SearchVO;
import com.it.cf.fdList.model.FundingListVO;
import com.it.cf.project.model.ProjectVO;
import com.it.cf.user.model.UserVO;

public interface AdminService {
	//로그인 처리에 사용하는 상수
	int LOGIN_OK=1;  //로그인 성공
	int PWD_DISAGREE=2; //비밀번호 불일치
	int ID_NONE=3; //아이디 존재하지 않음
	
	//비밀번호 확인 상수
	int PWD_OK=1;	//일치
	int PWD_NO=2;	//불일치
	
	int loginProc(String userid, String pwd);
	int insertAdmin(AdminVO vo);
	List<Map<String, Object>> selectPosition();
	List<UserVO> selectAllUser(SearchVO searchVo);
	List<AdminVO> selectAllAdmin(SearchVO searchVo);
	int selectTotalRecord(SearchVO searchVo);
	int selectTotalRecord2(SearchVO searchVo);
	int idDuplChk(String adminId);
	AdminVO selectByUserid(String adminId);
	int deleteUserMulti(List<UserVO> list);
	int deleteAdminMulti(List<AdminVO> list);
	int checkPwd(String adminId, String adminPwd);
	int updatePwd(AdminVO vo);
	int getEnter(UserVO vo);
	int getGeneral(UserVO vo);
	int getTotalUser(UserVO vo);
	int getTotalFunding(ProjectVO vo);
	Map<String, Object> getMonthFunding();
	int getTotalWaitFunding(ProjectVO vo);
	Map<String, Object> getMonthWaitFunding();
	int getTotalFundingComm(FundingListVO vo);
	Map<String, Object> getMonthFundingComm();
}
