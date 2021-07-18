package com.it.cf.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.cf.project.model.FirstCategoryVO;
import com.it.cf.project.model.ProjectPageInfo;
import com.it.cf.project.model.ProjectService;
import com.it.cf.project.model.ProjectUtil;
import com.it.cf.project.model.ProjectVO;
import com.it.cf.project.model.SecondCategoryVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/project")
public class ProjectController {
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
	private final ProjectService projectService;
	
	@RequestMapping("/list")
	public String list(@ModelAttribute ProjectVO pageVo, Model model) {
		logger.info("프로젝트 list 화면 보여주기");
		
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
		
		for(int i=0;i<list.size();i++) {
			int currentAmount = projectService.selectTotalFundingAmountByFundingNo(list.get(i).getFundingNo());
			list.get(i).setTotalFundingAmount(currentAmount);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "project/list";
	}
	
	@ResponseBody
	@RequestMapping("/alist")
	public Map<String, Object> ajaxList(@RequestParam int secondCategoryNo, @RequestParam int curPage, @ModelAttribute ProjectVO pageVo) {
		pageVo.setCurrentPage(curPage);
		ProjectPageInfo pagingInfo = new ProjectPageInfo();
		pagingInfo.setBlockSize(ProjectUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(pageVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ProjectUtil.RECORD_COUNT);
		
		pageVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		pageVo.setRecordCountPerPage(ProjectUtil.RECORD_COUNT);
		pageVo.setSecondCategoryNo(secondCategoryNo);
		
		List<ProjectVO> list = projectService.selectBySecondCategoryNo(pageVo);
		logger.info("프로젝트 list 화면 결과, list.size={}", list.size());
		
		int totalRecord = projectService.selectTotalRecordBySecondCategoryNo(secondCategoryNo);
		logger.info("list 화면 결과, totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		for(int i=0;i<list.size();i++) {
			int currentAmount = projectService.selectTotalFundingAmountByFundingNo(list.get(i).getFundingNo());
			list.get(i).setTotalFundingAmount(currentAmount);
		}
		
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
	public String writeTitle(@RequestParam String firstCategory, Model model) {
		List<FirstCategoryVO> fList = projectService.selectFirstCategory();
		List<SecondCategoryVO> sList = projectService.selectSecondCategory(firstCategory);
		
		model.addAttribute("firstCategory", firstCategory);
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
	
	@RequestMapping("/writeDetail")
	public void writeDetail() {}
}
