package com.it.cf.admin.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.it.cf.chat.model.MessageSendVO;
import com.it.cf.common.SearchVO;
import com.it.cf.user.model.UserVO;

@Mapper
public interface AdminDAO {
	int loginProc(String userid, String pwd);
	String selectPwd(String userid);
	int insertAdmin(AdminVO vo);
	List<Map<String, Object>> selectPosition();
	List<UserVO> selectAllUser(SearchVO searchVo);
	int selectTotalRecord(SearchVO searchVo);
	int idDuplChk(String adminId);
	AdminVO selectByUserid(String adminId);
	void deleteMember(String no);
	int deleteUser(int userNo);
}
