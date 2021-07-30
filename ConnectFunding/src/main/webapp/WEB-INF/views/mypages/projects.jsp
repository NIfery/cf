<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
.div_1 {
	padding: 0px 16px;
	display: flex;
	flex-direction: column;
	-webkit-box-pack: center;
	justify-content: center;
	-webkit-box-align: center;
	align-items: center;
	height: 300px;
	margin-top: 70px;
}
</style>

<div class="single_sidebar_widget post_category_widget"
	style="width: 1000px; margin-left: 200px; background: white; height: 700px; margin-top: 50px;">
	<span class="widget_title"
		style="text-align: left; font-size: 2.5em; margin-left: 10px;">
		내가 만든 프로젝트</span> <br> <br> <br>
	<div class="main" style="height: 600px; margin: 0 auto;">
		<div class="div_1">
			<div class="div_2">
				<img
					src="${pageContext.request.contextPath}/assets/img/ssong/create.png"
					style="width: 100px;">
			</div>
			<div>
				<br> <span style="font-size: 1.5em;">작성한 프로젝트가 없습니다.</span>
				<br> <br> <a href="<c:url value='/project/writeMain'/>"
					class="genric-btn primary-border circle" style="margin-left: 80px;">
					프로젝트 올리기</a>
			</div>
		</div>
	</div>
</div>

<%@ include file="../include/bottom.jsp"%>