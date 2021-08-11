package com.it.cf.follow.model;

import java.util.List;
import java.util.Map;

import com.it.cf.user.model.UserVO;

public interface FollowService {
	
	//팔로우 체크여부
	public static final int FOLLOW_OK=1;
	public static final int FOLLOW_NO=2;
	
	int insertFollow(FollowVO followVo);
	List<Map<String, Object>> selectFollowing(FollowVO followVo);
	/* List<FollowVO> selectFollowing(int userNo); */
	int projectCount(int followingUserNo);
	List<Map<String, Object>> selectFollower(FollowVO followVo);
	int checkFollow(int followingUserNo);
	int deleteFollow(int followingUserNo);
	int followCheck(int followingUserNo);
	int updateCheck(int userNo, int followingUserNo);
	int updateFollow(int userNo);
	int followCount(int userNo);
	int followerCount(int followingUserNo);
	UserVO selectInfo(int userNo);

}
