package com.it.cf.fdList.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FundingListVO {

	private int fundingListNo;
	private int fundingAmount;
	private int projectNo;
	private int userNo;
	private Timestamp supportDate;

}
