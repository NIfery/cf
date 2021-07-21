package com.it.cf.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ConnectController {

	private Logger logger
		= LoggerFactory.getLogger(ConnectController.class);
	
	@RequestMapping("/cfmember/follow")
	public String follow() {
		logger.info("팔로우 페이지");
		return "cfmember/follow";
	}
	
	@RequestMapping("/mypageload/following")
	public String following() {
		logger.info("팔로우 탭");
		return "mypageload/following";
	}
	
//	@RequestMapping("/mypageload/address")
//	public String address() {
//		logger.info("배송지 탭");
//		return "mypageload/address";
//	}

}
