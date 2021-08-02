package com.it.cf.account.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AccountVO {

	private String accountNo; 
	private String accountHolder;
	private String bankName;
	private String birth;
	private int userNo;
	private Timestamp addDay;
}
