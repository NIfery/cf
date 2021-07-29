package com.it.cf.admin.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminVO {
	private int adminNo;
	private String adminId;
	private String adminPwd;
	private String adminPosition;
	private String adminName;
	private Timestamp regdate;
}
