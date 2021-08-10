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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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

.prenext{
    list-style: none;
    padding: 0px;
    margin: 0px 0px 32px;
    width: 1000px;
}

.prenext li{
	display: flex;
    -webkit-box-align: center;
    align-items: center;
    width: 100%;
    height: 44px;
    letter-spacing: -0.015em;
    padding: 0px 16px;
    border-bottom: 1px solid rgb(230, 230, 230);
}
</style>
	<div class="single_sidebar_widget post_category_widget"
		style="width: 1200px; margin-left: 200px; background: white; height: auto; margin-top: 50px; min-height: 700px;">
		<a href="<c:url value='/notice/notice_tab'/>" style="color: black;">
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
							<form action="<c:url value='/notice/deleteNotice'/>" method="post" name="frmDelete">
							<input type="hidden" name="noticeFilename" value="${noticemap['NOTICE_FILENAME']}">
							<input type="hidden" name="noticeNo" value="${noticemap['NOTICE_NO']}">
							<div class="detail" >
									<div class="head">
										<header>
											<span class="hspan">${noticemap['NOTICE_CATEGORY']}</span>
											<h4>${noticemap['NOTICE_TITLE']}</h4>
											<span class="hspan" style="font-size: 0.8em;">
												<fmt:formatDate value="${noticemap['NOTICE_REGDATE']}" pattern="yyyy-MM-dd"/>
											</span>
										</header>
									</div>
									<div style="padding: 48px 44px 0px;">
										<p>${noticemap['NOTICE_CONTENT']}</p>
									</div>
									<div>
										<br>
										<c:if test="${!empty noticemap['NOTICE_FILENAME'] }">
										<img src="<c:url value='/project_assets/noticeImg/${noticemap["NOTICE_FILENAME"]}'/>"
											style="width: 900px; height: 80%; margin-left: 50px;">
										</c:if>
										<br><br><br>
									</div>
								</div><br>
								<c:choose>
								<c:when test="${empty noticemap['NEXT_NO']}">
									<div class="prenext">
										<ul>
											<li>
												<b>이전글</b>
												<a href="<c:url value='/notice/all_detail?noticeNo=${noticemap["PRE_NO"]}'/>"
													style="color: black;">
												<span style="margin-left: 15px; margin-top: 15px;">
												<strong>${noticemap['PRE_CATEGORY']}&nbsp ·&nbsp </strong> ${noticemap['PRE_TITLE']}</span>
												</a>
											</li>
										</ul>
										<br>
									</div>
								</c:when>
								<c:when test="${empty noticemap['PRE_NO']}">
									<div class="prenext">
										<ul>
											<li>
												<b>다음글</b>
												<a href="<c:url value='/notice/all_detail?noticeNo=${noticemap["NEXT_NO"]}'/>"
													style="color: black;">
												<span style="margin-left: 15px; margin-top: 15px;">
												<strong>${noticemap['NEXT_CATEGORY']}&nbsp ·&nbsp </strong> ${noticemap['NEXT_TITLE']}</span>
												</a>
											</li>
										</ul>
										<br>
									</div>
								</c:when>
								<c:otherwise>
									<div class="prenext">
										<ul>
											<li>
												<b>이전글</b>
												<a href="<c:url value='/notice/all_detail?noticeNo=${noticemap["PRE_NO"]}'/>"
													style="color: black;">
												<span style="margin-left: 15px; margin-top: 15px;">
												<strong>${noticemap['PRE_CATEGORY']}&nbsp ·&nbsp </strong> ${noticemap['PRE_TITLE']}</span>
												</a>
											</li>
											<li>
												<b>다음글</b>
												<a href="<c:url value='/notice/all_detail?noticeNo=${noticemap["NEXT_NO"]}'/>"
													style="color: black;">
												<span style="margin-left: 15px; margin-top: 15px;">
												<strong>${noticemap['NEXT_CATEGORY']}&nbsp ·&nbsp </strong> ${noticemap['NEXT_TITLE']}</span>
												</a>
											</li>
										</ul>
										<br>
									</div>
								</c:otherwise>
								</c:choose>
								<c:if test="${sessionScope.userEmail=='admin@cf' }">
									<div class="nfoot">
										<a href="<c:url value='/notice/notice_edit?noticeNo=${noticemap["NOTICE_NO"]}'/>" 
											class="genric-btn primary-border circle arrow">수정하기</a>
										<button type="submit" class="genric-btn primary-border circle arrow">삭제하기</button>
										<br><br><br>
									</div>
								</c:if>
								<c:if test="${sessionScope.userEmail!='admin@cf' }">
									<div class="nfoot">
									<a href="<c:url value='/notice/notice_tab'/>" style="margin-right: 450px;"
										class="genric-btn primary-border circle arrow" >목록보기</a><br><br><br><br>
									</div>	
								</c:if>
								</form>
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
			$('#one').load('${pageContext.request.contextPath}/notice/noticeAll');
		});
		
		$('#nav-notice-tab').click(function(){
			$('#two').load('${pageContext.request.contextPath}/notice/notices');
		});
		
		$('#nav-event-tab').click(function(){
			$('#three').load('${pageContext.request.contextPath}/notice/event');
		});
		
 		$('#nav-news-tab').click(function(){
			$('#four').load('${pageContext.request.contextPath}/notice/news');
		}); 
 		
 		$('form[name=frmDelete]').submit(function(){
 			if(!confirm('삭제하시겠습니까?')){
				event.preventDefault();
			}
 		});

	});//
</script>	
<%@ include file="../include/bottom.jsp"%>
