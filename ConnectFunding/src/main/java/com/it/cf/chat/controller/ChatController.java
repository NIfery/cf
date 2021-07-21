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
	
	@RequestMapping("/sent")
	public String sentAll(HttpSession session,Model model) {
		int userNo=(int) session.getAttribute("userNo");
		logger.info("보낸 쪽지함, userNo={}",userNo);
		
		List<MessageSendVO> list=messageService.sentAll(userNo);
		logger.info("list.size={}",list.size());
		
		model.addAttribute("list", list);
		
		return "/chat/sent";
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
}
