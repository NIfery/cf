package com.it.cf.follow.model;

import com.it.cf.user.model.UserVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FollowVO extends UserVO {

	private String following;	//내가 팔로우한 사람들
	private String followers;	//나를 팔로우한 사람들
	private int followingUserNo;	//내가 팔로우한 사람 userNo
	private int userNo;	//내 userNo
}
