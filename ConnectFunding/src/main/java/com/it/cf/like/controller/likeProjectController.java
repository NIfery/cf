package com.it.cf.like.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.cf.like.model.likeProjectService;
import com.it.cf.like.model.likeProjectVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class likeProjectController {

	private static final Logger logger
		= LoggerFactory.getLogger(likeProjectController.class);
	
	private final likeProjectService likeService;
	
//		@RequestMapping("/mypages/likeProject")
//		public String addLikeProject(@ModelAttribute likeProjectVO likeVo,
//			HttpSession session, Model model) {
//
//		int userNo = (int) session.getAttribute("userNo");
//		likeVo.setUserNo(userNo);
//
//		logger.info("좋아한 프로젝트 등록, 파라미터 likeVo={}", likeVo);
//
//		int cnt = likeService.insertLikeProject(likeVo);
//		logger.info("프로젝트 좋아요 완료");
//
//		String msg="좋아한 프로젝트 등록에 실패하였습니다.", url="";
//		if(cnt>0) {
//			msg="좋아한 프로젝트에 추가되었습니다.";
//		}
//		
//		model.addAttribute("msg", msg);
//		model.addAttribute("url", url);
//		
//		return "common/message";
//	}//
	
	@RequestMapping("/mypages/likeProject")
	public String showLikeProject(HttpSession session, Model model) {
		
		int userNo = (int) session.getAttribute("userNo");
		logger.info("session userNo={}", userNo);
		
		List<Map<String, Object>> likelist = likeService.selectLikeView(userNo);
		logger.info("좋아한 프로젝트 조회결과, likelist.size={}", likelist.size());
	
		model.addAttribute("likelist", likelist);
		
		return "mypages/likeProject";
	}
	
	@RequestMapping("/mypages/deletelike")
	public String deletelike(@RequestParam(defaultValue = "0") int likeNo,
			Model model) {
		
		logger.info("좋아한 프로젝트 삭제, 파라미터 likeNo={}", likeNo);
		
		int cnt = likeService.deleteLike(likeNo);
		logger.info("좋아한 프로젝트 삭제결과, cnt={}", cnt);
		
		if(cnt>0) {
			model.addAttribute("msg", "취소되었습니다.");
			model.addAttribute("url", "/mypages/likeProject");
		}
		return "common/message";
		
	}
	
}
