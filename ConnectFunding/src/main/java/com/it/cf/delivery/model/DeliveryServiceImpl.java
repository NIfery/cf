package com.it.cf.delivery.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DeliveryServiceImpl implements DeliveryService {

	private final DeliveryDAO deliveryDao;

	@Override
	public int insertAddress(DeliveryVO deliveryVo) {
		return deliveryDao.insertAddress(deliveryVo);
	}

	@Override
	public List<DeliveryVO> selectdelivery(int userNo) {
		return deliveryDao.selectdelivery(userNo);
	}

	@Override
	public int deletedelivery(int delNo) {
		return deliveryDao.deletedelivery(delNo);
	}
}
