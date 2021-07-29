package com.it.cf.follow.model;

import java.util.List;

public interface FollowService {
	
	//팔로우 체크여부
	public static final int FOLLOW_OK=1;
	public static final int FOLLOW_NO=2;
	
	int insertFollow(FollowVO followVo);
	List<FollowVO> selectFollowing(int userNo);
	int projectCount(int followingUserNo);
	List<FollowVO> selectFollower(int followingUserNo);
	int checkFollow(int followingUserNo);
	int deleteFollow(int followingUserNo);
	int followCheck(int followingUserNo);
	int updateCheck(int userNo, int followingUserNo);
	int updateFollow(int userNo);
}
