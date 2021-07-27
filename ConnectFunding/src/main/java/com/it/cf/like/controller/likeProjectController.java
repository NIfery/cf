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
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.cf.common.PaginationInfo;
import com.it.cf.like.model.likeProjectService;
import com.it.cf.like.model.likeProjectVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class likeProjectController {

	private static final Logger logger
		= LoggerFactory.getLogger(likeProjectController.class);
	
	private final likeProjectService likeService;
	
		@RequestMapping("/mypages/addLikeProject")
		public String addLikeProject(@ModelAttribute likeProjectVO likeVo,
			HttpSession session, Model model) {

		int userNo = (int) session.getAttribute("userNo");
		likeVo.setUserNo(userNo);

		logger.info("좋아한 프로젝트 등록, 파라미터 likeVo={}", likeVo);

		int cnt = likeService.insertLikeProject(likeVo);
		logger.info("프로젝트 좋아요 완료");

		String msg="좋아한 프로젝트 등록에 실패하였습니다.", url="/mypages/likeProject";
		if(cnt>0) {
			msg="좋아한 프로젝트에 추가되었습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}//
	
//	@RequestMapping("/mypages/likeProject")
//	public String showLikeProject(HttpSession session, Model model) {
//		
//		int userNo = (int) session.getAttribute("userNo");
//		logger.info("session userNo={}", userNo);
//		
//		List<Map<String, Object>> likelist = likeService.selectLikeView(userNo);
//		logger.info("좋아한 프로젝트 조회결과, likelist.size={}", likelist.size());
//	
//		model.addAttribute("likelist", likelist);
//		
//		return "mypages/likeProject";
//	}
	
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
	}//
	
	@ResponseBody
	@RequestMapping("/list/checkLike")
	public boolean checkLike(@RequestParam String projectNo) {
		
		logger.info("좋아요 여부 체크, projectNo={}", projectNo);
		
		int result = likeService.selecLikeCheck(Integer.parseInt(projectNo));
		logger.info("좋아요 체크 결과, result={}", result);
		
		boolean bool = false;
		if(result==likeProjectService.LIKE_NO) {
			bool=true;
		}
		
		logger.info("bool={}", bool);
		return bool;
	}//
	
	@RequestMapping("/mypages/likeProject")
	public String likeProject(HttpSession session, @ModelAttribute likeProjectVO likeVo,
			Model model) {
		
		int userNo = (int) session.getAttribute("userNo");
		logger.info("좋아요 페이지, userNo={}, likeVo={}", userNo, likeVo);
		
		PaginationInfo pageInfo = new PaginationInfo();
		pageInfo.setCurrentPage(likeVo.getCurrentPage());
		pageInfo.setBlockSize(1);
		pageInfo.setRecordCountPerPage(6);

		likeVo.setFirstRecordIndex(pageInfo.getFirstRecordIndex());
		likeVo.setRecordCountPerPage(6);
		likeVo.setUserNo(userNo);
		int num = likeVo.getUserNo();
		logger.info("num={}", num);

		List<Map<String, Object>> likelist = likeService.searchlikeprojectList(likeVo);
		logger.info("내가 후원한 프로젝트 likelist.size={}", likelist.size());

		int totalRecord = likeService.selectLikeListTotalRecord(likeVo);
		pageInfo.setTotalRecord(totalRecord);
		logger.info("총 레코드수 totalRecord={}" , totalRecord);

		model.addAttribute("likelist", likelist);
		model.addAttribute("pageInfo", pageInfo);

		return "mypages/likeProject";
	}//
	
}
