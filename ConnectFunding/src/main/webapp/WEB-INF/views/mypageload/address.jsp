<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon.ico">
<!-- CSS here -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/ticker-style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/flaticon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/slicknav.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/animate.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/magnific-popup.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/themify-icons.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/slick.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/nice-select.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/ssong.css">

<style>
.col-md-6 {
	flex: auto;
}
</style>
<div>
	<c:if test="${empty delList }">
		<div class="wrap" style="width: 580px;">
			<img src="<c:url value='/assets/img/warning.png'/>"
				class="align_center" style="margin: 34px 0px 20px 240px;">
			<div style="font-size: 0.9em; margin-left: 200px;">
				등록된 배송지가 없습니다.<br> 배송지를 추가해주세요.
			</div>
		</div>
	</c:if>
	<c:if test="${!empty delList }">
		<c:forEach var="delVo" items="${delList }">
			<div class="wrap" style="height: 120px; width: 580px;">
				<div class="trand-right-single d-flex">
					<div class="trand-right-cap"
						style="margin: 15px 25px; width: 470px;">
						<span class="color1">${delVo.delReceiver }</span>
						<c:if test="${!empty cookie.ck_address }">
							<span style="background-color: red; margin-left: 5px; color: white; border-radius: 5px;">
							&nbsp기본&nbsp</span>
						</c:if>	
						<br> 
						<span class="color2">[${delVo.delZipcode}]&nbsp
							${delVo.delAddress}</span><br> <span class="color2">${delVo.delHp}</span>
						<a href="<c:url value='/mypages/deleteAddress?delNo=${delVo.delNo}'/>"
							class="trand-right-img" id="delete"> <img src="<c:url value='/assets/img/cancel.png'/>"
							style="width: 20px; margin: -90px 0px 0px 500px;">
						</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:if>
</div>