package com.it.cf.follow.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String following(HttpSession session, Model model) {
		
		logger.info("팔로우 - 팔로잉 탭");
		
		int userNo = (int) session.getAttribute("userNo");
		
		List<FollowVO> followlist = followservice.selectFollowing(userNo);
		logger.info("내가 팔로우한 사람 목록, followlist.size={}", followlist.size());
	
		model.addAttribute("followlist", followlist);
		
		return "mypageload/following";
	}//
	
	@RequestMapping("/mypageload/AddFollow")
	public String addFollow(@ModelAttribute FollowVO followVo,
			Model model) {
		
		int cnt = followservice.insertFollow(followVo);
		logger.info("팔로우 결과, followVo={}", followVo);
		int fuserNo=followVo.getFollowingUserNo();
		
		int count = followservice.projectCount(fuserNo);
		
		String msg="팔로우 실패, 다시 시도해주세요.", url="/mypages/follow";
		if(cnt>0) {
			msg="성공적으로 팔로우 되었습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		logger.info("count={}", count);
		
		return "common/message";
	}//
	
	@RequestMapping("/mypageload/followers")
	public String followers(@ModelAttribute FollowVO followVo, HttpSession session,
			Model model) {
		
		int followingUserNo = (int) session.getAttribute("userNo");
		
		List<FollowVO> followerlist = followservice.selectFollower(followingUserNo);
		logger.info("나를 팔로워한 목록 조회, 팔로워 list.size={}", followerlist.size());
		
		model.addAttribute("followerlist", followerlist);
		
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
	}
	
}
