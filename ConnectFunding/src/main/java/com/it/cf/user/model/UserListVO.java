package com.it.cf.user.model;

import java.util.List;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

@Getter
@Setter
@ToString
public class UserListVO {
	private List<UserVO> selectUser;
}
