package com.it.cf.fdList.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.cf.fdList.model.FundingListService;
import com.it.cf.fdList.model.FundingListVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class FundingListController {

	private static final Logger logger
		= LoggerFactory.getLogger(FundingListController.class);
	
	private final FundingListService fdlistService;
	
	
	@RequestMapping("/mypages/support")
	public String support(HttpSession session, Model model) {
		
		int userNo = (int) session.getAttribute("userNo");
		logger.info("후원현황 페이지, userNo={}", userNo);
		
		List<Map<String, Object>> list = fdlistService.selectFundingList(userNo);
		logger.info("내가 후원한 프로젝트 list.size={}", list.size());
		
		model.addAttribute("fdlist", list);
		
		return "mypages/support";
	}//

}
