package com.it.cf.follow.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.it.cf.user.model.UserVO;

@Mapper
public interface FollowDAO {
	
	int insertFollow(FollowVO followVo);
	List<Map<String, Object>> selectFollowing(FollowVO followVo);
	int projectCount(int followingUserNo);
	List<Map<String, Object>> selectFollower(FollowVO followVo);
	int checkFollow(int followingUserNo);
	int deleteFollow(int followingUserNo, int userNo);
	int followCheck(int followingUserNo);
	int updateCheck(int userNo, int followingUserNo);
	int updateFollow(int userNo);
	int followCount(int userNo);
	int followerCount(int followingUserNo);
	UserVO selectInfo(int userNo);
}
