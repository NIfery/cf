package com.it.cf.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.cf.admin.model.AdminService;
import com.it.cf.admin.model.AdminVO;
import com.it.cf.common.AdminConstUtil;
import com.it.cf.common.PaginationInfo;
import com.it.cf.common.SearchVO;
import com.it.cf.user.model.UserVO;

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
	 
	//로그인 처리
	@PostMapping("/login")
	public String login_post(@ModelAttribute AdminVO vo, @RequestParam String adminId, @RequestParam String adminPwd,
			@RequestParam(required = false) String chkSave, 
			HttpServletRequest request, HttpServletResponse response,
			ModelMap model) {
		logger.info("관리자 로그인 처리, 파라미터 vo={}, chkSave={}", vo, chkSave);
		
		int result=adminService.loginProc(adminId, adminPwd);
		logger.info("관리자 로그인 결과, result={}", result);
		
		String msg="관리자 로그인 처리 실패", url="/admin/login";
		if(result==AdminService.LOGIN_OK) {
			msg="관리자 로그인되었습니다.";
			url="/admin/index";

			vo=adminService.selectByUserid(adminId);
			
			request.getSession().setAttribute("adminId", vo.getAdminId());
			request.getSession().setAttribute("adminPosition", vo.getAdminPosition());
			
			logger.info("adminPosition={}",vo.getAdminPosition());
			
			//cookie - ck_admin_userid
			Cookie ck = new Cookie("ck_adminId", vo.getAdminId());
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
	
	//로그아웃 처리
	@RequestMapping("/login/logout")
	public String logout(HttpSession session) {
		logger.info("관리자 로그아웃");
		
		session.removeAttribute("adminId");
		
		return "redirect:/admin/login";
	}
	
	@RequestMapping("/register")
	public void register(Model model) {
		List<Map<String, Object>> list=adminService.selectPosition();
		logger.info("권한 조회 결과, list.size={}", list.size());
		
		//3
		model.addAttribute("list", list);
	}
	
	//관리자 등록 처리
	@PostMapping("/register")
	public String write_post(@ModelAttribute AdminVO vo, Model model) {
		logger.info("관리자 등록, 파라미터 vo={}", vo);
		
		int cnt=adminService.insertAdmin(vo);
		logger.info("관리자 등록 결과, cnt={}", cnt);
		
		String msg="관리자 등록 실패", url="/admin/register";
		if(cnt>0) {
			msg="관리자 등록되었습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
//	//실시간 아이디 중복 확인
//	@RequestMapping(value = "/idDuplChk.do" , method = RequestMethod.POST)
//	public @ResponseBody String idDuplChk(@ModelAttribute("vo") UserVO vo , Model model) throws Exception{
//	    int result = joinService.idDuplChk(vo.getId());
//	    return String.valueOf(result);
//	}
	
	//회원관리 페이지
	@RequestMapping("/membership")
	public String membership(@ModelAttribute SearchVO searchVo, HttpSession session, Model model) {
				logger.info("글 목록 페이지, 파라미터 searchVo={}", searchVo);
				
				//페이징 처리
				//[1] PaginationInfo 객체 생성
				PaginationInfo pagingInfo = new PaginationInfo();
				pagingInfo.setCurrentPage(searchVo.getCurrentPage());
				pagingInfo.setBlockSize(AdminConstUtil.BLOCK_SIZE);
				pagingInfo.setRecordCountPerPage(AdminConstUtil.RECORD_COUNT);
				
				//[2] SearchVo에 paging관련 변수값 셋팅
				searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
				searchVo.setRecordCountPerPage(AdminConstUtil.RECORD_COUNT);
				logger.info("페이지번호 관련 셋팅 후 searchVo={}", searchVo);
				
				//2
				List<UserVO> list=adminService.selectAllUser(searchVo);
				logger.info("글 전체 조회 결과, list.size={}", list.size());
				
				int totalRecord=adminService.selectTotalRecord(searchVo);
				logger.info("totalRecord="+totalRecord);
				pagingInfo.setTotalRecord(totalRecord);
				
				//3
				model.addAttribute("list", list);
				model.addAttribute("pagingInfo", pagingInfo);
				
				return "admin/membership";
	}
	
}
