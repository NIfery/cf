package com.it.cf.delivery.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DeliveryVO {

	private int delNo;
	private String delReceiver;
	private String delAddress;
	private String delZipcode; 
	private String delHp; 
	private int	userNo;
	
}	
