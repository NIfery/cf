package com.it.cf.follow.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FollowServiceImpl implements FollowService {

	private final FollowDAO followDao;

	@Override
	public int insertFollow(FollowVO followVo) {
		return followDao.insertFollow(followVo);
	}

	@Override
	public int projectCount(int followingUserNo) {
		return followDao.projectCount(followingUserNo);
	}

	@Override
	public List<FollowVO> selectFollowing(int userNo) {
		return followDao.selectFollowing(userNo);
	}

	@Override
	public List<FollowVO> selectFollower(int followingUserNo) {
		return followDao.selectFollower(followingUserNo);
	}

	@Override
	public int checkFollow(int followingUserNo) {
		int result=0;
		
		int cnt = followDao.checkFollow(followingUserNo);
		if(cnt>0) {
			result=FOLLOW_OK;
		}else {
			result=FOLLOW_NO;
		}
		
		return result;
	}//
}
