<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/top.jsp" %>
<!-- swiper -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" />
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
		
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<script type="text/javascript" src="<c:url value='/assets/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(function() {
		const swiper = new Swiper('.swiper-container', {
			// Optional parameters
			direction : 'horizontal',
			loop : true,
	
			// If we need pagination
			pagination : {
				el : '.swiper-pagination',
				clickable: true,
			},
	
			autoplay: {
				delay: 3000,
				disableOnInteraction : false,
			},
		});
		
		$('#btWrite').click(function(){
			location.href="<c:url value='/project/writeCategory'/>";
		});
	});
</script>

<style type="text/css">
	.swiper-container {
		border: 1px solid black;
		width: 80%;
		height: 500px;
	}
	.divWriteSecondFirst{
		position: relative;
 		left: 15%;
	}
	.btn{
		background: white;
		color: #6c757d;
		border: 1px solid #6c757d;
		min-width: 150px;
		padding: 10px 0px;
	}
	.btn::before{
		background: #6c757d;
		color: white;
	}
</style>
	<div id="divWriteFirst">
		<div class="weekly-news-area pt-50">
	        <div class="container">
	           <div class="weekly-wrapper">
	                <!-- section Tittle -->
	                <div class="row">
	                    <div class="col-lg-12">
	                    
	                    	<!-- Slider main container -->
							<div class="swiper-container">
								<!-- Additional required wrapper -->
								<div class="swiper-wrapper">
									<!-- Slides -->
									<div class="swiper-slide"><img src="<c:url value='/project_assets/swipe1.jpg'/>" style="width:100%;height:100%"></div>
									<div class="swiper-slide"><img src="<c:url value='/project_assets/swipe2.jpg'/>" style="width:100%;height:100%"></div>
									<div class="swiper-slide"><img src="<c:url value='/project_assets/swipe3.jpg'/>" style="width:100%;height:100%"></div>
								</div>
								<!-- If we need pagination -->
								<div class="swiper-pagination"></div>
							</div>
							
	                    </div>
	                </div>
	                
	           </div>
	        </div>
	    </div>      
    </div>      

	<div class="weekly2-news-area weekly2-pading gray-bg">
        <div class="container">
            <div class="weekly2-wrapper">
                <!-- section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle mb-30 divWriteSecondFirst">
    						<div>
    							커넥트펀딩에서는 <fmt:formatNumber value="${count }" pattern="#,###"/>개의 프로젝트있습니다.
    						</div>
    						<div>
								게임, 공연, 디자인, 만화, 예술, 공예, 사진 등 …
								수많은 창작자들의 프로젝트들이 올라오는 커넥트펀딩은 지금껏 <fmt:formatNumber value="${count }" pattern="#,###"/>개가 넘는 창조적인 시도들이 세상에 나왔습니다.
	                            커넥트펀딩과 함께 하세요.
    						</div>
                        </div>
    					<div style="text-align: center">
							<button class="btn btn-default" type="button" id="btWrite" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
								style="padding:12px 0px;">
								프로젝트 시작하기
							</button>
						</div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-12">
                        <div class="dot-style d-flex dot-style">
			                1-1
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="container">
            <div class="weekly2-wrapper">
                <!-- section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle mb-30">
                        <br><br>
                        2
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="dot-style d-flex dot-style">
                            2-1
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>    

<%@ include file="../include/bottom.jsp" %>