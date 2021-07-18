<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/top.jsp" %>
<!-- swiper -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" />
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
		
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<script type="text/javascript" src="<c:url value='/assets/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(function() {

	});
</script>

<style type="text/css">
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
	<div class="weekly2-news-area weekly2-pading gray-bg">
        <div class="container">
            <div class="weekly2-wrapper">
                <!-- section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle mb-30 divWriteSecondFirst">
							<div>
							
    						</div>
    						<div>
    						
    						</div>
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