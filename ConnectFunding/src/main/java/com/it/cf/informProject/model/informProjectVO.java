package com.it.cf.informProject.model;

import com.it.cf.common.SearchVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class informProjectVO extends SearchVO {

	private int informProjectNo;
	private int projectNo;
	private int userNo;
	private int informCheck;
}
