package com.it.cf.project.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.cf.project.model.ProjectService;
import com.it.cf.project.model.ProjectVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/project")
public class ProjectController {
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
	private final ProjectService projectService;
	
	@RequestMapping("/list")
	public String list(Model model) {
		logger.info("프로젝트 list 화면 보여주기");
		
		List<ProjectVO> list = projectService.selectAll();
		logger.info("프로젝트 list 화면 결과, list.size={}", list.size());
		
		for(int i=0;i<list.size();i++) {
			int currentAmount = projectService.selectTotalFundingAmountByFundingNo(list.get(i).getFundingNo());
			list.get(i).setTotalFundingAmount(currentAmount);
		}
		
		model.addAttribute("list", list);
		
		return "project/list";
	}
	
	@ResponseBody
	@RequestMapping("/alist")
	public List<ProjectVO> ajaxList(@RequestParam int secondCategoryNo) {
		List<ProjectVO> list = projectService.selectBySecondCategoryNo(secondCategoryNo);
		for(int i=0;i<list.size();i++) {
			int currentAmount = projectService.selectTotalFundingAmountByFundingNo(list.get(i).getFundingNo());
			list.get(i).setTotalFundingAmount(currentAmount);
		}
		return list;
	}
}
