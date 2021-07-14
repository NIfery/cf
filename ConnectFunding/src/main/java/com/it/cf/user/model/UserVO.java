package com.it.cf.user.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
 
@Getter
@Setter
@ToString
public class UserVO {
	private int userNo;		
	private int userFlag; 	
	private String userEmail;	 
	private String businessNo; 
	private String userPwd;
	private String userName; 
	private String userHp; 
	private int userZipcode; 
	private String userAddress;  
	private Timestamp userJoindate;
	private Timestamp userOutdate;  
	private String outFlag; 
}
