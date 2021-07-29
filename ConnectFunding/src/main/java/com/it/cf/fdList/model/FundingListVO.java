package com.it.cf.fdList.model;

import java.sql.Timestamp;

import com.it.cf.common.SearchVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
public class FundingListVO extends SearchVO {

	private int fundingListNo;
	private int fundingAmount;
	private int projectNo;
	private int userNo;
	private Timestamp supportDate;
	private String userName;
	private String receiptId;
	
	@Override
	public String toString() {
		return "FundingListVO [fundingListNo=" + fundingListNo + ", fundingAmount=" + fundingAmount + ", projectNo="
				+ projectNo + ", userNo=" + userNo + ", supportDate=" + supportDate + ", receiptId=" + receiptId
				+ ", toString()=" + super.toString() + "]";
	} 
	
}
