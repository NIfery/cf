<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="au theme template">
    <meta name="author" content="Hau Nguyen">
    <meta name="keywords" content="au theme template">

    <!-- Title Page-->
    <title>Admin - ConnectFunding</title>

    <!-- Fontfaces CSS-->
    <link href="${pageContext.request.contextPath}/admin_assets/css/font-face.css" rel="stylesheet" media="all">
    <link href="${pageContext.request.contextPath}/admin_assets/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="${pageContext.request.contextPath}/admin_assets/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="${pageContext.request.contextPath}/admin_assets/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="${pageContext.request.contextPath}/admin_assets/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

    <!-- Vendor CSS-->
    <link href="${pageContext.request.contextPath}/admin_assets/vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="${pageContext.request.contextPath}/admin_assets/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="${pageContext.request.contextPath}/admin_assets/vendor/wow/animate.css" rel="stylesheet" media="all">
    <link href="${pageContext.request.contextPath}/admin_assets/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="${pageContext.request.contextPath}/admin_assets/vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="${pageContext.request.contextPath}/admin_assets/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="${pageContext.request.contextPath}/admin_assets/vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="${pageContext.request.contextPath}/admin_assets/css/theme.css" rel="stylesheet" media="all">
    
    <!-- Jquery JS-->
    <script src="${pageContext.request.contextPath}/admin_assets/vendor/jquery-3.2.1.min.js"></script>
    
    <script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.js"></script>

<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.min.js"></script>

<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.js"></script>

<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
</head>

<script type="text/javascript">
$(document).ready(function(){
	$('#change').on("click",function() {
		var regex = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		if($('#beforePwd').val().length<1){
			alert('??????????????? ???????????????.');
			$('#beforePwd').focus();
			event.preventDefault();
		}else if($('#newPwd').val().length<1){
			alert('???????????? ??????????????? ???????????????.');
			$('#newPwd').focus();
			event.preventDefault();
		}else if($('#newPwd').val() != $('#newPwd2').val()) {
			alert("??????????????? ???????????? ????????????.");
			$('#newPwd2').focus();
			event.preventDefault();
		}else if(!regex.test($("#newPwd").val())){
			alert("?????????, ??????, ??????????????? ????????? 8~15??? ????????????????????????.");
			event.preventDefault();
		}
	});
});

function logout(){
	var con = confirm("???????????? ???????????????????");
	if(con == true){
		alert('???????????? ???????????????.');
		$("#logout").attr("href", "<c:url value='/admin/logout'/>");
	}else{
		return;
	}
}
</script>
<style>
a {
	text-decoration: none !important;
}
</style>
<body class="animsition">
    <div class="page-wrapper">
        <!-- HEADER MOBILE-->
        <header class="header-mobile d-block d-lg-none">
            <div class="header-mobile__bar">
                <div class="container-fluid">
                    <div class="header-mobile-inner">
                        <a class="logo" href="<c:url value='/admin/login'/>">
                            <img src="${pageContext.request.contextPath}/admin_assets/images/icon/logo.png" alt="CoolAdmin" />
                        </a>
                        <button class="hamburger hamburger--slider" type="button">
                            <span class="hamburger-box">
                                <span class="hamburger-inner"></span>
                            </span>
                        </button>
                    </div>
                </div>
            </div>
            <nav class="navbar-mobile">
                <div class="container-fluid">
                    <ul class="navbar-mobile__list list-unstyled">
                                	<c:if test="${!empty adminId }">
            	   <li>
                     <a href="<c:url value='/admin/index'/>">
                   	 <i class="fas fa-bar-chart-o"></i> ??????</a>
                   </li>
                    <c:if test="${adminPosition eq 'ADMIN'}">
                        <li>
                            <a href="<c:url value='/admin/confirm'/>">
                                <i class="fas fa-check-square"></i> ?????? ????????????</a>
                        </li>
                        <li>
                            <a href="<c:url value='/chat/adminInbox'/>">
                                <i class="fas  fa-comments"></i>???????????????</a>
                        </li>
                        <li>
                            <a href="<c:url value='/admin/membership'/>">
                                <i class="fas fa-users"></i>????????????</a>
                        </li>
                        <li>
                            <a href="<c:url value='/admin/adminship'/>">
                                <i class="fas fa-sitemap"></i>????????? ??????</a>
                        </li>
                        <li>
                            <a href="<c:url value='/admin/register'/>">
                                <i class="fas  fa-user-md"></i> ????????? ??????</a>
                        </li>
                    </c:if>    
                    <c:if test="${adminPosition eq 'QnA_Admin'}">
                        <li>
                            <a href="<c:url value='/chat/adminInbox'/>">
                                <i class="fas  fa-comments"></i>???????????????</a>
                        </li>
                    </c:if>
                    <c:if test="${adminPosition eq 'FUNDING_CHECK_Admin'}">
                        <li>
                            <a href="<c:url value='/admin/confirm'/>">
                                <i class="fas fa-check-square"></i> ?????? ????????????</a>
                        </li>
                    </c:if>
                        <li>
                            <a href="<c:url value='/chat/adminInbox'/>">
                                <i class="fas fa-bullhorn"></i>???????????? ??????</a>
                        </li>
                        <li class="nav-item dropdown"> 
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-download"></i>????????? ??????
                                <span class="caret"></span>
                            </a>
							<div class="dropdown-menu">
								<form action="<c:url value='/admin/membershipDownload'/>" method="post">
									<input type="submit" class="dropdown-item" value="???????????? ????????????">									
								</form>
								<form action="<c:url value='/admin/FundingDownload'/>" method="post">
									<input type="submit" class="dropdown-item" value="???????????? ??????">									
								</form>
							</div>
						</li>
                        <hr>
                        <li>
                            <a href="<c:url value='/'/>" target="_blank">
                                <i class="fas fa-home"></i>??????????????? ??????</a>
                        </li>
				</c:if>
                    </ul>
                </div>
            </nav>
        </header>
        <!-- END HEADER MOBILE-->

        <!-- MENU SIDEBAR-->
        <aside class="menu-sidebar d-none d-lg-block">
            <div class="logo">
                <a href="<c:url value='/admin/index'/>">
                    <img src="${pageContext.request.contextPath}/admin_assets/images/icon/logo.png" alt="Cool Admin" />
                </a>
            </div>
            <div class="menu-sidebar__content js-scrollbar1">
                <nav class="navbar-sidebar">
                    <ul class="list-unstyled navbar__list">
            	<c:if test="${empty adminId }">
            		???????????? ?????? ?????????????????????.
            	</c:if>
            	<c:if test="${!empty adminId }">
            	   <li>
                     <a href="<c:url value='/admin/index'/>">
                   	 <i class="fas fa-bar-chart-o"></i> ??????</a>
                   </li>
                    <c:if test="${adminPosition eq 'ADMIN'}">
                        <li>
                            <a href="<c:url value='/admin/confirm'/>">
                                <i class="fas fa-check-square"></i> ?????? ????????????</a>
                        </li>
                        <li>
                            <a href="<c:url value='/chat/adminInbox'/>">
                                <i class="fas  fa-comments"></i>???????????????</a>
                        </li>
                        <li>
                            <a href="<c:url value='/admin/membership'/>">
                                <i class="fas fa-users"></i>????????????</a>
                        </li>
                        <li>
                            <a href="<c:url value='/admin/adminship'/>">
                                <i class="fas fa-sitemap"></i>????????? ??????</a>
                        </li>
                        <li>
                            <a href="<c:url value='/admin/register'/>">
                                <i class="fas  fa-user-md"></i> ????????? ??????</a>
                        </li>
                    </c:if>    
                    <c:if test="${adminPosition eq 'QnA_Admin'}">
                        <li>
                            <a href="<c:url value='/chat/adminInbox'/>">
                                <i class="fas  fa-comments"></i>???????????????</a>
                        </li>
                    </c:if>
                    <c:if test="${adminPosition eq 'FUNDING_CHECK_Admin'}">
                        <li>
                            <a href="<c:url value='/admin/confirm'/>">
                                <i class="fas fa-check-square"></i> ?????? ????????????</a>
                        </li>
                    </c:if>
                        <li>
                            <a href="<c:url value='/admin_notice/notice_tab'/>">
                                <i class="fas fa-bullhorn"></i>???????????? ??????</a>
                        </li>
                        <li class="nav-item dropdown"> 
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-download"></i>????????? ??????
                                <span class="caret"></span>
                            </a>
							<div class="dropdown-menu">
								<form action="<c:url value='/admin/membershipDownload'/>" method="post">
									<input type="submit" class="dropdown-item" value="???????????? ????????????">									
								</form>
								<form action="<c:url value='/admin/FundingDownload'/>" method="post">
									<input type="submit" class="dropdown-item" value="???????????? ??????">									
								</form>
							</div>
						</li>
                        <hr>
                        <li>
                            <a href="<c:url value='/'/>" target="_blank">
                                <i class="fas fa-home"></i>??????????????? ??????</a>
                        </li>
				</c:if>
					</ul>
				</nav>	
			</div>
        </aside>
        <!-- END MENU SIDEBAR-->
		</div>
		
        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
            <header class="header-desktop">
                <div class="section__content section__content--p30">
                    <div class="container-fluid" style="justify-content: center">
                            <form class="form-header" action="" method="POST">
                            </form>
                            <c:if test="${!empty sessionScope.adminId }">
	                                <div class="account-wrap" style="text-align: center;">
	                                    <div class="account-item clearfix js-item-menu">
			                                    <a class="js-acc-btn">
													[<c:if test="${adminPosition eq 'QnA_Admin'}">
																???????????? ?????????
													</c:if>
													<c:if test="${adminPosition eq 'ADMIN'}">
																????????????
													</c:if>
													<c:if test="${adminPosition eq 'FUNDING_CHECK_Admin'}">
																???????????? ?????????
													</c:if>
													-&nbsp;${sessionScope.adminName } ]
												</a>
	                                    </div>
			                            <a class="fas  fa-key" data-toggle="modal" data-target="#myModal" href="#"> ???????????? ??????</a>&emsp;
			                            <a class="fas  fa-power-off" id="logout" href="#" onclick="logout()"> ????????????</a>
	                                </div>
                            </c:if>
                    </div>
                </div>
            </header>
            
            <!-- HEADER DESKTOP-->
            
		<!-- Modal -->
		<form action="<c:url value='/admin/changePwd?adminId?=${sessionScope.adminId }'/>" method="post">
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" style="display: block;">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">???????????? ??????</h4>
					</div>
					<div class="modal-body">
						<label>?????? ????????????</label><input class="au-input au-input--full" type="password" name="beforePwd" id="beforePwd"><br>
						<label>????????? ????????????</label><input class="au-input au-input--full" type="password" name="adminPwd" id="newPwd"><br>
						<label>????????? ???????????? ??????</label><input class="au-input au-input--full" type="password" name="adminPwd2" id="newPwd2">
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary" id="change">????????????</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">??????</button>
					</div>
				</div>
			</div>
		</div>
		</form>