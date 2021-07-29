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
							<a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab"
								href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">
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
							<div class="main" style="height: 600px; margin: 0 auto;">
								<div class="div_1">
									<div class="div_2">
										<img
											src="${pageContext.request.contextPath}/assets/img/ssong/human-resources.png"
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
						<div class="tab-pane fade" id="nav-profile" role="tabpanel"
							aria-labelledby="nav-profile-tab">
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
		
		$('#nav-home-tab').click(function(){
			$('#one').load('${pageContext.request.contextPath}/mypageload/following');
		});
		
		$('#nav-profile-tab').click(function(){
			$('#two').load('${pageContext.request.contextPath}/mypageload/following');
		});
		
		$('#nav-contact-tab').click(function(){
			$('#three').load('${pageContext.request.contextPath}/mypageload/following');
		});

	});//
</script>	
<%@ include file="../include/bottom.jsp"%>
