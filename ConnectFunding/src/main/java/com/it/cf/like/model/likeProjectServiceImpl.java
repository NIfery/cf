package com.it.cf.like.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class likeProjectServiceImpl implements likeProjectService {
	
	private final likeProjectDAO likeprojectDao;

	@Override
	public int insertLikeProject(likeProjectVO likeprojectVo) {
		return likeprojectDao.insertLikeProject(likeprojectVo);
	}

	@Override
	public List<Map<String, Object>> selectLikeView(int userNo) {
		return likeprojectDao.selectLikeView(userNo);
	}

	@Override
	public int deleteLike(int likeNo) {
		return likeprojectDao.deleteLike(likeNo);
	}

}
