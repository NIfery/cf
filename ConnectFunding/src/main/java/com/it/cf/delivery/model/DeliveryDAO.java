package com.it.cf.delivery.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DeliveryDAO {

	int insertAddress(DeliveryVO deliveryVo);
	List<DeliveryVO> selectdelivery(int userNo);
	int deletedelivery(int delNo);
}
