package com.it.cf.project.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.it.cf.project.model.ProjectFileUploadUtil;
import com.it.cf.fdList.model.FundingListVO;
import com.it.cf.project.model.FirstCategoryVO;
import com.it.cf.project.model.ProjectPageInfo;
import com.it.cf.project.model.ProjectService;
import com.it.cf.project.model.ProjectUtil;
import com.it.cf.project.model.ProjectVO;
import com.it.cf.project.model.SecondCategoryVO;
import com.it.cf.user.model.UserService;
import com.it.cf.user.model.UserVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/project")
public class ProjectController {
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
	private final ProjectService projectService;
	private final UserService userService;
	private final ProjectFileUploadUtil fileUploadUtil;
	
	@RequestMapping("/list")
	public String list(@ModelAttribute ProjectVO pageVo, Model model) {
		logger.info("프로젝트 list 화면 보여주기");
		
		List<FirstCategoryVO> fList = projectService.selectFirstCategory();
		List<SecondCategoryVO> sList = projectService.selectSecondCategory("total");
		
		ProjectPageInfo pagingInfo = new ProjectPageInfo();
		pagingInfo.setBlockSize(ProjectUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(pageVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ProjectUtil.RECORD_COUNT);
		
		pageVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		pageVo.setRecordCountPerPage(ProjectUtil.RECORD_COUNT);
		
		List<ProjectVO> list = projectService.selectAll(pageVo);
		logger.info("프로젝트 list 화면 결과, list.size={}", list.size());
		
		int totalRecord = projectService.selectTotalRecord();
		logger.info("list 화면 결과, totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("fList", fList);
		model.addAttribute("sList", sList);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "project/list";
	}
	
	@ResponseBody
	@RequestMapping("/alist")
	public Map<String, Object> ajaxList(@RequestParam int firstCategoryNo, @RequestParam int secondCategoryNo, @RequestParam int curPage, @ModelAttribute ProjectVO pageVo) {
		pageVo.setCurrentPage(curPage);
		ProjectPageInfo pagingInfo = new ProjectPageInfo();
		pagingInfo.setBlockSize(ProjectUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(pageVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ProjectUtil.RECORD_COUNT);
		
		pageVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		pageVo.setRecordCountPerPage(ProjectUtil.RECORD_COUNT);
		pageVo.setFirstCategoryNo(firstCategoryNo);
		pageVo.setSecondCategoryNo(secondCategoryNo);
		
		List<ProjectVO> list = projectService.selectBySecondCategoryNo(pageVo);
		logger.info("프로젝트 list 화면 결과, list.size={}", list.size());
		
		int totalRecord = projectService.selectTotalRecordBySecondCategoryNo(firstCategoryNo, secondCategoryNo);
		
		logger.info("list 화면 결과, totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		map.put("pagingInfo", pagingInfo);
		
		return map;
	}
	
	@RequestMapping("/writeMain")
	public String writeMain(Model model) {
		int count = projectService.selectTotalRecord();
		model.addAttribute("count", count);
		return "project/writeMain";
	}
	
	@RequestMapping("/writeCategory")
	public void writeCategory() {}
	
	@RequestMapping("/writeTitle")
	public String writeTitle(@RequestParam String firstCategory, @RequestParam String projectSummary, Model model) {
		List<FirstCategoryVO> fList = projectService.selectFirstCategory();
		List<SecondCategoryVO> sList = projectService.selectSecondCategory(firstCategory);
		
		model.addAttribute("firstCategory", firstCategory);
		model.addAttribute("projectSummary", projectSummary);
		model.addAttribute("fList", fList);
		model.addAttribute("sList", sList);
		
		return "project/writeTitle";
	}
	
	@ResponseBody
	@RequestMapping("/aWriteTitle")
	public List<SecondCategoryVO> ajaxWriteTitle(@RequestParam String firstCategory) {
		List<SecondCategoryVO> list = projectService.selectSecondCategory(firstCategory);
		return list;
	}
	
	@Transactional
	@PostMapping("/writeTitleSecond")
	public String write_post(@ModelAttribute ProjectVO vo, 
			HttpServletRequest request, Model model) {
		//1
		logger.info("프로젝트 등록 처리, 파라미터 vo={}", vo);
		
		//2
		//파일 업로드 처리
		String fileName = "", originalFileName = "";
		List<Map<String, Object>> list = null;
		try {
			list = fileUploadUtil.fileUpload(request, ProjectUtil.UPLOAD_IMAGE_FLAG);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		for(int i=0;i<list.size();i++) {
			Map<String, Object> map = list.get(i);
			fileName = (String) map.get("fileName");
			originalFileName = (String) map.get("originalFileName");
		}
		
		logger.info("파일 업로드 성공, fileName={}",fileName);
		
		vo.setProjectImage(fileName);
		vo.setProjectFilename(originalFileName);
		
		String msg="", url="";
		int cnt = projectService.insertProject(vo);		
		logger.info("프로젝트 등록 결과, cnt={}", cnt);
		
		
		if(cnt>0) { 
			msg="프로젝트가 등록되었습니다.";
			url="/project/list"; 
		} else {
			msg="프로젝트 등록 실패"; 
			url="/project/writeMain"; 
		}
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@ResponseBody
	@PostMapping("/summer_image")
	public void summer_image(MultipartFile file, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// 업로드할 폴더 경로
		String realFolder = request.getSession().getServletContext().getRealPath("project_assets/projectImg/projectMainImg");;

		// 업로드할 파일 이름
		String org_filename = file.getOriginalFilename();
		String str_filename = fileUploadUtil.getUniqueFileName(org_filename);

		System.out.println("원본 파일명 : " + org_filename);
		System.out.println("저장할 파일명 : " + str_filename);

		String filepath = realFolder + "\\" + str_filename;
		System.out.println("파일경로 : " + filepath);

		File f = new File(filepath);
		if (!f.exists()) {
			f.mkdirs();
		}
		file.transferTo(f);
		out.println("/cf/project_assets/projectImg/projectMainImg/"+str_filename);
		out.close();
	}
	
	@RequestMapping("/detail")
	public String detail(@RequestParam(defaultValue = "0") int projectNo, 
			HttpSession session, Model model) {
		int userNo = (int) session.getAttribute("userNo");
		logger.info("프로젝트 상세화면, 파라미터 projectNo={}, userNo={}", projectNo, userNo);
		
		UserVO userVo = userService.selectByNo(userNo);
		logger.info("user 정보={}", userVo);
		
		Map<String, Object> map = projectService.selectByNo(projectNo);
		int userCnt = projectService.selectFundingUserCount(projectNo);
		logger.info("프로젝트 상세화면 결과 map={}, userCnt={}", map, userCnt);
		
		model.addAttribute("map", map);
		model.addAttribute("userCnt", userCnt);
		model.addAttribute("userVo", userVo);
		
		return "project/detail";
	}
	
	@RequestMapping("/detailFunding")
	public String detailFunding(@RequestParam(defaultValue = "0") int projectNo, 
			@RequestParam(defaultValue = "0") int fdAmount, 
			HttpSession session) {
		int userNo = (int) session.getAttribute("userNo");
		logger.info("프로젝트 펀딩 요청, 파라미터 projectNo={}, userNo={}, fdAmount={}", projectNo, userNo, fdAmount);
		
		FundingListVO vo = new FundingListVO();
		vo.setProjectNo(projectNo);
		vo.setUserNo(userNo);
		vo.setFundingAmount(fdAmount);
		
		int cnt = projectService.insertFunding(vo);
		logger.info("프로젝트 펀딩 결과, cnt={}", cnt);
		
		return "redirect:/project/detail?projectNo="+projectNo;
	}

	@GetMapping("/update")
	public String update(@RequestParam int projectNo, Model model) {
		Map<String, Object> map = projectService.selectByNo(projectNo);
		
		int secondCategoryNo = Integer.parseInt(String.valueOf(map.get("SECOND_CATEGORY_NO")));
		String firstCategory = projectService.selectFirstCategoryNo(secondCategoryNo);
		List<FirstCategoryVO> fList = projectService.selectFirstCategory();
		List<SecondCategoryVO> sList = projectService.selectSecondCategory(firstCategory);
		
		model.addAttribute("map", map);
		model.addAttribute("firstCategory", firstCategory);
		model.addAttribute("fList", fList);
		model.addAttribute("sList", sList);
		
		return "project/update";
	}
	
	@PostMapping("/update")
	public String update_post(@ModelAttribute ProjectVO vo, Model model) {
		//1
		logger.info("프로젝트 수정 처리, 파라미터 vo={}", vo);
		
		//2
		String msg="", url="";
		int cnt = projectService.updateProject(vo);		
		logger.info("프로젝트 수정 결과, cnt={}", cnt);
		
		
		if(cnt>0) { 
			msg="프로젝트가 수정되었습니다.";
			url="/project/detail?projectNo="+vo.getProjectNo(); 
		} else {
			msg="프로젝트 수정 실패"; 
			url="/project/update?projectNo="+vo.getProjectNo(); 
		}
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@Transactional
	@RequestMapping("/delete")
	public String delete(@RequestParam int userNo, @RequestParam int projectNo,
			@RequestParam String pwd, Model model) {
		logger.info("삭제 요청, 파라미터 userNo={}, projectNo={}, pwd={}", userNo, projectNo, pwd);
		
		String msg="", url="";
		String dbPwd = projectService.selectDBPwd(userNo);
		if(dbPwd.equals(pwd)) {
			projectService.deleteFundingList(projectNo);
			projectService.deleteProject(projectNo);
			msg="프로젝트가 삭제되었습니다.";
			url="/project/list"; 
		}else {
			msg="비밀번호가 일치하지 않습니다."; 
			url="/project/detail?projectNo="+projectNo; 
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
