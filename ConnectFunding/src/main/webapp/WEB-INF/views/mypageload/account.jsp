<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<c:if test="${empty accList }">
		<div class="wrap" style="width: 580px;">
			<img src="<c:url value='/assets/img/warning.png'/>"
				class="align_center" style="margin: 34px 0px 20px 240px;">
			<div style="font-size: 0.9em; margin-left: 200px;">
				등록된 결제수단이 없습니다.<br> 결제수단을 추가해주세요.
			</div>
		</div>
	</c:if>
	<c:if test="${!empty accList }">
		<c:forEach var="accVo" items="${accList }">
			<div class="wrap" style="height: 70px; width: 580px;">
				<div class="trand-right-single d-flex">
					<div class="trand-right-img">
						<img src="<c:url value='/assets/img/${accVo.bankName}.png'/>"
							style="width: 80px; height: 25px; margin: 20px 20px;">
					</div>
					<div class="trand-right-cap" style="margin: 5px 0px; width: 580px;">
						<span class="color1">${accVo.bankName }</span>
						<c:if test="${!empty cookie.ck_pay }">
							<span style="background-color: red; margin-left: 5px; color: white; border-radius: 5px;">
							&nbsp기본&nbsp</span>
						</c:if>	
						<br> 
						<span class="color2" id="accNo"> 
						<c:set var="accNo" value="${accVo.accountNo }" />
							**********${fn:substring(accNo,10,15) }
						</span> <a
							href="<c:url value='/mypages/deleteAcc?accountNo=${accVo.accountNo}'/>"
							class="trand-right-img" id="delete"> <img
							src="<c:url value='/assets/img/cancel.png'/>"
							style="width: 20px; margin: -30px 0px 0px 310px;">
						</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:if>
</div>
