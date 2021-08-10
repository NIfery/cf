package com.it.cf.account.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.cf.account.model.AccountService;
import com.it.cf.account.model.AccountVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
/* @RequestMapping("/cfmember") */
public class AccountController {

	private static final Logger logger
		= LoggerFactory.getLogger(AccountController.class);
	
	private final AccountService accountService;
	
	@RequestMapping("/mypages/addAcc")
	public String insertAccount(@ModelAttribute AccountVO accVo, @RequestParam(required = false) String pay, 
			@RequestParam(required = false) String business,
			HttpServletResponse response, HttpSession session, Model model) {
		
		int userNo = (int) session.getAttribute("userNo");
		accVo.setUserNo(userNo);
		
		logger.info("계좌입력, 파라미터 accVo={}", accVo);
		
		int cnt = accountService.insertAccount(accVo);
		logger.info("계좌입력 결과, cnt={}", cnt);
		
		String msg="계좌등록 실패, 다시 시도해주세요.", url="/mypages/settings";
		if(cnt>0) {
			msg="계좌를 등록하였습니다.";
		}
		
		Cookie cookie = new Cookie("ck_pay", pay);
		cookie.setPath("/");
		if(pay != null && !pay.isEmpty()) {
			cookie.setMaxAge(100*24*60*60);
		}else {
			cookie.setMaxAge(0);
		}//
		response.addCookie(cookie);
		
		Cookie cookie2 = new Cookie("ck_business", business);
		cookie2.setPath("/");
		if(business != null && !business.isEmpty()) {
			cookie2.setMaxAge(100*24*60*60);
		}else {
			cookie2.setMaxAge(0);
		}//
		response.addCookie(cookie2);
		
		if(business!=null && !business.isEmpty()) {
			int flagcnt = accountService.updateUserFlag(accVo);
			logger.info("userFlag 변경, 결과 flagcnt={}", flagcnt);
			
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}//
	
	@RequestMapping("/mypageload/account")
	public String selectAccount(HttpSession session, Model model) {
		
		int userNo = (int) session.getAttribute("userNo");
		
		logger.info("등록한 계좌목록보기, 파라미터 userNo={}", userNo);
		
		List<AccountVO> accList = accountService.selectAccount(userNo);
		logger.info("계좌 목록 조회 결과, accList.size={}", accList);
		
		model.addAttribute("accList", accList);
		
		return "mypageload/account";
		
	}//
	
//	@ResponseBody
//	@RequestMapping("/showAcc")
//	public List<AccountVO> selectAccount(HttpSession session) {
//		
//		int userNo = (int) session.getAttribute("userNo");
//		
//		logger.info("등록한 계좌목록보기, 파라미터 userNo={}", userNo);
//		
//		List<AccountVO> accList = accountService.selectAccount(userNo);
//		logger.info("계좌 목록 조회 결과, accList.size={}", accList);
//		
//		return accList;
//		
//	}//
	
	@RequestMapping("/cfmember/jusoPopup")
	public String jusoPopup() {
		return "cfmember/jusoPopup";
	}
	
	@RequestMapping("/mypages/deleteAcc")
	public String deleteAcc(@RequestParam String accountNo, @RequestParam String birth,
			HttpSession session, Model model) {
		
		int userNo = (int) session.getAttribute("userNo");
		logger.info("계좌삭제, 파라미터 accountNo={}, userNo={}", accountNo, userNo);
		
		String businessNo = accountService.selectBusinessNo(userNo);
		logger.info("검색 businessNo={}", businessNo);
		
		int cnt = accountService.deleteAccount(accountNo);
		logger.info("등록계좌 삭제결과, cnt={}", cnt);
		
		if(cnt>0) {
			model.addAttribute("msg", "선택하신 계좌정보가 삭제되었습니다.");
			model.addAttribute("url", "/mypages/settings");
		}
		
		if(businessNo.equals(birth)) {
			int delcnt = accountService.deleteBusinessNo(userNo);
			logger.info("회원테이블에서 사업자번호 삭제결과, delcnt={}", delcnt);
		}
		
		return "common/message";
	}//
	
	@RequestMapping("/agree")
	public String agree_del() {
		return "cfmember/agree";
	}

}
