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
import org.springframework.web.bind.annotation.RequestParam;

import com.it.cf.common.ConstUtil;
import com.it.cf.common.PaginationInfo;
import com.it.cf.common.SearchVO;
import com.it.cf.fdList.model.FDListViewVO;
import com.it.cf.fdList.model.FundingListService;
import com.it.cf.fdList.model.FundingListVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class FundingListController {

	private static final Logger logger
	= LoggerFactory.getLogger(FundingListController.class);

	private final FundingListService fdlistService;

		@RequestMapping("/mypages/follow")
	/* @RequestMapping("/mypageload/creators") */
		public String support(HttpSession session, Model model) {

		int userNo = (int) session.getAttribute("userNo");
		logger.info("팔로우 - 후원한 창작자 탭, userNo={}", userNo);

		List<Map<String, Object>> list = fdlistService.selectFundingList(userNo);
		logger.info("팔로우 - 후원한 창작자 탭 list.size={}", list.size());
		
		model.addAttribute("list", list);

//		return "mypageload/creators"; 
		return "mypages/follow";
	}//

//		@RequestMapping("/mypages/support")
//		public String support(HttpSession session, @ModelAttribute SearchVO searchVo,
//			Model model) {
//
//		int userNo = (int) session.getAttribute("userNo");
//		logger.info("후원현황 페이지, userNo={}, searchVo={}", userNo, searchVo);
//
//		PaginationInfo pageInfo = new PaginationInfo();
//		pageInfo.setCurrentPage(searchVo.getCurrentPage());
//		pageInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
//		pageInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
//
//		searchVo.setFirstRecordIndex(pageInfo.getFirstRecordIndex());
//		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
//		
//		FundingListVO vo= new FundingListVO();
//		int vouserNo = vo.getUserNo();
//		logger.info("vouserid={}", vouserNo);
//
//		List<Map<String, Object>> fdlist = fdlistService.searchFundingList(searchVo);
//		logger.info("내가 후원한 프로젝트 fdlist.size={}", fdlist.size());
//
//		int totalRecord = fdlistService.selectTotalRecord(searchVo);
//		pageInfo.setTotalRecord(totalRecord );
//		logger.info("총 레코드수 totalRecord={}" , totalRecord);
//
//		model.addAttribute("fdlist", fdlist);
//		model.addAttribute("pageInfo", pageInfo);
//
//		return "mypages/support";
//	}//
	
		@RequestMapping("/mypages/support")
		public String support(HttpSession session, @ModelAttribute FDListViewVO fdListViewVo, 
				Model model) {

		int userNo = (int) session.getAttribute("userNo");
		logger.info("후원현황 페이지, userNo={}, searchVo={}", userNo, fdListViewVo);
		
		PaginationInfo pageInfo = new PaginationInfo();
		pageInfo.setCurrentPage(fdListViewVo.getCurrentPage());
		pageInfo.setBlockSize(1);
		pageInfo.setRecordCountPerPage(5);

		fdListViewVo.setFirstRecordIndex(pageInfo.getFirstRecordIndex());
		fdListViewVo.setRecordCountPerPage(5);
		fdListViewVo.setUserNo(userNo);
		int num = fdListViewVo.getUserNo();
		logger.info("num={}", num);

		List<Map<String, Object>> fdlist = fdlistService.searchFundingList(fdListViewVo);
		logger.info("내가 후원한 프로젝트 fdlist.size={}", fdlist.size());

		int totalRecord = fdlistService.selectTotalRecord(fdListViewVo);
		pageInfo.setTotalRecord(totalRecord );
		logger.info("총 레코드수 totalRecord={}" , totalRecord);

		model.addAttribute("fdlist", fdlist);
		model.addAttribute("pageInfo", pageInfo);

		return "mypages/support";
	}//

//		@RequestMapping("/mypages/follow")
//		public String follow() {
//			return "mypages/follow";
//		}
}
