package com.it.cf.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.cf.board.model.BoardService;
import com.it.cf.board.model.BoardVO;

import lombok.RequiredArgsConstructor;

@RequestMapping("/board")
@Controller
@RequiredArgsConstructor
public class BoardController {
	
	private static final Logger logger
		= LoggerFactory.getLogger(BoardController.class);
	
	private final BoardService boardService;
	
	@GetMapping("/List")
	public void List() {
		logger.info("게시판 목록 화면 출력");
	}
	
	@GetMapping("/Write")
	public void Write() {
		logger.info("게시판 글쓰기 화면 출력");
	}
	
	@PostMapping("/Write")
	public String Write_post(@ModelAttribute BoardVO vo, Model model) {
		
		logger.info("게시판 글쓰기 등록 파라미터 vo={}",vo);
		
		String msg ="글 등록 실패 다시 시도하여주십시오.", url ="/board/Write";
		int cnt = boardService.boardWrite(vo);
		
		if(cnt > 0) {
			msg ="글 등록 성공.";
			url ="/board/List";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
}
