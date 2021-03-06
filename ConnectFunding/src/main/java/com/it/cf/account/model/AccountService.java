package com.it.cf.account.model;

import java.util.List;

public interface AccountService {

	int insertAccount(AccountVO accountVo); 
	List<AccountVO> selectAccount(int userNo);
	int deleteAccount(String accountNo);
	int updateUserFlag(AccountVO accountVo);
	String selectBusinessNo(int userNo);
	int deleteBusinessNo(int userNo);
}
