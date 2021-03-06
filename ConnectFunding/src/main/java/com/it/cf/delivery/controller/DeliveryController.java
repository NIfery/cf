package com.it.cf.delivery.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.cf.delivery.model.DeliveryService;
import com.it.cf.delivery.model.DeliveryVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class DeliveryController {

	private static final Logger logger
		= LoggerFactory.getLogger(DeliveryController.class);
	
	private final DeliveryService deliveryService;
	
	@RequestMapping("/mypages/insertAddress")
	public String insertAddress(@ModelAttribute DeliveryVO delVo, HttpServletResponse response,
			@RequestParam(required = false) String address, Model model) {
		
		logger.info("배송지 등록, 파라미터 delVo={}", delVo);
		
		int cnt = deliveryService.insertAddress(delVo);
		logger.info("배송지 등록결과, cnt={}", cnt);
		
		Cookie cookie = new Cookie("ck_address", address);
		cookie.setPath("/");
		if(address != null && !address.isEmpty()) {
			cookie.setMaxAge(100*24*60*60);
		}else {
			cookie.setMaxAge(0);
		}//
		response.addCookie(cookie);
		
		String msg="배송지등록 실패", url="/mypages/settings";
		if(cnt>0) {
			msg="배송지를 등록하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}//
	
	@RequestMapping("/mypageload/address")
	public String showAddress(HttpSession session, Model model) {
		
		int userNo = (int) session.getAttribute("userNo");
		logger.info("session userNo={}", userNo);
		
		List<DeliveryVO> delList = deliveryService.selectdelivery(userNo);
		logger.info("배송지 조회결과, delList.size={}", delList.size());
		
		model.addAttribute("delList", delList);
		
		return "mypageload/address";
	}//
	
//	@ResponseBody
//	@RequestMapping("/selectAddress")
//	public List<DeliveryVO> showAddress(HttpSession session) {
//		
//		int userNo = (int) session.getAttribute("userNo");
//		logger.info("session userNo={}", userNo);
//		
//		List<DeliveryVO> delList = deliveryService.selectdelivery(userNo);
//		logger.info("배송지 조회결과, delList.size={}", delList.size());
//
//		return delList;
//	}//
	
	@RequestMapping("/mypages/deleteAddress")
	public String deleteAddress(@RequestParam(defaultValue = "0") int delNo, Model model) {
		
		logger.info("배송지 삭제, 파라미터 delNo={}", delNo);

		int cnt = deliveryService.deletedelivery(delNo);
		logger.info("배송지 삭제결과, cnt={}", cnt);
		
		if(cnt>0) {
			model.addAttribute("msg", "선택하신 배송지가 삭제되었습니다.");
			model.addAttribute("url", "/mypages/settings");
		}
		
		return "common/message";
	}//
	
}
