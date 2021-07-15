package com.it.cf.chat.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chat")
public class ChatController {
	private static final Logger logger=LoggerFactory.getLogger(ChatController.class);
	
	@RequestMapping("/inbox")
	private void inbox() {
		logger.info("받은 쪽지함");
	}
}
