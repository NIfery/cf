<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/top.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="../_vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="../_vendor/prismjs/themes/prism-okaidia.css">
<link rel="stylesheet" href="../_assets/css/custom.min.css">
<title>마이페이지</title>
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

.genric-btn.primary-border {
    color: #9a9a9a;
    border: 1px solid #9a9a9a;
    background: #fff;
}
</style>
	<div class="single_sidebar_widget post_category_widget"
		style="width: 1200px; margin-left: 200px; background: white; height: 780px; margin-top: 50px;">
		<span class="widget_title"
			style="text-align: left; font-size: 2.5em; margin-left: 10px;">팔로우</span>
		<br>
		<br>
		<br>
	
		<div>
			<div class="col-lg-9 col-md-9">
				<div class="properties__button">
					<!--Nav Button  -->
					<nav>
						<div class="nav nav-tabs" id="nav-tab" role="tablist">
							<a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" 
								href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">
							후원한 창작자</a>
							<a class="nav-item nav-link" id="nav-following-tab" data-toggle="tab"
								href="#nav-following" role="tab" aria-controls="nav-following" aria-selected="false">
							팔로잉</a>
							<a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact"
								role="tab" aria-controls="nav-contact" aria-selected="false">
							팔로워</a>
						</div>
					</nav>
					<!--End Nav Button  -->
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<!-- Nav Card -->
					<div class="tab-content" id="nav-tabContent">
						<!-- card one -->
						<div class="tab-pane fade show active" id="nav-home"
							role="tabpanel" aria-labelledby="nav-home-tab">
							<div class="whats-news-caption" id="one">
								<div>
								<c:if test="${empty list }">
								<div class="main" style="height: 600px; margin: 0 auto;">
									<div class="div_1">
										<div class="div_2">
											<img
												src="${pageContext.request.contextPath}/assets/img/ssong/users.png"
												style="width: 100px;">
										</div>
										<div>
											<br> <span style="font-size: 1.5em;">아직 후원하신 창작자가 없습니다.</span>
											<br> <br> <a href="#"
												class="genric-btn primary-border circle"
												style="margin-left: 90px;">프로젝트 둘러보기</a>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${!empty list }">
								<c:forEach var="map" items="${list }">
									<form method="post" action="<c:url value='/mypageload/AddFollow'/>">
										<input type="hidden" name="following" value="${map['USER_NAME'] }">
										<input type="hidden" id="followingUserNo" name="followingUserNo" value="${map['USER_NO'] }"> 
										<input type="hidden" name="userNo" value="${sessionScope.userNo}">
										<div class="wrap"
											style="height: 130px; width: 800px; margin-top: 20px; border-bottom: 1px solid #f0f2f3">
											<div class="trand-right-single d-flex">
												<div class="trand-right-img">
													<c:if test="${empty map['USER_PROFILE'] }">
														<img src="<c:url value='/assets/img/logo/user.png'/>"
															style="width: 80px; height: 70px; margin: 40px 13px;">
													</c:if>
													<c:if test="${!empty map['USER_PROFILE'] }">
														<div class="profile" style="margin: 30px 20px;">
															<img
																src="<c:url value='/profile_img/${map["USER_PROFILE"] }'/>"
																style="width: 70px; height: 70px;">
														</div>
													</c:if>
												</div>
												<div class="trand-right-cap"
													style="margin: 15px 25px; width: 470px;">
													<span class="color1">
														<p style="font-size: 1.1em;">
															<strong>${map['USER_NAME'] }</strong>
															<strong>${map['FOLLOW_CHECK'] }</strong>
														</p>
													</span>
													<c:if test="${!empty map['USER_INTRO'] }">
														<span style="color: black;">${map['USER_INTRO'] }</span>
														<br>
													</c:if>
													<span style="font-size: 0.9em;" class="count"></span>
												</div>
												<div class="followw" style="display: block;">
													<button class="genric-btn info-border circle arrow" id="followw"
														style="width: 110px; height: 40px; margin: 40px 0px 0px 40px;">+ 팔로우</button>
												<!-- <input type="submit" class="genric-btn info circle" id="followcheck"
													style="width: 110px; height: 40px; margin: 40px 0px 0px 30px;"
													value="팔로우"> -->
												</div>
												<div class="unfolloww" style="display: none;" >
													<button class="genric-btn info circle" id="unfolloww"
														style="width: 110px; height: 40px; margin: 40px 0px 0px 40px;">√ 팔로잉</button>	
												</div>
											</div>
										</div>
									</form>
								</c:forEach>
							</c:if>
							</div>
							</div>
						</div>
						<!-- Card two -->
						<div class="tab-pane fade" id="nav-following" role="tabpanel"
							aria-labelledby="nav-following-tab">
							<div class="whats-news-caption" id="two">
							</div>
						</div>
						<!-- Card three -->
						<div class="tab-pane fade" id="nav-contact" role="tabpanel"
							aria-labelledby="nav-contact-tab">
							<div class="whats-news-caption" id="three">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--  -->
	</div>

<script type="text/javascript">
	$(document).ready(function(){
		
		/* $('#nav-home-tab').click(function(){
			$('#one').load('${pageContext.request.contextPath}/mypageload/creators');
		}); */
		
		$('#nav-following-tab').click(function(){
			$('#two').load('${pageContext.request.contextPath}/mypageload/following');
		});
		
 		$('#nav-contact-tab').click(function(){
			$('#three').load('${pageContext.request.contextPath}/mypageload/followers');
		}); 

	});//

	$(function(){
		$('#followw').click(function(){
			var data = $('#followingUserNo').val();
			$.ajax({
				url:"<c:url value='/mypageload/checkFollow'/>",
				type:"post",
				data:"followingUserNo="+data,
				success:function(ress){
					alert(ress);
					var result="";
					if(ress){
						result="안녕";
					    $('.followw').css('display', 'none');
					    $('.unfolloww').css('display', 'block');
					}else {
						result="바보";
					    $('.followw').css('display', 'block');
					    $('.unfolloww').css('display', 'none');
					}
					alert(result);
				},
				error:function(xhr, status, error){
					alert("error 발생..." + error);
				}
			});
		});
	}); 
</script>	
<%@ include file="../include/bottom.jsp"%>
