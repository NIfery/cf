<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<title>마이페이지</title>
<style type="text/css"> 
.blog_right_sidebar .post_category_widget .cat-list li {
    border-bottom: none;
    transition: all 0.3s ease 0s;
    padding-bottom: 0px;
} 

.blog_right_sidebar .post_category_widget .cat-list li a p {
    margin-bottom: 10px;
    font-size: 2em;
}
</style>
<div class="col-lg-4">
	<div class="blog_right_sidebar">
		<div class="single_sidebar_widget post_category_widget"
			style="width: 1200px; margin-left: 200px; background: white; height: 700px;">
			<p class="widget_title" style="text-align: center; font-size: 1.4em;">내 정보</p>
			<ul class="list cat-list">
				<li><a href="#" class="d-flex">
						<p style="color: rgb(39, 163, 255); font-size: 2em;">${sessionScope.userName} <span>님</span></p>
				</a></li>
				<li><a href="#" class="d-flex">
						<p>알림</p>
				</a></li>
				<li><a href="<c:url value='/cfmember/follow'/>" class="d-flex">
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
				<li><a href="<c:url value='/cfmember/settings'/>" class="d-flex">
						<p>설정</p>
				</a></li>
			</ul>
			<br>
			<a href="<c:url value='/cfmember/cfLogout'/>">
			<p class="widget_title" style="font-size: 1.3em;">로그아웃</p></a>
		</div>
	</div>
</div>
<%@ include file="../include/bottom.jsp" %>  