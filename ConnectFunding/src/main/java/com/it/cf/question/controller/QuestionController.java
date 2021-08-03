package com.it.cf.question.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.cf.common.ConstUtil;
import com.it.cf.common.PaginationInfo;
import com.it.cf.question.model.AnswerVO;
import com.it.cf.question.model.QuestionService;
import com.it.cf.question.model.QuestionVO;
import com.it.cf.question.model.SearchVOQuestion;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class QuestionController {
	private static final Logger logger=LoggerFactory.getLogger(QuestionController.class);
	
	private final QuestionService questionService;
	
	@RequestMapping("/question/wrtie")
	public String write(@ModelAttribute QuestionVO vo, Model model) {
		logger.info("창작자에게 문의하기, 파라미터 vo={}",vo);
		
		int cnt=questionService.insertQuestion(vo);
		logger.info("문의하기 결과 cnt={}",cnt);
		
		String msg="문의하기 실패!", url="/project/detail?projectNo="+vo.getProjectNo();
		if(cnt>0) {
			msg="문의하기 성공";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
	
	@RequestMapping("/answer/answerWrtie")
	public String answerWrite(@RequestParam(defaultValue = "0")int projectNo, @ModelAttribute AnswerVO vo, Model model) {
logger.info("사용자에게 답변하기, 파라미터 vo={}",vo);
		
		int cnt=questionService.insertAnswer(vo);
		logger.info("답변하기 결과 cnt={}",cnt);
		
		String msg="답변하기 실패!", url="/answer/answerList?projectNo="+projectNo;
		if(cnt>0) {
			msg="답변하기 성공";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
	
	@RequestMapping("/question/questionProject")
	public String questionList(HttpSession session, @ModelAttribute SearchVOQuestion searchVo,Model model) {
		int userNo=(int) session.getAttribute("userNo");
		logger.info("창작자에게 보낸 문의, userNo={}, searchVo={}",userNo, searchVo);
		
		//페이징 처리 관련
		//[1] PaginationInfo
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		//[2]
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setUserNo(userNo);
		logger.info("셋팅 후 searchVo={}", searchVo);
		
		List<QuestionVO> list=questionService.questionList(searchVo);
		logger.info("list.size={}",list.size());
		
		int totalRecord=questionService.questionCount(searchVo);
		logger.info("문의함, totalRecord={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		List<AnswerVO> answerList=questionService.answerList(searchVo);
		logger.info("answerList.size={}",answerList.size());
		
		model.addAttribute("list", list);
		model.addAttribute("answerList", answerList);
		model.addAttribute("pagingInfo", pagingInfo);
		return "question/questionProject";
	}
	
	@RequestMapping("/answer/answerList")
	public String answerList(@ModelAttribute SearchVOQuestion searchVo,Model model) {
		logger.info("받은 문의, searchVo={}",searchVo);
		
		//페이징 처리 관련
		//[1] PaginationInfo
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		//[2]
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("셋팅 후 searchVo={}", searchVo);
		
		List<QuestionVO> list= questionService.questionbyProjectNo(searchVo);
		logger.info("list.size={}",list.size());
		
		int totalRecord=questionService.questionCount(searchVo);
		logger.info("해당 프로젝트 문의함, totalRecord={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		List<AnswerVO> answerList=questionService.answerList(searchVo);
		logger.info("answerList.size={}",answerList.size());
		
		model.addAttribute("list", list);
		model.addAttribute("answerList", answerList);
		model.addAttribute("pagingInfo", pagingInfo);
		return "answer/answerList";
		
	}
	
}
