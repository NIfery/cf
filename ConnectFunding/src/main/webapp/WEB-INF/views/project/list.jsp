<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
			.dropdown-submenu {
		    	position: relative;
			}

			.dropdown-submenu .dropdown-menu {
				top: 0;
				left: 100%;
				margin-top: -1px;
			}
		</style>
		
		<script type="text/javascript" 
			src="<c:url value='/project_assets/js/jquery-3.6.0.min.js'/>"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$('.dropdown-submenu a.test').on("click", function(e){
					$(this).next('ul').toggle();
					e.stopPropagation();
					e.preventDefault();
				});
			});
			function test(type){
				$.ajax({
					url:"<c:url value='/project/alist'/>",
					type:"get",
					data:"secondCategoryNo="+type,
					dataType:"json",
					success:function(res){
						$('#test').empty();
						
						var str="";
						str+="<div class='container'><div class='weekly2-wrapper'><div class='row'>";
						str+="<div class='col-lg-12'><div class='section-tittle mb-30'>";
						str+="<h3><span style='color:red'>"+res.length+"</span>개의 프로젝트가 있습니다.</h3>";
						str+="</div></div></div><div class='row'><div class='col-12'>";
						str+="<div class='dot-style d-flex dot-style'>";
						if(res==''){
							str+="데이터가 없습니다.";
						}else{
							$.each(res, function(idx,item){
								if(idx<4){
									str+="<div class='weekly2-single'><div class='weekly2-img'>";
									str+="<img src='${pageContext.request.contextPath}/project_assets/"+item.projectImage+"'></div>";
									str+="<div class='weekly2-caption'><span></span>";
									str+="<h4><a href='#'>"+item.projectName+"</a></h4>";
									str+="<p>"+moment(item.projectStartdate).format("YYYY-MM-DD")+"</p>";
									str+="<h4><a href='#'>"+item.projectSummary+"</a></h4>";
									str+="<hr style='margin:5px 0px 8px 0px;'>";
									str+="<h6 style='color:red'>"+item.totalFundingAmount/+item.totalAmount*100+"% 달성</h6>";
									str+="</div></div>";
								}
							});
							str+="</div></div></div></div></div>";
							if(res.length>4){
								str+="<div class='container'><div class='weekly2-wrapper'><div class='row'>";
								str+="<div class='col-lg-12'><div class='section-tittle mb-30'><br><br></div></div></div>";
								str+="<div class='row'><div class='col-12'>";
								str+="<div class='dot-style d-flex dot-style'>";
								$.each(res, function(idx,item){
									if(idx>=4){
										str+="<div class='weekly2-single'><div class='weekly2-img'>";
										str+="<img src='${pageContext.request.contextPath}/project_assets/"+item.projectImage+"'></div>";
										str+="<div class='weekly2-caption'><span></span>";
										str+="<h4><a href='#'>"+item.projectName+"</a></h4>";
										str+="<p>"+moment(item.projectStartdate).format("YYYY-MM-DD")+"</p>";
										str+="<h4><a href='#'>"+item.projectSummary+"</a></h4>";
										str+="<hr style='margin:5px 0px 8px 0px;'>";
										str+="<h6 style='color:red'>"+item.totalFundingAmount/+item.totalAmount*100+"% 달성</h6>";
										str+="</div></div>";
									}
								});
								str+="</div></div></div></div></div>";
							}
						}
						
						
						$('#test').append(str);
					},
					error:function(xhr, status, error){
						alert("Error 발생 : " + error);
					}
				});
			}
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

    <div class="weekly-news-area pt-50">
        <div class="container">
           <div class="weekly-wrapper">
                <!-- section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                    
                    <div class="dropdown">
					    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">카테고리
					    <span class="caret"></span></button>
					    <ul class="dropdown-menu">
					      <li class="dropdown-submenu dropend">
					        <a class="test dropdown-item dropdown-toggle" tabindex="-1" href="#">게임<span class="caret"></span></a>
					        <ul class="dropdown-menu">
					          <li><a tabindex="-1" href="#" class="dropdown-item" onclick="">모든 게임</a></li>
					          <li><a tabindex="-1" href="#" class="dropdown-item" onclick="test('1')">모바일 게임</a></li>
					          <li><a tabindex="-1" href="#" class="dropdown-item" onclick="">보드 게임</a></li>
					          <li><a tabindex="-1" href="#" class="dropdown-item" onclick="">비디오 게임</a></li>
					          <li><a tabindex="-1" href="#" class="dropdown-item" onclick="">카드 게임</a></li>
					          <li><a tabindex="-1" href="#" class="dropdown-item" onclick="">게임 페스티벌</a></li>
					        </ul>
					      </li>
					      <li class="dropdown-submenu dropend">
					      <a class="test dropdown-item dropdown-toggle" tabindex="-1" href="#">공연<span class="caret"></span></a>
					      </li>
					      <li class="dropdown-submenu dropend">
					      <a class="test dropdown-item dropdown-toggle" tabindex="-1" href="#">디자인<span class="caret"></span></a>
					      </li>
					    </ul>
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
						  	style="padding:12px 0px;" onclick="test('0')">
						    전체보기
						  </button>
						</div>
                    </div>
                </div>
                
           </div>
        </div>
    </div>           
    
    <div class="weekly2-news-area  weekly2-pading gray-bg" id="test">
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
			                		<div class="weekly2-single">
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
                            <c:if test="${!empty list && fn:length(list)>4}">
                            <c:forEach var="vo" items="${list }" begin="4">
			                	<div class="weekly2-single">
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
   
   
   <%@ include file="../include/bottom.jsp" %>  