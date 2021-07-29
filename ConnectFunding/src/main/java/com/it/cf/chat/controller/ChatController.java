package com.it.cf.chat.controller;

import java.time.LocalDate;
import java.util.List;

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

import com.it.cf.chat.model.MessageSendListVO;
import com.it.cf.chat.model.MessageReceiveVO;
import com.it.cf.chat.model.MessageSendVO;
import com.it.cf.chat.model.MessageService;
import com.it.cf.chat.model.SearchVOChat;
import com.it.cf.common.ConstUtil;
import com.it.cf.common.PaginationInfo;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/chat")
@RequiredArgsConstructor
public class ChatController {
	private static final Logger logger=LoggerFactory.getLogger(ChatController.class);
	
	private final MessageService messageService;
	
	@RequestMapping("/write")
	public String write(@ModelAttribute MessageSendVO vo,HttpSession session, Model model) {
		int userNo=(int) session.getAttribute("userNo");
		vo.setUserNo(userNo);
		logger.info("쪽지 보내기, 파라미터 vo={}",vo);
		
		int cnt=messageService.insertChat(vo);
		logger.info("쪽지 보내기 결과 cnt={}",cnt);
		
		String msg="쪽지 보내기 실패!", url="/chat/write";
		if(cnt>0) {
			msg="쪽지 보내기 성공";
			url="/chat/sent";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
		
	}
	
	@RequestMapping("/adminWrite")
	public String adminWrite(@ModelAttribute MessageReceiveVO vo,@ModelAttribute SearchVOChat searchVo,@RequestParam(defaultValue = "0") int messageNo, Model model) {
		vo.setMessageNo(messageNo);
		logger.info("답변하기 vo={}, searchVo={}",vo,searchVo);
		
		int cnt=messageService.insertAdmin(vo);
		
		String msg="답변 등록 실패!", url="/chat/adminDetail?messageNo="+vo.getMessageNo()+"&currentPage="+searchVo.getCurrentPage()+"&searchCondition="+searchVo.getSearchCondition()+"&searchKeyword="+searchVo.getSearchKeyword()+"&startDay="+searchVo.getStartDay()+"&endDay="+searchVo.getEndDay();
		if(cnt>0) {
			msg="답변 등록 성공";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
	
	
	@RequestMapping("/sent")
	public String sentAll(HttpSession session,@ModelAttribute SearchVOChat searchVo,Model model) {
		int userNo=(int) session.getAttribute("userNo");
		logger.info("보낸 쪽지함, userNo={}, searchVo={}",userNo, searchVo);
		
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
		
		List<MessageSendVO> list=messageService.sentAll(searchVo);
		logger.info("list.size={}",list.size());
		
		int totalRecord=messageService.sentCount(searchVo);
		logger.info("보낸 쪽지함, totalRecord={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		List<MessageReceiveVO> listReceive=messageService.receiveAll(searchVo);
		logger.info("listReceive.size={}",listReceive.size());
		
		model.addAttribute("listReceive", listReceive);
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		return "chat/sent";
	}
	
	@RequestMapping("/deleteChat")
	public String deleteChat(@RequestParam(defaultValue = "0") int messageNo,@ModelAttribute SearchVOChat searchVo,Model model) {
		logger.info("파라미터 messageNo={}",messageNo);
		
		int cnt=messageService.deleteReceive(messageNo);
		cnt=messageService.deleteChat(messageNo);
		logger.info("쪽지 삭제 결과 cnt={}",cnt);
		
		String msg="쪽지 삭제 실패!",url="/chat/sent?currentPage="+searchVo.getCurrentPage()+"&searchCondition="+searchVo.getSearchCondition()+"&searchKeyword="+searchVo.getSearchKeyword();
		if(cnt>0) {
			msg="쪽지 삭제 성공";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
	
	@RequestMapping("/deleteReceive")
	public String deleteReceive(@RequestParam(defaultValue = "0") int messageNo,@ModelAttribute SearchVOChat searchVo,Model model) {
		logger.info("파라미터 messageNo={}",messageNo);
		
		int cnt=messageService.deleteReceive(messageNo);
		logger.info("답변 삭제 결과 cnt={}",cnt);
		
		String msg="답변 삭제 실패!", url="/chat/adminDetail?messageNo="+messageNo+"&currentPage="+searchVo.getCurrentPage()+"&searchCondition="+searchVo.getSearchCondition()+"&searchKeyword="+searchVo.getSearchKeyword()+"&startDay="+searchVo.getStartDay()+"&endDay="+searchVo.getEndDay();
		if(cnt>0) {
			msg="답변 삭제 성공";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
	
	
	@RequestMapping("/adminDelete")
	public String adminDelete(@RequestParam(defaultValue = "0") int messageNo,@ModelAttribute SearchVOChat searchVo,Model model) {
		logger.info("파라미터 messageNo={}",messageNo);
		
		int cnt=messageService.deleteReceive(messageNo);
		cnt=messageService.deleteChat(messageNo);
		logger.info("삭제 결과 cnt={}",cnt);
		
		String msg="쪽지 삭제 실패!", url="/chat/adminInbox?currentPage="+searchVo.getCurrentPage()+"&searchCondition="+searchVo.getSearchCondition()+"&searchKeyword="+searchVo.getSearchKeyword()+"&startDay="+searchVo.getStartDay()+"&endDay="+searchVo.getEndDay();
		if(cnt>0) {
			msg="쪽지 삭제 성공";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
	
	
	@RequestMapping("/deleteMulti")
	public String deleteMulti(@ModelAttribute MessageSendListVO sListVo,Model model) {
		logger.info("선택한 쪽지 삭제, 파라미터 mrListVo={}",sListVo);
		
		List<MessageSendVO> list=sListVo.getSMessage();
		for(int i=0;i<list.size();i++) {
			MessageSendVO vo=list.get(i);
			int messageNo=vo.getMessageNo();
			
			logger.info("i={}, messageNo={}", i, messageNo);
		}
		
		String msg="선택한 쪽지 삭제 중 에러 발생!", url="/chat/adminInbox";
		int cnt=messageService.deleteMessageMulti(list);
		if(cnt>0) {
			msg="선택한 쪽지 삭제 완료";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	@RequestMapping("/detail")
	public String sentDetail(@RequestParam(defaultValue = "0") int messageNo,@ModelAttribute SearchVOChat searchVo,Model model) {
		logger.info("쪽지 상세보기 messageNo={}, searchVo={}",messageNo,searchVo);
		
		MessageSendVO sendVo=messageService.sentByMessageNo(messageNo);
		logger.info("sendVo={}",sendVo);
		
		MessageReceiveVO receiveVo=messageService.receiveByMessageNo(messageNo);
		logger.info("receiveVo={}",receiveVo);
		
		model.addAttribute("sendVo", sendVo);
		model.addAttribute("receiveVo", receiveVo);
		model.addAttribute("searchVo", searchVo);
		return "chat/detail";
	}
	
	@RequestMapping("/adminDetail")
	public String adminDetail(@RequestParam(defaultValue = "0") int messageNo,@ModelAttribute SearchVOChat searchVo,Model model) {
		logger.info("관리자 쪽지 상세보기 messageNo={}, searchVo={}",messageNo,searchVo);
		
		MessageSendVO sendVo=messageService.sentByMessageNo(messageNo);
		logger.info("sendVo={}",sendVo);
		
		MessageReceiveVO receiveVo=messageService.receiveByMessageNo(messageNo);
		logger.info("receiveVo={}",receiveVo);
		
		model.addAttribute("sendVo", sendVo);
		model.addAttribute("receiveVo", receiveVo);
		model.addAttribute("searchVo", searchVo);
		return "chat/adminDetail";
	}
	
	
	@GetMapping("/edit")
	public String sentEdit(@RequestParam(defaultValue = "0") int messageNo,@ModelAttribute SearchVOChat searchVo,Model model) {
		logger.info("보낸 쪽지 수정 messageNo={}, searchVo={}",messageNo,searchVo);
		
		MessageSendVO sendVo=messageService.sentByMessageNo(messageNo);
		logger.info("sendVo={}",sendVo);
		
		model.addAttribute("sendVo", sendVo);
		model.addAttribute("searchVo", searchVo);
		return "chat/edit";
	}
	
	
	@PostMapping("/edit")
	public String sentEdit_post(@ModelAttribute MessageSendVO vo,@ModelAttribute SearchVOChat searchVo,Model model) {
		logger.info("쪽지 수정, vo={}, searchVo={}",vo,searchVo);
		
		int cnt=messageService.editMessage(vo);
		logger.info("쪽지 수정 결과 cnt={}",cnt);
		
		String msg="쪽지 수정 실패!", url="/chat/edit?messageNo="+vo.getMessageNo()+"&currentPage="+searchVo.getCurrentPage()+"&searchCondition="+searchVo.getSearchCondition()+"&searchKeyword="+searchVo.getSearchKeyword();
		if(cnt>0) {
			msg="쪽지 수정 성공";
			url="/chat/detail?messageNo="+vo.getMessageNo()+"&currentPage="+searchVo.getCurrentPage()+"&searchCondition="+searchVo.getSearchCondition()+"&searchKeyword="+searchVo.getSearchKeyword();
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	
	@GetMapping("/adminEdit")
	public String adminEdit(@RequestParam(defaultValue = "0") int messageNo,@ModelAttribute SearchVOChat searchVo,Model model) {
		logger.info("답변 수정 messageNo={}, searchVo={}",messageNo,searchVo);
		
		MessageReceiveVO receiveVo=messageService.receiveByMessageNo(messageNo);
		logger.info("receiveVo={}",receiveVo);
		
		MessageSendVO sendVo=messageService.sentByMessageNo(messageNo);
		logger.info("sendVo={}",sendVo);
		
		model.addAttribute("sendVo", sendVo);
		model.addAttribute("receiveVo", receiveVo);
		model.addAttribute("searchVo", searchVo);
		return "chat/adminEdit";
	}
	
	@PostMapping("/adminEdit")
	public String adminEdit_post(@ModelAttribute MessageReceiveVO vo,@ModelAttribute SearchVOChat searchVo,Model model) {
		logger.info("답변 수정, vo={}, searchVo={}",vo,searchVo);
		
		int cnt=messageService.editAdmin(vo);
		logger.info("답변 수정 결과 cnt={}",cnt);
		
		String msg="답변 수정 실패!", url="/chat/adminEdit?messageNo="+vo.getMessageNo()+"&currentPage="+searchVo.getCurrentPage()+"&searchCondition="+searchVo.getSearchCondition()+"&searchKeyword="+searchVo.getSearchKeyword()+"&startDay="+searchVo.getStartDay()+"&endDay="+searchVo.getEndDay();
		if(cnt>0) {
			msg="답변 수정 성공";
			url="/chat/adminDetail?messageNo="+vo.getMessageNo()+"&currentPage="+searchVo.getCurrentPage()+"&searchCondition="+searchVo.getSearchCondition()+"&searchKeyword="+searchVo.getSearchKeyword()+"&startDay="+searchVo.getStartDay()+"&endDay="+searchVo.getEndDay();
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	
	
	@RequestMapping("/adminInbox")
	public String adminInbox(@ModelAttribute SearchVOChat searchVo,Model model) {
		int userNo=0;
		if(searchVo.getSearchCondition().equals("USER_NO")) {
			if(searchVo.getSearchKeyword()==null || !searchVo.getSearchKeyword().trim().equals("")) {
				String searchKeyword=searchVo.getSearchKeyword().trim();
				userNo=Integer.parseInt(searchKeyword);
			}
		}
		logger.info("관리자 쪽지함, searchVo={}",searchVo);
		
		//날짜
		String startDay=searchVo.getStartDay();
		if(startDay==null || startDay.isEmpty()) {
			LocalDate start = LocalDate.now().minusDays(LocalDate.now().getDayOfMonth()-1);
			LocalDate end = LocalDate.now();
		    searchVo.setEndDay(end.toString()); searchVo.setStartDay(start.toString());
		}
		
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
		logger.info("셋팅 후 searchVo={}, pagingInfo={}", searchVo,pagingInfo.getCurrentPage());
		
		List<MessageSendVO> list=messageService.receiveAdmin(searchVo);
		logger.info("list.size={}",list.size());
		
		int totalRecord=messageService.totalReceive(searchVo);
		logger.info("관리자 쪽지함, totalRecord={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		List<MessageReceiveVO> listReceive=messageService.sentAdmin(searchVo);
		logger.info("listReceive.size={}",listReceive.size());
		
		model.addAttribute("listReceive", listReceive);
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		return "/chat/adminInbox";
	}
}
