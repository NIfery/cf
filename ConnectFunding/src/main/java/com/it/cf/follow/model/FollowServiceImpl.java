package com.it.cf.follow.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.it.cf.user.model.UserVO;

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
	public List<Map<String, Object>> selectFollowing(FollowVO followVo) {
		return followDao.selectFollowing(followVo);
	}

	@Override
	public List<Map<String, Object>> selectFollower(FollowVO followVo) {
		return followDao.selectFollower(followVo);
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
	}

	@Override
	public int deleteFollow(int followingUserNo) {
		return followDao.deleteFollow(followingUserNo);
	}

	@Override
	public int followCheck(int followingUserNo) {
		return followDao.followCheck(followingUserNo);
	}

	@Override
	public int updateCheck(int userNo, int followingUserNo) {
		return followDao.updateCheck(userNo,followingUserNo);
	}

	@Override
	public int updateFollow(int userNo) {
		return followDao.updateFollow(userNo);
	}

	@Override
	public int followCount(int userNo) {
		return followDao.followCount(userNo);
	}

	@Override
	public int followerCount(int followingUserNo) {
		return followDao.followerCount(followingUserNo);
	}

	@Override
	public UserVO selectInfo(int userNo) {
		return followDao.selectInfo(userNo);
	}//
}
