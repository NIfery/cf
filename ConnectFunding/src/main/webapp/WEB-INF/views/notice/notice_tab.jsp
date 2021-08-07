<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/top.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="../_vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="../_vendor/prismjs/themes/prism-okaidia.css">
<link rel="stylesheet" href="../_assets/css/custom.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/ssong.css">
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
		style="width: 1200px; margin-left: 200px; background: white; height: 1000px; margin-top: 50px;">
		<span class="widget_title"
			style="text-align: left; font-size: 2.5em; margin-left: 10px;">공지사항</span>
		<br>
		<br>
		<br>
	
		<div>
			<div class="col-lg-9 col-md-9">
				<div class="properties__button">
					<!--Nav Button  -->
					<nav>
						<div class="nav nav-tabs" id="nav-tab" role="tablist">
							<a class="nav-item nav-link active" id="nav-notice-tab" data-toggle="tab" 
								href="#nav-notice" role="tab" aria-controls="nav-notice" aria-selected="true">
							공지사항</a>
							<a class="nav-item nav-link" id="nav-event-tab" data-toggle="tab"
								href="#nav-event" role="tab" aria-controls="nav-event" aria-selected="false">
							이벤트</a>
							<a class="nav-item nav-link" id="nav-news-tab" data-toggle="tab" href="#nav-news"
								role="tab" aria-controls="nav-news" aria-selected="false">
							보도자료</a>
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
						<div class="tab-pane fade show active" id="nav-notice"
							role="tabpanel" aria-labelledby="nav-notice-tab">
							<div class="whats-news-caption" id="one">
								<div>
								<c:if test="${!empty noticelist }">
									<c:forEach var="noticeVo" items="${noticelist }">
										<div class="wrap" style="height: 120px; width: 900px; margin-top: 10px;">
											<div class="trand-right-single d-flex">
												<div class="trand-right-cap"
													style="margin: 15px 25px; width: 600px;">
													<span class="color2">${noticeVo.noticeCategory }</span>
													<br>
													<div style="margin-top: 10px; margin-bottom: 10px;">
													<span class="color1" >
														<a href="<c:url value='/notice/notice_detail?noticeNo=${noticeVo.noticeNo }'/>"
															style="color: black;"> 
														${noticeVo.noticeTitle}
														</a>
													</span><br> 
													</div>
													<span class="color2" style="font-size: 0.8em;">
														<fmt:formatDate value="${noticeVo.noticeRegdate }" pattern="yyyy-MM-dd"/>
													</span>
													<c:if test="${empty noticeVo.noticeFilename}">
														<img src="<c:url value='/assets/img/logo/logo.png'/>"
															style="width: 150px; margin: -80px 0px 0px 700px; display: flex;">
													</c:if>
													<c:if test="${!empty noticeVo.noticeFilename}">
														<img src="<c:url value='/assets/img/notice/${noticeVo.noticeFilename }'/>"
															style="width: 150px; margin: -104px 0px 0px 700px; display: flex; border-radius: 20px;">
													</c:if>
												</div>
											</div>
										</div>
									</c:forEach>
								</c:if>
								<br>
									<a href="<c:url value='/notice/notice_write'/>" style="float: right; margin-right: 300px;"
										class="genric-btn primary-border circle arrow">등록하기</a>
								</div>
							</div>
						</div>
						<!-- Card two -->
						<div class="tab-pane fade" id="nav-event" role="tabpanel"
							aria-labelledby="nav-event-tab">
							<div class="whats-news-caption" id="two">
							</div>
						</div>
						<!-- Card three -->
						<div class="tab-pane fade" id="nav-news" role="tabpanel"
							aria-labelledby="nav-cnews-tab">
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
		
		$('#nav-noitce-tab').click(function(){
			$('#one').load('${pageContext.request.contextPath}/notice/notice_tab');
		});
		
		$('#nav-event-tab').click(function(){
			$('#two').load('${pageContext.request.contextPath}/notice/event');
		});
		
 		$('#nav-news-tab').click(function(){
			$('#three').load('${pageContext.request.contextPath}/notice/news');
		}); 

	});//

</script>	
<%@ include file="../include/bottom.jsp"%>
