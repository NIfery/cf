package com.it.cf.delivery.model;

import java.util.List;

public interface DeliveryService {
	
	int insertAddress(DeliveryVO deliveryVo);
	List<DeliveryVO> selectdelivery(int userNo);
	int deletedelivery(int delNo);
}
