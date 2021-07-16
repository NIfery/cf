package com.it.cf.account.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AccountDAO {
	
	int insertAccount(AccountVO accountVo); 
	List<AccountVO> selectAccount(int userNo);
}
