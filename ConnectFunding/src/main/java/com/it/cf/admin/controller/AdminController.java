package com.it.cf.admin.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.cf.admin.model.AdminService;
import com.it.cf.admin.model.AdminVO;

import lombok.RequiredArgsConstructor;


@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	private final AdminService adminService;
	@RequestMapping("/index")
	public void index() {
		
	}
	
	@RequestMapping("/login")
	public void login() {
		
	}
	
	@PostMapping("/login")
	public String login_post(@ModelAttribute AdminVO vo, 
			@RequestParam(required = false) String chkSave, 
			HttpServletRequest request, HttpServletResponse response,
			ModelMap model) {
		logger.info("관리자 로그인 처리, 파라미터 vo={}, chkSave={}", vo, chkSave);
		
		int result=adminService.loginProc(vo.getAdminId(), vo.getAdminPwd());
		logger.info("관리자 로그인 결과, result={}", result);
		
		String msg="관리자 로그인 처리 실패", url="/admin/login";
		if(result==AdminService.LOGIN_OK) {
			msg="관리자 로그인되었습니다.";
			url="/admin/index";
			
			//session - adminUserid
			request.getSession().setAttribute("adminId", vo.getAdminId());
			
			//cookie - ck_admin_userid
			Cookie ck = new Cookie("ck_admin_userid", vo.getAdminId());
			ck.setPath("/");
			if(chkSave!=null && !chkSave.isEmpty()) {
				ck.setMaxAge(1000*24*60*60);
			}else {
				ck.setMaxAge(0);
			}
			response.addCookie(ck);
			
		}else if(result==AdminService.PWD_DISAGREE) {
			msg="비밀번호가 일치하지 않습니다.";
		}else if(result==AdminService.ID_NONE) {
			msg="해당 아이디가 존재하지 않습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
