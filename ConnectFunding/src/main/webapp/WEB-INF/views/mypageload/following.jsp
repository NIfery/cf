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
	<c:if test="${empty followlist }">
		<div class="main" style="height: 600px; margin: 0 auto;">
			<div class="div_1">
				<div class="div_2">
					<img src="${pageContext.request.contextPath}/assets/img/ssong/users.png"
						style="width: 100px;">
				</div>
				<div>
					<br>
					<span style="font-size: 1.5em;">팔로우한 사용자가 없습니다.</span>	
					<br><br>
				</div>
			</div>
		</div>
	</c:if>	
	<c:if test="${!empty followlist }">
		<c:forEach var="followVo" items="${followlist }">
			<div class="wrap" style="height: 115px; width: 800px; margin-top: 15px; border-bottom: 1px solid #d4cece">
				<div class="trand-right-single d-flex">
					<div class="trand-right-img">
						<c:if test="${empty followVo.userProfile }">
							<div class="profile" style="margin: 20px 20px;">
								<img src="<c:url value='/assets/img/logo/user.png'/>"
									style="width: 60px; height: 60px; margin: 5px 5px;">
							</div>
						</c:if>
						<c:if test="${!empty followVo.userProfile}">
							<div class="profile" style="margin: 20px 20px;">
								<img src="<c:url value='/profile_img/${followVo.userProfile}'/>"
									style="width: 70px; height: 70px;">
							</div>
						</c:if>
					</div>
					<div class="trand-right-cap"
						style="margin: 10px 25px; width: 470px;">
						<span class="color1">
							<p style="font-size: 1.1em;">
								<strong>${followVo.userName}</strong>
							</p>
						</span> 
						<span> 
							<c:if test="${!empty followVo.userIntro}">
								<span style="color: black;">${followVo.userIntro}</span>
							</c:if>
						</span>
						<span style="font-size: 0.9em;"><br>
							<!-- 팔로워 11 · 올린 프로젝트 5</span> -->
					</div>
					<button class="genric-btn info circle" data-toggle="modal" data-target="#myModal"
						style="width: 110px; height: 40px; margin: 30px 0px 0px 40px;">√ 팔로잉</button>
					<!-- Modal -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content" style="width: 352px;">
								<div class="modal-body">
								팔로우를 취소하시면 더 이상 프로젝트 공개 알림을 받으실 수 없습니다. 
								취소하시겠습니까?
								</div>
								<div class="modal-footer">
									<button type="button" class="genric-btn primary-border circle arrow" 
										data-dismiss="modal">취소</button>
									<button type="button" class="genric-btn danger-border circle arrow"
										onclick="location.href='<c:url value="/mypageload/unfollow?no=${followVo.userNo }"/>'">
									확인</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:if>	
</div>

