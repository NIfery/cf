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

	@Override
	public int selecLikeCheck(int projectNo) {
		int result = 0;
		
		int cnt = likeprojectDao.selecLikeCheck(projectNo);
		if(cnt>0) {
			result=LIKE_OK;
		}else {
			result=LIKE_NO;
		}
		
		return result;
	}// 좋아요 여부 체크

	@Override
	public List<Map<String, Object>> searchlikeprojectList(likeProjectVO likeprojectVo) {
		return likeprojectDao.searchlikeprojectList(likeprojectVo);
	}

	@Override
	public int selectLikeListTotalRecord(likeProjectVO likeprojectVo) {
		return likeprojectDao.selectLikeListTotalRecord(likeprojectVo);
	}

	@Override
	public int deleteLikeByName(String projectName) {
		return likeprojectDao.deleteLikeByName(projectName);
	}
	
}
