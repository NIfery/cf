<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		style="width: 1200px; margin-left: 200px; background: white; height: 700px; margin-top: 50px;">
		<span class="widget_title"
			style="text-align: left; font-size: 2.5em; margin-left: 10px;">알림</span>
		<br>
		<br>
		<br>
	
		<div>
			<div class="col-lg-9 col-md-9">
				<div class="properties__button">
					<!--Nav Button  -->
					<nav>
						<div class="nav nav-tabs" id="nav-tab" role="tablist">
							<a class="nav-item nav-link active" id="nav-activity-tab" data-toggle="tab" 
								href="#nav-activity" role="tab" aria-controls="nav-activity" aria-selected="true">
							활동</a>
							<a class="nav-item nav-link" id="nav-project-tab" data-toggle="tab"
								href="#nav-project" role="tab" aria-controls="nav-project" aria-selected="false">
							프로젝트</a>
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
						<div class="tab-pane fade show active" id="nav-activity"
							role="tabpanel" aria-labelledby="nav-activity-tab">
							<div class="whats-news-caption" id="activity">
							<div class="main" style="height: 600px; margin: 0 auto;">
								<div class="div_1">
									<div class="div_2">
										<img
											src="${pageContext.request.contextPath}/assets/img/ssong/notification-bell.png"
											style="width: 100px;">
									</div>
									<div>
										<br> <span style="font-size: 1.5em;">아직 후원하신 창작자가
											없습니다.</span> <br>
										<br> <a href="#" class="genric-btn primary-border circle"
											style="margin-left: 80px;">프로젝트 둘러보기</a>
									</div>
								</div>
							</div>
						</div>
						</div>
						<!-- Card two -->
						<div class="tab-pane fade" id="nav-project" role="tabpanel"
							aria-labelledby="nav-project-tab">
							<div class="whats-news-caption" id="project">
							<!-- 결과 -->
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
		
		$('#nav-activity-tab').click(function(){
			$('#activity').load('${pageContext.request.contextPath}/mypageload/notify');
		});
		
		$('#nav-project-tab').click(function(){
			$('#project').load('${pageContext.request.contextPath}/mypageload/notify');
		});
		
	});//
</script>	
<%@ include file="../include/bottom.jsp"%>
