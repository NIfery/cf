package com.it.cf.account.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AccountServiceImpl implements AccountService {
	
	private final AccountDAO accountDao;

	@Override
	public int insertAccount(AccountVO accountVo) {
		return accountDao.insertAccount(accountVo);
	}//

	@Override
	public List<AccountVO> selectAccount(int userNo) {
		return accountDao.selectAccount(userNo);
	}

	@Override
	public int deleteAccount(String accountNo) {
		return accountDao.deleteAccount(accountNo);
	}

	@Override
	public int updateUserFlag(int userNo) {
		return accountDao.updateUserFlag(userNo);
	}//

}
