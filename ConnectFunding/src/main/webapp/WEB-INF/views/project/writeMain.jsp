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
	.captionMain{
		align-items: center;
		padding-bottom: 50px;
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
									<div class="swiper-slide">
									<img src="<c:url value='/project_assets/swipe1.jpg'/>" style="width:100%;height:100%">
									??????
									</div>
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

	<div class="weekly2-news-area weekly2-pading gray-bg" style="padding-bottom: 0px;">
        <div class="container">
        	<div class="video-info">
                <div class="row captionMain">
                    <div class="col-lg-6">
                        <div class="video-caption">
                            <div class="bottom-caption">
                            	<h2>???????????????????????? <fmt:formatNumber value="${count }" pattern="#,###"/>?????? ????????????????????????.</h2>
		                        <p>
			                      	??????, ??????, ?????????, ??????, ??????, ??????, ?????? ??? ???
									????????? ??????????????? ?????????????????? ???????????? ?????????????????? ????????? <fmt:formatNumber value="${count }" pattern="#,###"/>?????? ?????? ???????????? ???????????? ????????? ???????????????.
				                    ?????????????????? ?????? ?????????.
			                    </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                    	<img src="<c:url value='/project_assets/projectMain1.jpg'/>" style="width:100%;height:100%">
                    </div>
                    <div style="text-align: center;margin-top:50px">
						<button class="btn btn-default" type="button" id="btWrite" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
							style="padding:25px 0px;">
							???????????? ????????????
						</button>
                	</div>
                </div>
            </div>
        </div>
        
        <div class="weekly2-news-area" style="background-color: #e9ffe1">
        <div class="container">
            <div class="weekly2-wrapper">
                <!-- section Tittle -->
                <div class="row" style="text-align: center;padding: 50px 0px 50px 0px">
                    <div class="col-lg-12">
                        <div class="section-tittle mb-30">
                        	<br>
							<h2>??????????????? ??????????????????!</h2>
		                    <p>
			                   	?????? ?????? ???????????? ????????? ????????? ??? ????????????.
								??????????????? ???????????? ?????????????????? ????????? ?????? ?????????????????? ???????????????.
			                </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>    
    </div>    

<%@ include file="../include/bottom.jsp" %>