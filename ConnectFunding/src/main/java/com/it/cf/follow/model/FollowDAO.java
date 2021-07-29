package com.it.cf.follow.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FollowDAO {
	
	int insertFollow(FollowVO followVo);
	List<FollowVO> selectFollowing(int userNo);
	int projectCount(int followingUserNo);
	List<FollowVO> selectFollower(int followingUserNo);
	int checkFollow(int followingUserNo);
}
