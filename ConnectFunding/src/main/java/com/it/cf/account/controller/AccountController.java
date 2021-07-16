package com.it.cf.account.controller;

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

import com.it.cf.account.model.AccountService;
import com.it.cf.account.model.AccountVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/cfmember")
public class AccountController {

	private static final Logger logger
		= LoggerFactory.getLogger(AccountController.class);
	
	private final AccountService accountService;
	
	@RequestMapping("/addAcc")
	public String insertAccount(@ModelAttribute AccountVO accVo, 
			HttpSession session, Model model) {
		
		int userNo = (int) session.getAttribute("userNo");
		accVo.setUserNo(userNo);
		
		logger.info("계좌입력, 파라미터 accVo={}", accVo);
		
		int cnt = accountService.insertAccount(accVo);
		logger.info("계좌입력 결과, cnt={}", cnt);
		
		String msg="계좌등록 실패, 다시 시도해주세요.", url="/cfmember/setting2";
		if(cnt>0) {
			msg="계좌를 등록하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}//
	
	@RequestMapping("/showAcc")
	public String selectAccount(@RequestParam(defaultValue = "0") int userNo,
			HttpSession session, Model model) {
		
		logger.info("등록한 계좌목록보기, 파라미터 userNo={}", userNo);
		
		List<AccountVO> accList = accountService.selectAccount(userNo);
		logger.info("계좌 목록 조회 결과, accList.size={}", accList);
		
		model.addAttribute("accList", accList);
		
		return "cfmember/settings2";
		
	}

}
