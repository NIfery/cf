package com.it.cf.admin.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class AdminLoginInterceptor implements HandlerInterceptor {

	
	private static final Logger log = LoggerFactory.getLogger(AdminLoginInterceptor.class);
	
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler)
			throws Exception {		
		String adminId=(String) request.getSession().getAttribute("adminId");
		String adminPosition=(String) request.getSession().getAttribute("adminPosition");
		String adminName=(String) request.getSession().getAttribute("adminName");
		log.info("admin-preHandle()호출, adminId={}, adminPosition={}, adminName={}", adminId, adminPosition, adminName);
		
		if(adminId==null || adminId.isEmpty()) {
			request.setAttribute("msg", "먼저 관리자 로그인하세요");
			request.setAttribute("url", "/admin/login");
			
			RequestDispatcher dispatcher
			=request.getRequestDispatcher("/WEB-INF/views/common/message.jsp");
			dispatcher.forward(request, response);
			
			return false;
		}
		
		return true;
	}
	
	
}
