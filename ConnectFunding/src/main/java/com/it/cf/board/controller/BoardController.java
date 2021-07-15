package com.it.cf.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/board")
@Controller
public class BoardController {
	
	private static final Logger logger
		= LoggerFactory.getLogger(BoardController.class);
	
	@GetMapping("/List")
	public void List() {
		logger.info("board List 화면 출력");
	}
	
	@GetMapping("/Write")
	public void Write() {
		logger.info("board Write 화면 출력");
	}
}
