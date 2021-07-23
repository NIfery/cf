package com.it.cf.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ConnectController {

	private static final Logger logger
		= LoggerFactory.getLogger(ConnectController.class);
	
	@RequestMapping("/mypages/follow")
	public String follow() {
		logger.info("팔로우 페이지");
		return "mypages/follow";
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
	
	@RequestMapping("/mypageload/notify")
	public String notifyy() {
		logger.info("알림 tab");
		return "mypageload/notify";
	}

	@RequestMapping("/mypageload/load_support")
	public String load_support() {
		logger.info("알림 tab");
		return "mypageload/load_support";
	}
	
	@RequestMapping("/mypages/likeProject")
	public String likeProject() {
		logger.info("좋아한 프로젝트 페이지");
		return "mypages/likeProject";
	}
	
	@RequestMapping("/mypages/projects")
	public String projects() {
		logger.info("내가 만든 프로젝트 페이지");
		return "mypages/projects";
	}
}
