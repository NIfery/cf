 package com.it.cf.admin.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.it.cf.admin.model.AdminListVO;
import com.it.cf.admin.model.AdminService;
import com.it.cf.admin.model.AdminVO;
import com.it.cf.chat.model.MessageSendListVO;
import com.it.cf.chat.model.MessageSendVO;
import com.it.cf.common.AdminConstUtil;
import com.it.cf.common.PaginationInfo;
import com.it.cf.common.SearchVO;
import com.it.cf.project.model.FirstCategoryVO;
import com.it.cf.project.model.ProjectPageInfo;
import com.it.cf.project.model.ProjectService;
import com.it.cf.project.model.ProjectUtil;
import com.it.cf.project.model.ProjectVO;
import com.it.cf.project.model.SecondCategoryVO;
import com.it.cf.user.model.UserListVO;
import com.it.cf.user.model.UserVO;

import lombok.RequiredArgsConstructor;


@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {
   private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

   private final AdminService adminService;
   private final ProjectService projectService;
   
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
   
   //실시간 아이디 중복 확인
   @PostMapping("/idDuplChk")
   public @ResponseBody String idDuplChk(@ModelAttribute AdminVO vo , Model model) throws Exception{
       int result = adminService.idDuplChk(vo.getAdminId());
       return String.valueOf(result);
   }
   
   //운영자 관리 페이지
   @RequestMapping("/adminship")
   public String adminship(@ModelAttribute SearchVO searchVo, HttpSession session, Model model) {
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
            List<AdminVO> list=adminService.selectAllAdmin(searchVo);
            logger.info("글 전체 조회 결과, list.size={}", list.size());
            
            int totalRecord=adminService.selectTotalRecord2(searchVo);
            logger.info("totalRecord="+totalRecord);
            pagingInfo.setTotalRecord(totalRecord);
            
            //3
            model.addAttribute("list", list);
            model.addAttribute("pagingInfo", pagingInfo);
            
            return "admin/adminship";
   }
   
   //운영자 선택삭제
   @RequestMapping("/adminDeleteMulti")
	public String adminDeleteMulti(@ModelAttribute AdminListVO adminListVo,Model model) {
		logger.info("선택한 회원 삭제, 파라미터 adminListVo={}",adminListVo);
		
		List<AdminVO> list=adminListVo.getSelectAdmin();
		for(int i=0;i<list.size();i++) {
			AdminVO vo=list.get(i);
			int adminNo=vo.getAdminNo();
			
			logger.info("i={}, adminNo={}", i, adminNo);
		}
		
		String msg="선택한 회원 삭제 중 에러 발생!", url="/admin/adminship";
		int cnt=adminService.deleteAdminMulti(list);
		if(cnt>0) {
			msg="선택한 회원 삭제 완료";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
   
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
   
   //회원 선택삭제
   @RequestMapping("/deleteMulti")
	public String deleteMulti(@ModelAttribute UserListVO userListVo,Model model) {
		logger.info("선택한 회원 삭제, 파라미터 userListVo={}",userListVo);
		
		List<UserVO> list=userListVo.getSelectUser();
		for(int i=0;i<list.size();i++) {
			UserVO vo=list.get(i);
			int userNo=vo.getUserNo();
			
			logger.info("i={}, userNo={}", i, userNo);
		}
		
		String msg="선택한 회원 삭제 중 에러 발생!", url="/admin/membership";
		int cnt=adminService.deleteUserMulti(list);
		if(cnt>0) {
			msg="선택한 회원 삭제 완료";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
   
   @RequestMapping("/confirm")
   public String confirm(@ModelAttribute ProjectVO pageVo, Model model) {
	   ProjectPageInfo pagingInfo = new ProjectPageInfo();
	   pagingInfo.setBlockSize(ProjectUtil.BLOCK_SIZE);
	   pagingInfo.setCurrentPage(pageVo.getCurrentPage());
	   pagingInfo.setRecordCountPerPage(ProjectUtil.RECORD_COUNT);

	   pageVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
	   pageVo.setRecordCountPerPage(ProjectUtil.RECORD_COUNT);

	   int totalRecord = projectService.selectTotalRecord();
	   pagingInfo.setTotalRecord(totalRecord);
	   
	   List<Map<String, Object>> map = projectService.selectAllAdmin(pageVo);
	   
	   model.addAttribute("map", map);
	   model.addAttribute("pagingInfo", pagingInfo);

	   return "admin/confirm";
   }
}