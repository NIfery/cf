package com.it.cf.informProject.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class informProjectServiceImpl implements informProjectService {

	private final informProjectDAO informPjecDao;

	@Override
	public int insertInformProject(informProjectVO informProjectVo) {
		return informPjecDao.insertInformProject(informProjectVo);
	}

	@Override
	public List<Map<String, Object>> selectInformProject(informProjectVO informProjectVo) {
		return informPjecDao.selectInformProject(informProjectVo);
	}

	@Override
	public int deleteinformProject(int projectNo) {
		return informPjecDao.deleteinformProject(projectNo);
	}

	@Override
	public int updateCheck(int projectNo) {
		return informPjecDao.updateCheck(projectNo);
	}

	@Override
	public int informCheck(int projectNo, int userNo) {
		return informPjecDao.informCheck(projectNo, userNo);
	}

	@Override
	public int deleteInform(int projectNo, int userNo) {
		return informPjecDao.deleteInform(projectNo, userNo);
	}

	@Override
	public int informTotalCount(int userNo) {
		return informPjecDao.informTotalCount(userNo);
	}

}
