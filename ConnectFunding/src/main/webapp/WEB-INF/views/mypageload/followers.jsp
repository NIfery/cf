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
	<c:if test="${empty followerlist }">
		<div class="main" style="height: 600px; margin: 0 auto;">
			<div class="div_1">
				<div class="div_2">
					<img src="${pageContext.request.contextPath}/assets/img/ssong/users.png"
						style="width: 100px;">
				</div>
				<div>
					<br>
					<span style="font-size: 1.5em;">???????????? ????????????.</span>	
					<br><br>
				</div>
			</div>
		</div>
	</c:if>	
	<c:if test="${!empty followerlist }">
		<c:forEach var="map" items="${followerlist }">
		<form method="post">
		<input type="hidden" name="following" value="${map['USER_NAME']}">
		<input type="hidden" id="followNo" name="followingUserNo" value="${map['USER_NO']}"> 
		<input type="hidden" name="userNo" value="${sessionScope.userNo}">
			<div class="wrap" style="height: 115px; width: 800px; margin-top: 30px; border-bottom: 1px solid #d4cece">
				<div class="trand-right-single d-flex">
					<div class="trand-right-img">
						<c:if test="${empty map['USER_PROFILE'] }">
							<div class="profile" style="margin: 20px 20px;">
								<img src="<c:url value='/assets/img/logo/user.png'/>"
									style="width: 60px; height: 60px; margin: 5px 5px;">
							</div>
						</c:if>
						<c:if test="${!empty map['USER_PROFILE']}">
							<div class="profile" style="margin: 30px 20px;">
								<img src="<c:url value='/profile_img/${map["USER_PROFILE"]}'/>"
									style="width: 70px; height: 70px;">
							</div>
						</c:if>
					</div>
					<div class="trand-right-cap"
						style="margin: 15px 25px; width: 470px;">
						<span class="color1">
							<p style="font-size: 1.1em;">
								<strong>${map['USER_NAME']}</strong>
							</p>
						</span> 
						<span> 
							<c:if test="${!empty map['USER_INTRO']}">
								<span style="color: black;">${map['USER_INTRO']}</span>
							</c:if>
						</span>
						<span style="font-size: 0.9em;"><br>
							<!-- ????????? 11 ?? ?????? ???????????? 5</span> -->
					</div>
					<c:if test="${map['FOLLOW_CHECK']=='0' }">
						<button class="genric-btn info-border circle arrow" id="follow"
							style="width: 110px; height: 40px; margin: 40px 0px 0px 40px;">+ ?????????</button>
					</c:if>
					<c:if test="${map['FOLLOW_CHECK']=='1' }">
						<button class="genric-btn info circle" id="unfollow"
							style="width: 110px; height: 40px; margin: 40px 0px 0px 40px;">??? ?????????</button>	
					</c:if>
				</div>
			</div>
			</form>
		</c:forEach>
	</c:if>	
		<!-- ??????????????? -->
	<div style="margin-right: 400px;">
		<nav class="blog-pagination justify-content-center d-flex">
			<ul class="pagination">
				<c:if test="${pageInfo.firstPage>1 }">
					<li class="page-item"><a href="#" class="page-link"
						onclick="pageProc(${pageInfo.firstPage-1})" aria-label="Previous">
							<i class="ti-angle-left"></i>
					</a></li>
				</c:if>
	
				<c:forEach var="i" begin="${pageInfo.firstPage }" end="${pageInfo.lastPage}">
					<c:if test="${i==pageInfo.currentPage }">
					<li class="page-item active">
						<a href="#" class="page-link">${i}</a>
					</li>
					</c:if>
					<c:if test="${i!=pageInfo.currentPage }">
						<a href="#"  onclick="pageProc(${i})" class="page-link">${i}</a>
					</c:if>
				</c:forEach>
	
				<c:if test="${pageInfo.lastPage < pageInfo.totalPage }">
					<li class="page-item"><a href="#" class="page-link"
						onclick="pageProc(${pageInfo.lastPage+1})"> <i
							class="ti-angle-right"></i></a></li>
				</c:if>
			</ul>
		</nav>
	<!-- ??????????????? ??? -->
	</div>
	<form action="<c:url value='/mypageload/following'/>" name="frmSupport" method="post">
		<input type="hidden" name="currentPage"><br> 
	</form>
</div>
<script type="text/javascript">
	$(function(){
		
		$('#follow').click(function(){
			$('form').attr('action','<c:url value="/mypageload/AddFollow"/>');
			$('form').submit();
		});
		
		$('#unfollow').click(function(){
		var no = $('#followNo').val();
			$('form').attr('action',"<c:url value='/mypageload/unfollow?no="+no+"'/>");
			$('form').submit();
		});
		
	});
	
	function pageProc(curPage){
		$('input[name=currentPage]').val(curPage);
	 	$('form[name=frmSupport]').submit();	
	 }
</script>