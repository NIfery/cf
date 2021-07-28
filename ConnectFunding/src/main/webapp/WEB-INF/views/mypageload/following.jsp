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
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
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
<%-- 	<c:if test="">
		<div class="main" style="height: 600px; margin: 0 auto;">
			<div class="div_1">
				<div class="div_2">
					<img src="${pageContext.request.contextPath}/assets/img/ssong/human-resources.png"
						style="width: 100px;">
					<img src="${pageContext.request.contextPath}/assets/img/ssong/users.png"
						style="width: 100px;">
				</div>
				<div>
					<br>
					<span style="font-size: 1.5em;">아직 후원하신 창작자가 없습니다.</span>	
					<br><br>
					<a href="#" class="genric-btn primary-border circle"
						style="margin-left: 90px;">프로젝트 둘러보기</a>
				</div>
			</div>
		</div>
	</c:if>	
	<c:if test="">
		<c:forEach var="" item="">
							<div class="wrap" style="height: 150px; width: 800px; margin-top: 30px; border-bottom: 1px solid #d4cece">
				<div class="trand-right-single d-flex">
					<div class="trand-right-img">
						<img src="<c:url value='/assets/img/logo/user.png'/>"
							style="width: 80px; height: 70px; margin: 40px 13px;">
					</div>
					<div class="trand-right-cap" style="margin: 15px 25px; width: 470px;">
						<span class="color1">
							<p style="font-size: 1.1em;">
								후원하신 <&nbsp<strong>${sessionScope.userName }</strong>&nbsp>&nbsp프로젝트에 창작자의 새 게시글이 올라왔습니다.
							</p>
						</span>
						<span>안녕하세요!</span><br>
						<span style="font-size: 0.9em;"><br>36분전</span>
						<span class="color2" id="accNo"> 
						</span>
							<a href="<c:url value='/cfmember/deleteAcc?accountNo=${accVo.accountNo}'/>"
								class="trand-right-img" id="delete">
								<img src="<c:url value='/assets/img/cancel.png'/>"
								style="width: 20px; margin: -150px 0px 0px 610px;">
							</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:if> --%>
					<div class="wrap" style="height: 150px; width: 800px; margin-top: 30px; border-bottom: 1px solid #d4cece">
				<div class="trand-right-single d-flex">
					<div class="trand-right-img">
						<img src="<c:url value='/assets/img/logo/user.png'/>"
							style="width: 80px; height: 70px; margin: 40px 13px;">
					</div>
					<div class="trand-right-cap" style="margin: 15px 25px; width: 470px;">
						<span class="color1">
							<p style="font-size: 1.1em;">
								<strong>${sessionScope.userName } ></strong>
							</p>
						</span>
						<span>소개들어감!</span><br>
						<span style="font-size: 0.9em;"><br>
							팔로워 11 · 올린 프로젝트 5</span>
					</div>
						<button class="genric-btn info circle" 
							style="width: 100px; height: 40px; margin: 40px 0px 0px 50px;">팔로우</button>
				</div>
			</div>
</div>
<script type="text/javascript">
$(document).ready(function(){

});//
</script>