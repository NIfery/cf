package com.it.cf.follow.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.it.cf.common.PaginationInfo;
import com.it.cf.follow.model.FollowService;
import com.it.cf.follow.model.FollowVO;
import com.it.cf.project.model.ProjectPageInfo;
import com.it.cf.project.model.ProjectService;
import com.it.cf.project.model.ProjectVO;
import com.it.cf.user.model.UserVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class FollowController {

	private static final Logger logger
		= LoggerFactory.getLogger(FollowController.class);
	
	private final FollowService followservice;
	private final ProjectService projectService;
	
	@RequestMapping("/mypageload/following")
	public String following(HttpSession session, Model model, 
			@ModelAttribute FollowVO followVo) {
		
		logger.info("팔로우 - 팔로잉 탭");
		
		int userNo = (int) session.getAttribute("userNo");
		
		PaginationInfo pageInfo = new PaginationInfo();
		pageInfo.setCurrentPage(followVo.getCurrentPage());
		pageInfo.setBlockSize(5);
		pageInfo.setRecordCountPerPage(5);
		
		followVo.setFirstRecordIndex(pageInfo.getFirstRecordIndex());
		followVo.setRecordCountPerPage(5);
		followVo.setUserNo(userNo);
		
		List<Map<String, Object>> followlist = followservice.selectFollowing(followVo);
		logger.info("내가 팔로우한 사람 목록, followlist.size={}", followlist.size());
	
		int followCount = followservice.followCount(userNo);
		pageInfo.setTotalRecord(followCount);
		logger.info("내가 팔로우한 사람 총 수={}", followCount);
		
		model.addAttribute("followlist", followlist);
		model.addAttribute("pageInfo", pageInfo);
		
		return "mypageload/following";
	}//
	
	@RequestMapping("/mypageload/AddFollow")
	public String addFollow(@ModelAttribute FollowVO followVo,  
			HttpSession session, HttpServletRequest request, RedirectAttributes rttr) {
		
		int userNo = (int) session.getAttribute("userNo");
		
		int cnt = followservice.insertFollow(followVo);
		logger.info("팔로우 결과, followVo={}", followVo);
		
		if(cnt>0) {
			int checkcount = followservice.updateCheck(followVo.getFollowingUserNo(), followVo.getFollowingUserNo());
			logger.info("followCheck 변경 결과, checkcount={}", checkcount);
			rttr.addFlashAttribute("msg", "success");
			//msg="성공적으로 팔로우 되었습니다.";
		}
		
		String referer = request.getHeader("Referer");

		return "redirect:"+ referer;
	}//
	
	@RequestMapping("/mypageload/who_AddFollow")
	public String whoaddFollow(@ModelAttribute FollowVO followVo,  
			HttpSession session, HttpServletRequest request, RedirectAttributes rttr) {
		
		int userNo = (int) session.getAttribute("userNo");
		
		int cnt = followservice.insertFollow(followVo);
		logger.info("팔로우 결과, followVo={}", followVo);
		
		if(cnt>0) {
			rttr.addFlashAttribute("msg", "success");
			//msg="성공적으로 팔로우 되었습니다.";
		}
		
		String referer = request.getHeader("Referer");

		return "redirect:"+ referer;
	}//
	
	@RequestMapping("/mypageload/followers")
	public String followers(HttpSession session, Model model,
				@ModelAttribute FollowVO followVo) {
		
		int followingUserNo = (int) session.getAttribute("userNo");
		
		PaginationInfo pageInfo = new PaginationInfo();
		pageInfo.setCurrentPage(followVo.getCurrentPage());
		pageInfo.setBlockSize(5);
		pageInfo.setRecordCountPerPage(5);
		
		followVo.setFirstRecordIndex(pageInfo.getFirstRecordIndex());
		followVo.setRecordCountPerPage(5);
		followVo.setFollowingUserNo(followingUserNo);
		
		List<Map<String, Object>> followerlist = followservice.selectFollower(followVo);
		logger.info("나를 팔로워한 목록 조회, 팔로워 list.size={}", followerlist.size());
		
		int followerCount = followservice.followerCount(followingUserNo);
		pageInfo.setTotalRecord(followerCount);
		logger.info("나를 팔로워 한 총 수={}", followerCount);
		
		model.addAttribute("followerlist", followerlist);
		model.addAttribute("pageInfo", pageInfo);
		
		return "mypageload/followers";
	}//
	
	@ResponseBody
	@RequestMapping("/mypageload/checkFollow")
	public boolean checkFollow(@RequestParam int followingUserNo) {
		
		logger.info("팔로우 여부 체크, 파라미터 followingUserNo={}", followingUserNo);
		
		int result = followservice.checkFollow(followingUserNo);
		logger.info("팔로우 체크 결과, result={}", result);
		
		boolean bool=false;
		if(result==FollowService.FOLLOW_NO) {
			bool=true;
		}
		
		logger.info("bool={}", bool);
		
		return bool;
	}//
	
	@RequestMapping("/mypageload/unfollow")
	public String unfollow(@RequestParam(defaultValue = "0") int no,
			HttpServletRequest request, RedirectAttributes rttr, HttpSession session) {
		
		int userNo=(int) session.getAttribute("userNo");
		logger.info("팔로우 취소, 파라미터 no={}", no);
		
		int cnt = followservice.deleteFollow(no, userNo);
		logger.info("팔로우 삭제결과, cnt={}", cnt);
		
		if(cnt>0) {
			int unfollow = followservice.updateFollow(no);
			logger.info("followCheck 0으로 변경, unfollow={}", unfollow);
			rttr.addFlashAttribute("msg", "fail");
			//msg="팔로우가 취소되었습니다.";
		}
		String referer = request.getHeader("Referer");

		return "redirect:"+ referer;
		
	}//
	
	@RequestMapping("/mypages/who")
	public String who(@RequestParam(defaultValue = "0") int userNo, @ModelAttribute FollowVO followVo,
			Model model, @ModelAttribute ProjectVO pageVo) {
		
		logger.info("후원한 창작자 정보보기 페이지, userNo={}", userNo);
		
		ProjectPageInfo pagingInfo = new ProjectPageInfo();
		pagingInfo.setBlockSize(6);
		pagingInfo.setCurrentPage(pageVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(6);

		pageVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		pageVo.setRecordCountPerPage(6);
		pageVo.setUserNo(userNo);
		List<ProjectVO> list = projectService.selectAll(pageVo);
		logger.info("내가 만든 프로젝트 페이지 결과, list.size={}", list.size());

		int totalRecord = projectService.selectTotalRecordByUserNo(userNo);
		logger.info("내가 만든 프로젝트 페이지 결과, totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		int count = followservice.projectCount(userNo);
		logger.info("프로젝트 수={}", count);
		
		UserVO vo = followservice.selectInfo(userNo);
		logger.info("vo={}", vo);
		
		int followCheck = followservice.checkFollow(userNo);
		logger.info("followCheck={}", followCheck);
		
		int followerCount = followservice.followerCount(userNo);
		int followCount = followservice.followCount(userNo);

		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("count", count);
		model.addAttribute("vo", vo);
		model.addAttribute("followCheck", followCheck);
		model.addAttribute("followerCount", followerCount);
		model.addAttribute("followCount", followCount);

		return "mypages/who";
	}
	
	@RequestMapping("/mypageload/who_following")
	public String whofollowing(@ModelAttribute FollowVO followVo, Model model,
			@RequestParam(defaultValue = "0") int userNo) {
		
		PaginationInfo pageInfo = new PaginationInfo();
		pageInfo.setCurrentPage(followVo.getCurrentPage());
		pageInfo.setBlockSize(5);
		pageInfo.setRecordCountPerPage(5);
		
		followVo.setFirstRecordIndex(pageInfo.getFirstRecordIndex());
		followVo.setRecordCountPerPage(5);
		followVo.setUserNo(userNo);
		
		List<Map<String, Object>> followlist = followservice.selectFollowing(followVo);
		logger.info("내가 팔로우한 사람 목록, followlist.size={}", followlist.size());
	
		int followCount = followservice.followCount(userNo);
		pageInfo.setTotalRecord(followCount);
		logger.info("내가 팔로우한 사람 총 수={}", followCount);
		
		model.addAttribute("followlist", followlist);
		model.addAttribute("pageInfo", pageInfo);
		
		return "mypageload/who_following";
	}
	
	@RequestMapping("/mypageload/who_follower")
	public String whofollower(@RequestParam(defaultValue = "0") int userNo, Model model,
				@ModelAttribute FollowVO followVo) {
		
		PaginationInfo pageInfo = new PaginationInfo();
		pageInfo.setCurrentPage(followVo.getCurrentPage());
		pageInfo.setBlockSize(5);
		pageInfo.setRecordCountPerPage(5);
		
		followVo.setFirstRecordIndex(pageInfo.getFirstRecordIndex());
		followVo.setRecordCountPerPage(5);
		followVo.setFollowingUserNo(userNo);
		
		List<Map<String, Object>> followerlist = followservice.selectFollower(followVo);
		logger.info("나를 팔로워한 목록 조회, 팔로워 list.size={}", followerlist.size());
		
		int followerCount = followservice.followerCount(userNo);
		pageInfo.setTotalRecord(followerCount);
		logger.info("나를 팔로워 한 총 수={}", followerCount);
		
		model.addAttribute("followerlist", followerlist);
		model.addAttribute("pageInfo", pageInfo);
		
		return "mypageload/who_follower";
	}//
	
}
