<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<title>마이페이지</title>
<div class="col-lg-4">
	<div class="blog_right_sidebar">
		<div class="single_sidebar_widget post_category_widget"
			style="width: 200px; margin-left: 300px; background: white; height: 700px;">
			<h2 class="widget_title">내 정보</h2>
			<ul class="list cat-list">
				<li><a href="#" class="d-flex">
						<p style="color: rgb(39, 163, 255); font-size: 1.5em;">${sessionScope.userName} <span>님</span></p>
				</a></li>
				<li><a href="#" class="d-flex">
						<p>알림</p>
				</a></li>
				<li><a href="#" class="d-flex">
						<p>팔로우</p>
				</a></li>
				<li><a href="#" class="d-flex">
						<p>메시지</p>
				</a></li>
				<li><a href="#" class="d-flex">
						<p>후원현황</p>
				</a></li>
				<li><a href="#" class="d-flex">
						<p>좋아한 프로젝트</p>
				</a></li>
				<li><a href="#" class="d-flex">
						<p>내가 만든 프로젝트</p>
				</a></li>
				<li><a href="<c:url value='/cfmember/settings2'/>" class="d-flex">
						<p>설정</p>
				</a></li>
				<li><a href="<c:url value='/cfmember/cfLogout'/>" class="d-flex">
						<p>로그아웃</p>
				</a></li>
			</ul>
		</div>
	</div>
</div>

<%@ include file="../include/bottom.jsp" %>  