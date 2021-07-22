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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
.div_1 {
	padding: 0px 16px;
	display: flex;
	flex-direction: column;
	-webkit-box-pack: center;
	justify-content: center;
	-webkit-box-align: center;
	align-items: center;
	height: 300px;
}

.genric-btn.primary-border {
    color: #9a9a9a;
    border: 1px solid #9a9a9a;
    background: #fff;
}

</style>
<div>	
	<c:if test="${empty iflist }">
		<div class="main" style="height: 600px; margin: 0 auto;">
			<div class="div_1">
				<div class="div_2">
					<img src="${pageContext.request.contextPath}/assets/img/ssong/notification-bell.png"
						style="width: 100px;">
				</div>
				<div>
					<br>
					<span style="font-size: 1.5em;">알림 내역이 없습니다.</span>	
					<br><br>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${!empty iflist }">
		<c:forEach var="map" items="${iflist }">
			<div class="wrap" style="height: 70px;">
				<div class="trand-right-single d-flex">
					<div class="trand-right-img">
						<img src="<c:url value='/assets/img/logo/user.png'/>"
							style="width: 80px; height: 25px; margin: 20px 20px;">
					</div>
					<div class="trand-right-cap" style="margin: 5px 0px; width: 370px;">
						<span class="color1">
						<span>알림신청하신 ${map['PROJECT_NAME'] }프로젝트가 공개되었습니다.</span>
						</span><br><br>  
						<span>${map['OPENDATE'] }일 전</span>
						<span class="color2" id="accNo"> 
						</span> 
							<a href="<c:url value='/cfmember/deleteAcc?accountNo=${accVo.accountNo}'/>"
								class="trand-right-img" id="delete"> 
								<img src="<c:url value='/assets/img/cancel.png'/>"
								style="width: 20px; margin: -30px 0px 0px 240px;">
							</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:if>
</div> 
