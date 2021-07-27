package com.it.cf.chat.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	
	@GetMapping("/write")
	public void write() {
		logger.info("쪽지 보내기");
	}
	
	@PostMapping("/write")
	public String write_post(@ModelAttribute MessageSendVO vo,HttpSession session, Model model) {
		int userNo=(int) session.getAttribute("userNo");
		vo.setUserNo(userNo);
		logger.info("쪽지 보내기, 파라미터 vo={}",vo);
		
		int cnt=messageService.insertChat(vo);
		logger.info("쪽지 보내기 결과 cnt={}",cnt);
		
		String msg="쪽지 보내기 실패!", url="/chat/write";
		if(cnt>0) {
			model.addAttribute("msg", "쪽지 보내기 성공");
			model.addAttribute("url", "/chat/sent");
		}
		return "common/message";
		
	}
	
	@PostMapping("/adminWrite")
	public String adminWrite(@ModelAttribute MessageReceiveVO vo,int messageNo, Model model) {
		vo.setMessageNo(messageNo);
		logger.info("답변하기 vo={}",vo);
		
		int cnt=messageService.insertAdmin(vo);
		
		String msg="답변 등록 실패!", url="/chat/adminWrite";
		if(cnt>0) {
			model.addAttribute("msg", "답변 등록 성공");
			model.addAttribute("url", "/chat/adminDetail?messageNo="+vo.getMessageNo());
		}
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
	
	@RequestMapping("/inbox")
	public String receiveAll(HttpSession session,@ModelAttribute SearchVOChat searchVo,Model model) {
		int userNo=(int) session.getAttribute("userNo");
		logger.info("받은 쪽지함, userNo={}, searchVo={}",userNo, searchVo);
		
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
		
		List<MessageReceiveVO> list=messageService.receiveAll(searchVo);
		logger.info("list.size={}",list.size());
		
		int totalRecord=messageService.receiveCount(searchVo);
		logger.info("보낸 쪽지함, totalRecord={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "chat/inbox";
	}
	
	@RequestMapping("/deleteChat")
	public String deleteChat(int messageNo,Model model) {
		logger.info("파라미터 messageNo={}",messageNo);
		
		int cnt=messageService.deleteReceive(messageNo);
		cnt=messageService.deleteChat(messageNo);
		logger.info("쪽지 삭제 결과 cnt={}",cnt);
		
		String url="/chat/sent";
		if(cnt>0) {
			return "redirect:/chat/sent";
		}else {
			model.addAttribute("msg", "쪽지 삭제 실패!");
			return "common/message";
		}
	}
	
	@RequestMapping("/deleteReceive")
	public String deleteReceive(int messageNo,Model model) {
		logger.info("파라미터 messageNo={}",messageNo);
		
		int cnt=messageService.deleteReceive(messageNo);
		logger.info("답변 삭제 결과 cnt={}",cnt);
		
		String url="/chat/adminDetail?messageNo="+messageNo;
		if(cnt>0) {
			return "redirect:/chat/adminDetail?messageNo="+messageNo;
		}else {
			model.addAttribute("msg", "답변 삭제 실패!");
			return "common/message";
		}
	}
	
	@RequestMapping("/adminDelete")
	public String adminDelete(int messageNo,Model model) {
		logger.info("파라미터 messageNo={}",messageNo);
		
		int cnt=messageService.deleteReceive(messageNo);
		cnt=messageService.deleteChat(messageNo);
		logger.info("삭제 결과 cnt={}",cnt);
		
		String url="/chat/adminEdit";
		if(cnt>0) {
			return "redirect:/chat/adminInbox";
		}else {
			model.addAttribute("msg", "쪽지 삭제 실패!");
			return "common/message";
		}
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
	
	@RequestMapping("/chatCategory")
	public String countMessage(HttpSession session,@ModelAttribute SearchVOChat searchVo,Model model) {
		int userNo=(int) session.getAttribute("userNo");
		logger.info("보낸 쪽지, 받은 쪽지 수, userNo={}, searchVo={}",userNo,searchVo);
		searchVo.setUserNo(userNo);
		
		int sentCount=messageService.sentCount(searchVo);
		logger.info("보낸 쪽지 수 sentCount={}",sentCount);
		
		int receiveCount=messageService.receiveCount(searchVo);
		logger.info("받은 쪽지 수 receiveCount={}",receiveCount);
		
		model.addAttribute("sentCount", sentCount);
		model.addAttribute("receiveCount", receiveCount);
		
		return "chat/chatCategory";
	}
	
	@RequestMapping("/detail")
	public String sentDetail(int messageNo,Model model) {
		logger.info("쪽지 상세보기 messageNo={}",messageNo);
		
		MessageSendVO sendVo=messageService.sentByMessageNo(messageNo);
		logger.info("sendVo={}",sendVo);
		
		MessageReceiveVO receiveVo=messageService.receiveByMessageNo(messageNo);
		logger.info("receiveVo={}",receiveVo);
		
		model.addAttribute("sendVo", sendVo);
		model.addAttribute("receiveVo", receiveVo);
		return "chat/detail";
	}
	
	@RequestMapping("/adminDetail")
	public String adminDetail(int messageNo,Model model) {
		logger.info("관리자 쪽지 상세보기 messageNo={}",messageNo);
		
		MessageSendVO sendVo=messageService.sentByMessageNo(messageNo);
		logger.info("sendVo={}",sendVo);
		
		MessageReceiveVO receiveVo=messageService.receiveByMessageNo(messageNo);
		logger.info("receiveVo={}",receiveVo);
		
		model.addAttribute("sendVo", sendVo);
		model.addAttribute("receiveVo", receiveVo);
		return "chat/adminDetail";
	}
	
	@GetMapping("/edit")
	public String sentEdit(int messageNo,Model model) {
		logger.info("보낸 쪽지 수정 messageNo={}",messageNo);
		
		MessageSendVO sendVo=messageService.sentByMessageNo(messageNo);
		logger.info("sendVo={}",sendVo);
		
		model.addAttribute("sendVo", sendVo);
		return "chat/edit";
	}
	
	@GetMapping("/adminEdit")
	public String adminEdit(int messageNo,Model model) {
		logger.info("답변 수정 messageNo={}",messageNo);
		
		MessageReceiveVO receiveVo=messageService.receiveByMessageNo(messageNo);
		logger.info("receiveVo={}",receiveVo);
		
		MessageSendVO sendVo=messageService.sentByMessageNo(messageNo);
		logger.info("sendVo={}",sendVo);
		
		model.addAttribute("sendVo", sendVo);
		model.addAttribute("receiveVo", receiveVo);
		return "chat/adminEdit";
	}
	
	@PostMapping("/edit")
	public String sentEdit_post(@ModelAttribute MessageSendVO vo,Model model) {
		logger.info("쪽지 수정, vo={}",vo);
		
		int cnt=messageService.editMessage(vo);
		logger.info("쪽지 수정 결과 cnt={}",cnt);
		
		String msg="쪽지 수정 실패!", url="/chat/edit";
		if(cnt>0) {
			model.addAttribute("msg", "쪽지 수정 성공");
			model.addAttribute("url", "/chat/detail?messageNo="+vo.getMessageNo());
		}
		return "common/message";
	}
	
	@PostMapping("/adminEdit")
	public String adminEdit_post(@ModelAttribute MessageReceiveVO vo,Model model) {
		logger.info("답변 수정, vo={}",vo);
		
		int cnt=messageService.editAdmin(vo);
		logger.info("답변 수정 결과 cnt={}",cnt);
		
		String msg="답변 수정 실패!", url="/chat/adminEdit";
		if(cnt>0) {
			model.addAttribute("msg", "답변 수정 성공");
			model.addAttribute("url", "/chat/adminDetail?messageNo="+vo.getMessageNo());
		}
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
		logger.info("관리자 쪽지함11, searchVo={}",searchVo);
		
		//날짜
		String startDay=searchVo.getStartDay();
		if(startDay==null || startDay.isEmpty()) {
			Date today=new Date();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			String str=sdf.format(today);
			searchVo.setEndDay(str);
			searchVo.setStartDay(str);
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
		logger.info("셋팅 후 searchVo={}", searchVo);
		
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
