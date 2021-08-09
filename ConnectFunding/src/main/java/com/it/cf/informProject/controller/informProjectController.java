package com.it.cf.informProject.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.it.cf.common.PaginationInfo;
import com.it.cf.informProject.model.informProjectService;
import com.it.cf.informProject.model.informProjectVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class informProjectController {

	private static final Logger logger
		= LoggerFactory.getLogger(informProjectController.class);
	
	private final informProjectService informServie;
	
	@RequestMapping("/mypages/notifications")
	public String notifications(HttpSession session, Model model, 
			@ModelAttribute informProjectVO informVo) {
		
		int userNo = (int) session.getAttribute("userNo");
		logger.info("알림 페이지, userNo={}", userNo);
		
		PaginationInfo pageInfo = new PaginationInfo();
		pageInfo.setCurrentPage(informVo.getCurrentPage());
		pageInfo.setBlockSize(5);
		pageInfo.setRecordCountPerPage(5);
		
		informVo.setFirstRecordIndex(pageInfo.getFirstRecordIndex());
		informVo.setRecordCountPerPage(5);
		informVo.setUserNo(userNo);
		
		List<Map<String, Object>> iflist = informServie.selectInformProject(informVo);
		logger.info("내가 알림신청한 프로젝트 iflist.size={}", iflist.size());
		
		int totalCount = informServie.informTotalCount(userNo);
		pageInfo.setTotalRecord(totalCount);
		logger.info("알림신청 총 수={}", totalCount);
		
		model.addAttribute("iflist", iflist);
		model.addAttribute("pageInfo", pageInfo);
		
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
	
	@RequestMapping("/mypages/addInform")
	public String addInform(@ModelAttribute informProjectVO informVo,
			HttpSession session, HttpServletRequest request, RedirectAttributes rttr) {
		
		int userNo = (int) session.getAttribute("userNo");
		informVo.setUserNo(userNo);
		
		logger.info("공개 예정 프로젝트 알림 설정, informVo={}", informVo);
		
		int cnt = informServie.insertInformProject(informVo);
		
		if(cnt>0) {
			int update = informServie.updateCheck(informVo.getProjectNo());
			logger.info("inform체크={}", update);
			rttr.addFlashAttribute("msg", "success");
		}
		
	    String referer = request.getHeader("Referer");

		return "redirect:"+ referer;
	}
	
	@RequestMapping("/mypages/deleteInform")
	public String deleteInform(@RequestParam(defaultValue = "0") int projectNo,
			HttpSession session, HttpServletRequest request, RedirectAttributes rttr) {
		
		int userNo = (int) session.getAttribute("userNo");
		logger.info("알림신청 취소 페이지, projectNo={}", projectNo);
		
		int cnt = informServie.deleteInform(projectNo, userNo);
		
		if(cnt>0) {
			rttr.addFlashAttribute("msg", "fail");
		}
		 
		String referer = request.getHeader("Referer");

		return "redirect:"+ referer;
	}
	
}
