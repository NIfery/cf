package com.it.cf.fdList.model;

import java.sql.Timestamp;

import com.it.cf.common.SearchVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter 
@ToString
public class FDListViewVO extends SearchVO {
	
	private String projectName; 
	private String projectImage;
	private Timestamp paydate; 
	private int opendate;
	private int fundingAmount;
	private Timestamp supportDate; 
	private int userNo; 
	private String userName;
	private String receiptId;
	private int followCheck;
}
