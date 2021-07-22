package com.it.cf.user.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.cf.user.model.UserService;
import com.it.cf.user.model.UserVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/cfmember")
public class UserController {
	
	private static final Logger logger
		= LoggerFactory.getLogger(UserController.class);
	
	private final UserService userService;
	
	@GetMapping("/register")
	public void insertUser() {
		logger.info("회원가입 화면");
	}//
	
	@PostMapping("/register")
	public String  insertUser_post(@ModelAttribute UserVO userVo, Model model) {
		
		logger.info("회원가입 처리, 파라미터 userVo={}", userVo);
		
		int cnt = userService.insertUser(userVo);
		logger.info("회원가입 처리결과, cnt={}", cnt);
		
		String msg="회원가입 실패", url="/cfmember/register";
		if(cnt>0) {
			msg="회원가입 완료! 로그인 해주세요.";
			url="/cfmember/cfLogin";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}//
	
	@GetMapping("/cfLogin")
	public void login() {
		logger.info("로그인 화면");
	}
	
	@PostMapping("/cfLogin")
	public String login_ok(@RequestParam String userEmail,
			@RequestParam String userPwd, 
			@RequestParam(required = false) String customCheck,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		
		logger.info("로그인, 파라미터 userEmail={}, userPwd={}, customCheck={}",
				userEmail, userPwd, customCheck);
		
		int result = userService.loginCheck(userEmail, userPwd);
		logger.info("로그인 결과. result={}", result);
		
		String msg="로그인 처리 실패", url="/cfmember/cfLogin";
		if(result==UserService.LOGIN_OK) {
			UserVO vo = userService.selectByEmail(userEmail);
			logger.info("로그인 성공 - 회원조회 결과 vo={}", vo);
			
			HttpSession session = request.getSession();

			session.setAttribute("userEmail", userEmail);
			session.setAttribute("userName", vo.getUserName());
			session.setAttribute("userNo", vo.getUserNo());
		
			//쿠키저장
			Cookie cookie = new Cookie("ck_mail", "userEmail");
			cookie.setPath("/");
			if(customCheck != null && !customCheck.isEmpty()) {
				cookie.setMaxAge(100*24*60*60);
			}else {
				cookie.setMaxAge(0);
			}//
			response.addCookie(cookie);
			
			msg=vo.getUserName()+"님 반가워요~";
			url="/";
			
		}else if(result==UserService.NO_PWD) {
			logger.info("로그인 실패");
			msg="비밀번호가 일치하지 않습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}//
	
	@RequestMapping("/cfLogout")
	public String Logout(HttpSession session) {
		
		logger.info("회원 로그아웃..");
		
		session.removeAttribute("userEmail");
		session.removeAttribute("userName");
		
		return "redirect:/";
	}//
	
	@RequestMapping("/mypage")
	public void myPage() {
		logger.info("마이페이지");
	}
	
	@RequestMapping("/settings")
	public String Setting(HttpSession session, Model model) {
		
		String userEmail = (String) session.getAttribute("userEmail");
		logger.info("회원정보 수정");
		
		UserVO vo = userService.selectByEmail(userEmail);

		model.addAttribute("vo", vo);
		
		return "cfmember/settings";
	}
	
	@RequestMapping("/update")
	public String update(@ModelAttribute UserVO userVo,
			HttpSession session , Model model) {
		
		int userNo = (int) session.getAttribute("userNo");
		userVo.setUserNo(userNo);
		
		logger.info("프로필 수정화면, 파라미터 userVo={}", userVo);
		
		int cnt = userService.updateProfile(userVo);
		logger.info("회원수정 결과, cnt={}", cnt);
		
		String msg="수정 실패..", url="/cfmember/settings";
		if(cnt>0) {
			msg="회원정보를 수정하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}//
	
	@RequestMapping("/pwdUpdate")
	public String pwdUpdate(@ModelAttribute UserVO userVo,
			@RequestParam String oldPwd,
			HttpSession session, Model model) {
		
		String userEmail = (String) session.getAttribute("userEmail");
		userVo.setUserEmail(userEmail);
		logger.info("userEmail={}", userEmail);
		
		logger.info("비밀번호 변경 페이지, 파라미터 userVo={}, oldPwd={}", userVo , oldPwd);
		
		int result = userService.checkPwd(userEmail, oldPwd);
		logger.info("비밀번호 체크결과, result={}", result);
		
		String msg="비밀번호 수정을 실패하였습니다.", url="/cfmember/settings";
		if(result==UserService.PWD_OK) {
			int cnt = userService.updatePwd(userVo);
			logger.info("비밀번호 수정결과, cnt={}", cnt);
			
			msg="비밀번호를 수정하였습니다.";
		}else if(result==UserService.PWD_NO) {
			msg="비밀번호 불일치";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}//
	
}
