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
	public List<Map<String, Object>> selectInformProject(int userNo) {
		return informPjecDao.selectInformProject(userNo);
	}

	@Override
	public int deleteinformProject(int projectNo) {
		return informPjecDao.deleteinformProject(projectNo);
	}
}
