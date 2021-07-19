package com.it.cf.chat.controller;

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

import com.it.cf.chat.model.MessageReceiveVO;
import com.it.cf.chat.model.MessageSendVO;
import com.it.cf.chat.model.MessageService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/chat")
@RequiredArgsConstructor
public class ChatController {
	private static final Logger logger=LoggerFactory.getLogger(ChatController.class);
	
	private final MessageService messageService;
	
	@RequestMapping("/inbox")
	public void inbox() {
		logger.info("받은 쪽지함");
	}
	
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
	public String sentAll(HttpSession session,Model model) {
		int userNo=(int) session.getAttribute("userNo");
		logger.info("보낸 쪽지함, userNo={}",userNo);
		
		List<MessageSendVO> list=messageService.sentAll(userNo);
		logger.info("list.size={}",list.size());
		
		model.addAttribute("list", list);
		
		return "chat/sent";
	}
	
	@RequestMapping("/deleteChat")
	public String deleteChat(int messageNo,Model model) {
		logger.info("파라미터 messageNo={}",messageNo);
		
		int cnt=messageService.deleteChat(messageNo);
		logger.info("삭제 결과 cnt={}",cnt);
		
		String url="/chat/sent";
		if(cnt>0) {
			return "redirect:/chat/sent";
		}else {
			model.addAttribute("msg", "쪽지 삭제 실패!");
			return "common/message";
		}
	}
	
	@RequestMapping("/chatCategory")
	public String countMessage(HttpSession session,Model model) {
		int userNo=(int) session.getAttribute("userNo");
		logger.info("보낸 쪽지, 받은 쪽지 수, userNo={}",userNo);
		
		int sentCount=messageService.sentCount(userNo);
		logger.info("보낸 쪽지 수 sentCount={}",sentCount);
		
		int receiveCount=messageService.receiveCount(userNo);
		logger.info("받은 쪽지 수 receiveCount={}",receiveCount);
		
		model.addAttribute("sentCount", sentCount);
		model.addAttribute("receiveCount", receiveCount);
		
		return "chat/chatCategory";
	}
	
	@RequestMapping("/detail")
	public String sentDetail(int messageNo,Model model) {
		logger.info("보낸 쪽지 상세보기 messageNo={}",messageNo);
		
		MessageSendVO sendVo=messageService.sentByMessageNo(messageNo);
		logger.info("sendVo={}",sendVo);
		
		model.addAttribute("sendVo", sendVo);
		return "chat/detail";
	}
	
	@RequestMapping("/adminDetail")
	public String adminDetail(int messageNo,Model model) {
		logger.info("관리자 받은 쪽지 상세보기 messageNo={}",messageNo);
		
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
	
	@RequestMapping("/adminInbox")
	public String adminInbox(Model model) {
		logger.info("관리자 받은 편지함");
		
		List<MessageSendVO> list=messageService.receiveAdmin();
		logger.info("list.size=",list.size());
		
		model.addAttribute("list", list);
		return "/chat/adminInbox";
	}
}
