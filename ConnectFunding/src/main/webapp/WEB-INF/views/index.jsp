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
                  		<!-- swiper -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" />
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
		
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
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
a {
   text-decoration: none !important;
}
.swiper-container {
		width: 90%;
		height: 500px;
	}
</style>
<script type="text/javascript" src="<c:url value='/assets/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
   $(function(){
      $.ajax({
         url:"<c:url value='/project/cancleAll'/>",
         type:"get",
         success:function(res){
         
         },error:function(xhr, status, error){
            alert("Error 발생 : " + error);
         }
      });
      
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
   })
</script>
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
                                        <a href="<c:url value='/'/>"><img src="${pageContext.request.contextPath}/assets/img/logo/logo.png" alt=""></a>
                                    </div>
                                <!-- Main-menu -->
                                <div class="main-menu d-none d-md-block">
                                    <nav>                  
                                        <ul id="navigation">    
                                            <li><a href="<c:url value='/'/>">Home</a></li>
                                            <li><a href="<c:url value='/project/list'/>">프로젝트</a></li>
                                    <li><a href="<c:url value='/board/List'/>">게시판</a></li>         
                                    <li><a href="<c:url value='/notice/notice_tab'/>">공지사항</a></li>         
                                            <c:if test="${empty sessionScope.userName}">
                                               <li><a href="<c:url value='/cfmember/cfLogin'/>">로그인</a></li>
                                               <li><a href="<c:url value='/cfmember/register'/>">회원가입</a></li>
                                               <li><a href="<c:url value='/cfmember/cfLogin'/>">
                                                  <img src="${pageContext.request.contextPath}/assets/img/logo/user.png" 
                                                  <%-- <img src="${pageContext.request.contextPath}/assets/img/${sessionScope.userName}.png" --%> 
                                                     alt="로그인" style="width: 40px;">
                                                  </a>
                                               </li>
                                            </c:if>
                                            <c:if test="${!empty sessionScope.userName}">
                                               <li><a href="<c:url value='/cfmember/cfLogout'/>">로그아웃</a></li>
                                               <li><span>${sessionScope.userName}</span></li>
                                               <li><a href="<c:url value='/cfmember/mypage'/>">
                                                  <c:if test="${!empty sessionScope.userProfile }">
                                                     <img src="${pageContext.request.contextPath}/profile_img/${sessionScope.userProfile}" 
                                                        style="width: 50px;" >
                                                  </c:if>
                                                  <c:if test="${empty sessionScope.userProfile }">
                                                     <img src="${pageContext.request.contextPath}/assets/img/logo/user.png" 
                                                     alt="로그인" style="width: 40px;">
                                                  </c:if>
                                                  </a>
                                               </li>
                                            </c:if>
                                               <!--  <ul class="submenu">
                                                    <li><a href="#">Element</a></li>
                                                    <li><a href="#">Blog</a></li>
                                                    <li><a href="#">Blog Details</a></li>
                                                    <li><a href="#">Categori Details</a></li>
                                                </ul> -->
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
									<img src="<c:url value='/project_assets/back1.jpg'/>" style="width:100%;height:100%">
									</div>
									<div class="swiper-slide"><img src="<c:url value='/project_assets/back2.jpg'/>" style="width:100%;height:100%"></div>
									<div class="swiper-slide"><img src="<c:url value='/project_assets/back3.jpg'/>" style="width:100%;height:100%"></div>
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

	<div style="margin-top: 50px; margin-left: 220px;">
	<h3>주목할 만한 프로젝트</h3>
	</div>
	<section>
	<c:import url="/project/randomListMain"></c:import>
	</section>
	<section>
	<c:import url="/project/randomListMain"></c:import>
	</section>
	<div style="margin-top: 100px; margin-left: 220px;">
	<h3>공개예정 프로젝트</h3>
	</div>
	<section>
	<c:import url="/project/planList"></c:import>
	</section>
	<section>
	<c:import url="/project/planList"></c:import>
	</section>
	<div style="margin-top: 100px;">
	</div>
   
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
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | Connect Funding &nbsp<i class="ti-heart" aria-hidden="true"></i></a>
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
        <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
      <!-- Jquery, Popper, Bootstrap -->
      <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
       <!-- Jquery Mobile Menu -->
        <script src="./assets/js/jquery.slicknav.min.js"></script>

      <!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="./assets/js/owl.carousel.min.js"></script>
        <script src="./assets/js/slick.min.js"></script>
        <!-- Date Picker -->
        <script src="./assets/js/gijgo.min.js"></script>
      <!-- One Page, Animated-HeadLin -->
        <script src="./assets/js/wow.min.js"></script>
      <script src="./assets/js/animated.headline.js"></script>
        <script src="./assets/js/jquery.magnific-popup.js"></script>

        <!-- Breaking New Pluging -->
        <script src="./assets/js/jquery.ticker.js"></script>
        <script src="./assets/js/site.js"></script>

      <!-- Scrollup, nice-select, sticky -->
        <script src="./assets/js/jquery.scrollUp.min.js"></script>
        <script src="./assets/js/jquery.nice-select.min.js"></script>
      <script src="./assets/js/jquery.sticky.js"></script>
        
        <!-- contact js -->
        <script src="./assets/js/contact.js"></script>
        <script src="./assets/js/jquery.form.js"></script>
        <script src="./assets/js/jquery.validate.min.js"></script>
        <script src="./assets/js/mail-script.js"></script>
        <script src="./assets/js/jquery.ajaxchimp.min.js"></script>
        
      <!-- Jquery Plugins, main Jquery -->   
        <script src="./assets/js/plugins.js"></script>
        <script src="./assets/js/main.js"></script>
        
    </body>
</html>