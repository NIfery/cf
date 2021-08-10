package com.it.cf.follow.controller;

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
import com.it.cf.follow.model.FollowService;
import com.it.cf.follow.model.FollowVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class FollowController {

	private static final Logger logger
		= LoggerFactory.getLogger(FollowController.class);
	
	private final FollowService followservice;
	
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
	public String addFollow(@ModelAttribute FollowVO followVo, Model model, 
			HttpSession session) {
		
		int userNo = (int) session.getAttribute("userNo");
		
		int cnt = followservice.insertFollow(followVo);
		logger.info("팔로우 결과, followVo={}", followVo);
		
		String msg="팔로우 실패, 다시 시도해주세요.", url="/mypages/follow";
		if(cnt>0) {
			int checkcount = followservice.updateCheck(followVo.getFollowingUserNo(), followVo.getFollowingUserNo());
			logger.info("followCheck 변경 결과, checkcount={}", checkcount);
			msg="성공적으로 팔로우 되었습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
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
	public String unfollow(@RequestParam(defaultValue = "0") int no, Model model) {
		
		logger.info("팔로우 취소, 파라미터 no={}", no);
		
		int cnt = followservice.deleteFollow(no);
		logger.info("팔로우 삭제결과, cnt={}", cnt);
		
		String msg="팔로우 취소 실패, 다시 시도해주세요.", url="/mypages/follow";
		if(cnt>0) {
			int unfollow = followservice.updateFollow(no);
			logger.info("followCheck 0으로 변경, unfollow={}", unfollow);
			msg="팔로우가 취소되었습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}//
	
	@ResponseBody
	@RequestMapping("/mypageload/checkCount")
	public int checkCount(int followingUserNo) {
		logger.info("프로젝트수 구하기");
		
		int cnt = followservice.projectCount(followingUserNo);
		logger.info("프로젝트 수, cnt={}", cnt);
		
		return cnt;
	}
	
}
