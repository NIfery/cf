package com.it.cf.informProject.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.cf.informProject.model.informProjectService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class informProjectController {

	private static final Logger logger
		= LoggerFactory.getLogger(informProjectController.class);
	
	private final informProjectService informServie;
	
	@RequestMapping("/mypages/notifications")
	public String notifications(HttpSession session, Model model) {
		
		int userNo = (int) session.getAttribute("userNo");
		logger.info("알림 페이지, userNo={}", userNo);
		
		List<Map<String, Object>> iflist = informServie.selectInformProject(userNo);
		logger.info("내가 알람신청한 프로젝트 iflist.size={}", iflist.size());
		
		model.addAttribute("iflist", iflist);
		
		return "mypages/notifications";
	}
	
	@RequestMapping("/mypages/deleteInformView")
	public String deleteView(@RequestParam(defaultValue = "0") int no, Model model) {
		logger.info("알림 페이지 삭제, projectNo={}", no);
		
		int cnt = informServie.deleteinformProject(no);
		logger.info("삭제 결과, cnt={}", cnt);
		
		String msg="삭제 실패, 다시 시도해주세요.", url="/mypages/notifications";
		if(cnt>0) {
			msg="알림이 삭제되었습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
}
