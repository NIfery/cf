<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../inc/adminTop.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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

.page-link{
	background-color: white;
}

a{
	color: #2035ad;
}
</style>
	<div class="single_sidebar_widget post_category_widget"
		style="background: white; height: auto; margin-top: 50px; overflow: hidden;">
		<a href="<c:url value='/admin_notice/notice_tab'/>" style="color: black;">
		<span class="widget_title"
			style="text-align: left; font-size: 2.5em; margin-left: 10px;">공지사항</span>
		</a>
		<br>
		<br>
		<br>
	
		<div>
			<div class="col-lg-9 col-md-9">
				<div class="properties__button">
					<!--Nav Button  -->
					<nav>
						<div class="nav nav-tabs" id="nav-tab" role="tablist">
							<a class="nav-item nav-link active" id="nav-all-tab" data-toggle="tab" 
								href="#nav-all" role="tab" aria-controls="nav-all" aria-selected="true">
							전체보기</a>
							<a class="nav-item nav-link" id="nav-notice-tab" data-toggle="tab"
								href="#nav-notice" role="tab" aria-controls="nav-notice" aria-selected="false">
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
						<div class="tab-pane fade show active" id="nav-all"
							role="tabpanel" aria-labelledby="nav-all-tab">
							<div class="whats-news-caption" id="one">
							<div>
								<c:if test="${!empty allList }">
									<c:forEach var="noticeVo" items="${allList }">
										<div class="wrap" style="height: 130px; width: 1000px; margin-top: 10px;">
											<div class="trand-right-single d-flex">
												<div class="trand-right-cap"
													style="margin: 15px 25px; width: 800px;">
													<span class="color2">${noticeVo.noticeCategory }</span>
													<br>
													<div style="margin-top: 10px; margin-bottom: 10px;">
													<span class="color1" >
														<a href="<c:url value='/admin_notice/all_detail?noticeNo=${noticeVo.noticeNo }'/>"
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
														<img src="<c:url value='/project_assets/noticeImg/${noticeVo.noticeFilename }'/>"
															style="width: 150px; margin: -104px 0px 0px 700px; display: flex; border-radius: 20px;">
													</c:if>
												</div>
											</div>
										</div>
									</c:forEach>
								</c:if>
								<br>
								<c:if test="${sessionScope.adminPosition=='ADMIN'}">
									<a href="<c:url value='/admin_notice/notice_write'/>" style="float: left; margin-right: 300px;"
										class="genric-btn primary-border circle arrow">등록하기</a><br><br>
								</c:if>
								<!-- 페이징처리 -->
								<div style="margin-right: 300px;">
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
								</div>
								<form action="<c:url value='/admin_notice/notice_tab'/>" name="frmSearch" method="post">
								<span class="d-flex" style="margin-left: 340px; margin-top: 20px;">
									<input type="text" class="form-control" placeholder="검색어를 입력해주세요."
										name="noticeTitle" value="${noticeVo.noticeTitle}" style="width: 250px;">
									<button class="btns" type="submit" style="background: none; border: 1px; color: black;">
										<i class="fas fa-search special-tag"></i>
									</button>
								</span>
								</form>
								<form action="<c:url value='/admin_notice/notice_tab'/>" name="frmSupport" method="post">
									<input type="hidden" name="currentPage"><br> 
									<input type="hidden" name="noticeTitle" value="${noticeVo.noticeTitle}"><br>
								</form>
								</div>
							</div>
						</div>
						<!-- card two -->
						<div class="tab-pane fade=" id="nav-notice"
							role="tabpanel" aria-labelledby="nav-notice-tab">
							<div class="whats-news-caption" id="two">
							<!-- 내용 -->	
							</div>
						</div>
						<!-- Card three -->
						<div class="tab-pane fade" id="nav-event" role="tabpanel"
							aria-labelledby="nav-event-tab">
							<div class="whats-news-caption" id="three">
							<!-- 내용 -->
							</div>
						</div>
						<!-- Card four -->
						<div class="tab-pane fade" id="nav-news" role="tabpanel"
							aria-labelledby="nav-news-tab">
							<div class="whats-news-caption" id="four">
							<!-- 내용 -->
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
		
		$('#nav-all-tab').click(function(){
			$('#one').load('${pageContext.request.contextPath}/admin_notice/noticeAll');
		});
		
		$('#nav-notice-tab').click(function(){
			$('#two').load('${pageContext.request.contextPath}/admin_notice/notices');
		});
		
		$('#nav-event-tab').click(function(){
			$('#three').load('${pageContext.request.contextPath}/admin_notice/event');
		});
		
 		$('#nav-news-tab').click(function(){
			$('#four').load('${pageContext.request.contextPath}/admin_notice/news');
		}); 
 		

	});//

 		function pageProc(curPage){
 		   $('input[name=currentPage]').val(curPage);
 		   $('form[name=frmSupport]').submit();   
 		}
</script>	
<%@ include file="../inc/adminBottom.jsp"%>