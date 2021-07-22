<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/ssong.css">
<style type="text/css">
.has-search .form-control {
	padding-left: 2.375rem;
}

.has-search .form-control-feedback {
	position: absolute;
	z-index: 2;
	display: block;
	width: 2.375rem;
	height: 2.375rem;
	line-height: 2.375rem;
	text-align: center;
	pointer-events: none;
	color: #aaa;
}
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
	<span class="widget_title" style="text-align: left; font-size: 2.5em; margin-left: 10px;">
		후원현황</span>
	<br> <br> <br>
	<div>
		<div class="row" style="margin-top: 20px; margin-left: 5px;">
			<div class="col-md-6" style="width: 500px; height: 50px;">
				<strong style="color: red;">0</strong> 건의 후원 내역이 있습니다.</div>
			<div class="col-md-6 col-md-offset-6">
				<div class="form-group has-search" style="">
					<span class="fa fa-search form-control-feedback"></span> 
					<input type="text" class="form-control" 
						placeholder="프로젝트, 선물, 창작자를 입력하세요.">
				</div>
			</div>
		</div>
		<div class="main" style="height: 600px; margin-top: 20px;">
			<c:if test="${empty fdlist}">
			<div class="div_1">
				<div class="div_2">
					<img src="${pageContext.request.contextPath}/assets/img/ssong/gift-box.png"
						style="width: 100px;">
				</div>
				<div>
					<br>
					<span style="font-size: 1.2em;">후원 내역이 없습니다.</span>	
					<br><br>
				</div>
			</div>
			</c:if>
			<c:if test="${!empty fdlist}">
				<c:forEach var="map" items="${fdlist }">
					<div class="wrap" style="height: 160px; margin-bottom: 20px; border-radius:0;
						border:none; border-bottom: 1px solid #ced4da; width: 700px;">
						<div class="trand-right-single d-flex">
							<div class="trand-right-img">
								<img src="<c:url value='/project_assets/projectImg/${map["PROJECT_IMAGE"]}'/>"
									style="width: 180px; height: 110px; margin: 20px 20px;">
							</div>
							<div class="trand-right-cap"
								style="margin: 20px 10px; width: 450px;">
								<span class="color2" style="font-size: 0.9em;">후원일 &nbsp
									<fmt:formatDate value="${map['SUPPORT_DATE']}" pattern="yyyy-MM-dd"/>
								</span><br>
								<div style="margin-top: 10px; margin-bottom: 10px;">
								<span class="color1" style="font-size: 1.2em;">${map['PROJECT_NAME']}</span><br> 
								<span class="color2" style="font-weight: bold;">
									<fmt:formatNumber value="${map['FUNDING_AMOUNT']}" pattern="#,###"/>원 결제예정
								</span><br>
								</div>
								<span class="color2" style="font-size: 0.8em; color: red;">
									결제 예정일 &nbsp
									<fmt:formatDate value="${map['PAYDATE']}" type="date"/>
								</span> 
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
</div>

<%@ include file="../include/bottom.jsp"%>