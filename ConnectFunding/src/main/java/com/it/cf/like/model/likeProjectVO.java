package com.it.cf.like.model;

import com.it.cf.common.SearchVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class likeProjectVO extends SearchVO {
	
	private int likeNo;
	private int projectNo;
	private int userNo;
}
