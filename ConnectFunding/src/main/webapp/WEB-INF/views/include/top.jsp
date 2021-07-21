<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>★ Connect Funding ★</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="manifest" href="site.webmanifest">
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
<style type="text/css">
	a{
		text-decoration: none !important;		
	}
	
	.genric-btn.warning {
    color: #787483;
    font-size: 1.1em;
    background: #f4e700;
    border: 1px solid transparent;
    }

	.btn {
    background: #ff656a;
    -moz-user-select: none;
    text-transform: uppercase;
    color: #fff;
    cursor: pointer;
    display: inline-block;
    font-size: 14px;
    font-weight: 500;
    letter-spacing: 1px;
    line-height: 0;
    margin-bottom: 0;
    padding: 27px 44px;
    border-radius: 5px;
    min-width: 20px; 
    margin: 10px;
    cursor: pointer;
    transition: color 0.4s linear;
    position: relative;
    z-index: 1;
    border: 0;
    overflow: hidden;
    margin: 0;
}

</style>   
   </head>

   <body>
       
    <!-- Preloader Start -->
    <!-- <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="${pageContext.request.contextPath}/assets/img/logo/logo.png" alt="">
                </div>
            </div>
        </div>
    </div> -->
    <!-- Preloader Start -->

    <header>
        <!-- Header Start -->
       <div class="header-area">
            <div class="main-header ">
                <div class="header-mid d-none d-md-block">
                   <div class="container">
                        <div class="row d-flex align-items-center">
                            <!-- Logo -->
                            <div class="col-xl-3 col-lg-3 col-md-3">
                                <div class="logo">
                                    <a href="<c:url value='/'/>">
                                    <img src="${pageContext.request.contextPath}/assets/img/logo/logo.png" alt="로고"></a>
                                </div>
                            </div>
                        </div>
                   </div>
                </div>
               <div class="header-bottom header-sticky">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-xl-10 col-lg-10 col-md-12 header-flex">
                                <!-- sticky -->
                                    <div class="sticky-logo">
                                        <a href="index.html"><img src="${pageContext.request.contextPath}/assets/img/logo/logo.png" alt=""></a>
                                    </div>
                                <!-- Main-menu -->
                                <div class="main-menu d-none d-md-block">
                                    <nav>                  
                                        <ul id="navigation">    
                                            <li><a href="<c:url value='/'/>">Home</a></li>
                                            <li><a href="#">Category</a></li>
                                            <li><a href="<c:url value='/board/List'/>">게시판</a></li>
                                          <c:if test="${empty sessionScope.userName}">
	                                            <li><a href="<c:url value='/cfmember/cfLogin'/>">로그인</a></li>
	                                            <li><a href="<c:url value='/cfmember/register'/>">회원가입</a></li>
	                                            <li><a href="<c:url value='/cfmember/mypage'/>">
	                                            	<img src="${pageContext.request.contextPath}/assets/img/logo/user.png" 
	                                            		alt="로그인" style="width: 40px;" >
	                                            	</a>
	                                            </li>
                                            </c:if>
                                            <c:if test="${!empty sessionScope.userName}">
                                            	<li><a href="<c:url value='/cfmember/cfLogout'/>">로그아웃</a></li>
                                            	<li><span>${sessionScope.userName}</span></li>
	                                            <li><a href="<c:url value='/cfmember/mypage'/>">
	                                            	<img src="${pageContext.request.contextPath}/assets/img/logo/user.png" 
	                                            		alt="로그인" style="width: 40px;" >
	                                            	</a>
	                                            </li>
                                            </c:if>
                                               <!--  <ul class="submenu">
                                                    <li><a href="#">Element</a></li>
                                                    <li><a href="#">Blog</a></li>
                                                    <li><a href="#">Blog Details</a></li>
                                                    <li><a href="#">Categori Details</a></li>
                                                </ul> -->
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>             
                            <div class="col-xl-2 col-lg-2 col-md-4">
                                <div class="header-right-btn f-right d-none d-lg-block">
                                    <i class="fas fa-search special-tag"></i>
                                    <div class="search-box">
                                        <form action="#">
                                            <input type="text" placeholder="Search">
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- Mobile Menu -->
                            <div class="col-12">
                                <div class="mobile_menu d-block d-md-none"></div>
                            </div>
                        </div>
                    </div>
               </div>
            </div>
       </div>
        <!-- Header End -->
    </header>

    <main>