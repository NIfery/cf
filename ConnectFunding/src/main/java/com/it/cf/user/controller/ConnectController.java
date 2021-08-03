package com.it.cf.user.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ConnectController {

   private static final Logger logger
      = LoggerFactory.getLogger(ConnectController.class);
   
   
   @RequestMapping("/mypages/projects")
   public String projects() {
      logger.info("내가 만든 프로젝트 페이지");
      return "mypages/projects";
   }
   
   @RequestMapping("/mypages/alarmsetting")
   public String alarmsetting(HttpServletResponse response, @RequestParam(required = false)String message,
         @RequestParam(required = false)String pjupdate, @RequestParam(required = false)String follow,
         @RequestParam(required = false)String marketing, Model model) {
      
      logger.info("설정 - 알림 페이지");
      
      Cookie cookie1 = new Cookie("ck_message", message);
      Cookie cookie2 = new Cookie("ck_pjupdate", pjupdate);
      Cookie cookie3 = new Cookie("ck_follow", follow);
      Cookie cookie4 = new Cookie("ck_marketing", marketing);
      cookie1.setPath("/");
      cookie2.setPath("/");
      cookie3.setPath("/");
      cookie4.setPath("/");
      
      if(message!=null && !message.isEmpty()) {
         cookie1.setMaxAge(100*24*60*60);
      }else {
         cookie1.setMaxAge(0);
      }//
      
      if(pjupdate!=null && !pjupdate.isEmpty()) {
         cookie2.setMaxAge(100*24*60*60);
      }else {
         cookie2.setMaxAge(0);
      }//
      
      if(follow!=null && !follow.isEmpty()) {
         cookie3.setMaxAge(100*24*60*60);
      }else {
         cookie3.setMaxAge(0);
      }//
      
      if(marketing!=null && !marketing.isEmpty()) {
         cookie4.setMaxAge(100*24*60*60);
      }else {
         cookie4.setMaxAge(0);
      }//
      
      response.addCookie(cookie1);
      response.addCookie(cookie2);
      response.addCookie(cookie3);
      response.addCookie(cookie4);
      
      String msg="알림 설정이 변경되었습니다.",
      url="/mypages/settings";

      model.addAttribute("msg", msg);
      model.addAttribute("url", url);

      return "common/message";
   }//
   
   @RequestMapping("/cfmember/agree")
   public void agree() {
      logger.info("결제수단 등록 중 내용보기 페이지");
   }//

}