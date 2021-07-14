<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>ConnectFunding </title>
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
			.dropdown{
				float: left;
				width:150px;
				margin-right:1%;
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
			hr {
				border-bottom: 5px solid #eceff8;
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
                                    <a href="index.html">
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
                                            <li><a href="/index">Home</a></li>
                                            <li><a href="#">Category</a></li>
                                            <li><a href="#">About</a></li>
                                            <li><a href="#">로그인</a></li>
                                            <li><a href="#">회원가입</a></li>
                                            <li><a href="#">
                                            	<img src="${pageContext.request.contextPath}/assets/img/logo/user.png" 
                                            		alt="로그인" style="width: 40px;" >
                                            	</a>
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

    <!--   Weekly-News start -->
    <div class="weekly-news-area pt-50">
        <div class="container">
           <div class="weekly-wrapper">
                <!-- section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                    	<div class="dropdown">
						  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    카테고리
						  </button>
						  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						    <a class="dropdown-item" href="#">Action</a>
						    <a class="dropdown-item" href="#">Another action</a>
						    <a class="dropdown-item" href="#">Something else here</a>
						  </div>
						</div>
						<div class="dropdown">
						  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    상태
						  </button>
						  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						    <a class="dropdown-item" href="#">Action</a>
						    <a class="dropdown-item" href="#">Another action</a>
						    <a class="dropdown-item" href="#">Something else here</a>
						  </div>
						</div>
						<div class="dropdown">
						  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    달성률
						  </button>
						  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						    <a class="dropdown-item" href="#">Action</a>
						    <a class="dropdown-item" href="#">Another action</a>
						    <a class="dropdown-item" href="#">Something else here</a>
						  </div>
						</div>
						<div class="dropdown">
						  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    모인금액
						  </button>
						  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						    <a class="dropdown-item" href="#">Action</a>
						    <a class="dropdown-item" href="#">Another action</a>
						    <a class="dropdown-item" href="#">Something else here</a>
						  </div>
						</div>
						<div class="dropdown" style="float:right;padding:3px;">
						  <button class="btn btn-secondary" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
						  	style="padding:12px 0px;">
						    초기화
						  </button>
						</div>
                    </div>
                </div>
                
           </div>
        </div>
    </div>           
    <!-- End Weekly-News -->

    <!--   Weekly2-News start -->
    <div class="weekly2-news-area  weekly2-pading gray-bg">
        <div class="container">
            <div class="weekly2-wrapper">
                <!-- section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle mb-30">

						<c:if test="${empty list }">
                            <h3><span style="color:red">0</span>개의 프로젝트가 있습니다.</h3>
                        </c:if>    
						<c:if test="${!empty list }">
                            <h3><span style="color:red">${list.size() }</span>개의 프로젝트가 있습니다.</h3>
                        </c:if>    
                            
                        </div>
                    </div>
                </div>
                
                
                <!-- 한 페이지에 보여줄 레코드 수 8 예정 -->
                
                
                <div class="row">
                    <div class="col-12">
                        <div class="dot-style d-flex dot-style">
			                <c:if test="${empty list }">
			                	데이터가 없습니다.
			                </c:if>
			                <c:if test="${!empty list }">
			                	<c:forEach var="vo" items="${list }" begin="0" end="3">
			                		<div class="weekly2-single" style="width:24%">
		                                <div class="weekly2-img">
		                                    <img src="${pageContext.request.contextPath}/project_assets/${vo.projectImage}"
		                                    	<%-- style="width:263px; height:170px" --%>
		                                    	>
		                                </div>
		                                <div class="weekly2-caption">
		                                    <span></span>
		                                    <h4><a href="#">${vo.projectName}</a></h4>
		                                    <p><fmt:formatDate value="${vo.projectStartdate }" pattern="yyyy-MM-dd"/></p>
		                                    <h4><a href="#">${vo.projectSummary }</a></h4>
		                                    <hr style="margin:5px 0px 8px 0px;">
		                                    <%-- <h6><fmt:formatNumber value="${vo.totalFundingAmount }" pattern="#,###"/> 원</h6> --%>
		                                    <h6 style="color:red">${vo.totalFundingAmount/vo.totalAmount*100 }% 달성</h6>
		                                </div>
		                            </div> 
			                	</c:forEach>
			               </c:if>
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
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="dot-style d-flex dot-style">
                            <c:if test="${!empty list }">
                            <c:forEach var="vo" items="${list }" begin="4">
			                	<div class="weekly2-single" style="width:24%">
		                               <div class="weekly2-img">
		                                   <img src="${pageContext.request.contextPath}/project_assets/${vo.projectImage}"
		                                   	<%-- style="width:263px; height:170px" --%>
		                                   	>
		                               </div>
		                               <div class="weekly2-caption">
		                                   <span></span>
		                                   <h4><a href="#">${vo.projectName}</a></h4>
		                                   <p><fmt:formatDate value="${vo.projectStartdate }" pattern="yyyy-MM-dd"/></p>
		                                   <h4><a href="#">${vo.projectSummary }</a></h4>
		                                   <hr style="margin:5px 0px 8px 0px;">
		                                   <%-- <h6><fmt:formatNumber value="${vo.totalFundingAmount }" pattern="#,###"/> 원</h6> --%>
		                                   <h6 style="color:red">${vo.totalFundingAmount/vo.totalAmount*100 }% 달성</h6>
		                               </div>
		                           </div> 
			                </c:forEach>
	                        </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>           
    <!-- End Weekly-News -->

    <!--  Recent Articles start -->
    <%-- <div class="recent-articles">
        <div class="container">
           <div class="recent-wrapper">
                <!-- section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle mb-30">
                            <h3>Recent Articles</h3>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="recent-active dot-style d-flex dot-style">
                            <div class="single-recent mb-100">
                                <div class="what-img">
                                    <img src="${pageContext.request.contextPath}/assets/img/news/recent1.jpg" alt="">
                                </div>
                                <div class="what-cap">
                                    <span class="color1">Night party</span>
                                    <h4><a href="#">Welcome To The Best Model  Winner Contest</a></h4>
                                </div>
                            </div>
                            <div class="single-recent mb-100">
                                <div class="what-img">
                                    <img src="${pageContext.request.contextPath}/assets/img/news/recent2.jpg" alt="">
                                </div>
                                <div class="what-cap">
                                    <span class="color1">Night party</span>
                                    <h4><a href="#">Welcome To The Best Model  Winner Contest</a></h4>
                                </div>
                            </div>
                            <div class="single-recent mb-100">
                                <div class="what-img">
                                    <img src="${pageContext.request.contextPath}/assets/img/news/recent3.jpg" alt="">
                                </div>
                                <div class="what-cap">
                                    <span class="color1">Night party</span>
                                    <h4><a href="#">Welcome To The Best Model  Winner Contest</a></h4>
                                </div>
                            </div>
                            <div class="single-recent mb-100">
                                <div class="what-img">
                                    <img src="${pageContext.request.contextPath}/assets/img/news/recent2.jpg" alt="">
                                </div>
                                <div class="what-cap">
                                    <span class="color1">Night party</span>
                                    <h4><a href="#">Welcome To The Best Model  Winner Contest</a></h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
           </div>
        </div>
    </div>            --%>
    <!--Recent Articles End -->
   
    </main>
    
   <footer>
       <!-- footer-bottom aera -->
       <div class="footer-bottom-area">
           <div class="container">
               <div class="footer-border">
                    <div class="row d-flex align-items-center justify-content-between">
                        <div class="col-lg-6">
                            <div class="footer-copy-right">
                                <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="ti-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="footer-menu f-right">
                                <ul>                             
                                    <li><a href="#">Terms of use</a></li>
                                    <li><a href="#">Privacy Policy</a></li>
                                    <li><a href="#">Contact</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
               </div>
           </div>
       </div>
       <!-- Footer End-->
   </footer>
   
	<!-- JS here -->
	
		<!-- All JS Custom Plugins Link Here here -->
        <script src="${pageContext.request.contextPath}/assets/js/vendor/modernizr-3.5.0.min.js"></script>
		<!-- Jquery, Popper, Bootstrap -->
		<script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	    <!-- Jquery Mobile Menu -->
        <script src="${pageContext.request.contextPath}/assets/js/jquery.slicknav.min.js"></script>

		<!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="${pageContext.request.contextPath}/assets/js/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/slick.min.js"></script>
        <!-- Date Picker -->
        <script src="${pageContext.request.contextPath}/assets/js/gijgo.min.js"></script>
		<!-- One Page, Animated-HeadLin -->
        <script src="${pageContext.request.contextPath}/assets/js/wow.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/animated.headline.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery.magnific-popup.js"></script>

        <!-- Breaking New Pluging -->
        <script src="${pageContext.request.contextPath}/assets/js/jquery.ticker.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/site.js"></script>

		<!-- Scrollup, nice-select, sticky -->
        <script src="${pageContext.request.contextPath}/assets/js/jquery.scrollUp.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery.nice-select.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/jquery.sticky.js"></script>
        
        <!-- contact js -->
        <script src="${pageContext.request.contextPath}/assets/js/contact.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery.form.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery.validate.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/mail-script.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery.ajaxchimp.min.js"></script>
        
		<!-- Jquery Plugins, main Jquery -->	
        <script src="${pageContext.request.contextPath}/assets/js/plugins.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
        
    </body>
</html>