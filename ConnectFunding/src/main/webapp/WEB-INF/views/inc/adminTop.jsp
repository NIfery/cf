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

</head>

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
                        <li class="has-sub">
                            <a class="js-arrow" href="<c:url value='/admin/index'/>">
                                <i class="fas fa-tachometer-alt"></i>메인화면</a>
                        </li>
                        <li>
                            <a href="<c:url value='/admin/membership'/>">
                                <i class="fas fa-chart-bar"></i>회원관리</a>
                        </li>
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
                        <li>
                            <a class="js-arrow" href="<c:url value='/admin/index'/>">
                                <i class="fas fa-bar-chart-o"></i> 통계</a>
                        </li>
                        <li>
                            <a class="js-arrow" href="<c:url value='/admin/confirm'/>">
                                <i class="fas fa-check-square"></i> 등록 펀딩심사</a>
                        </li>
                        <li>
                            <a href="<c:url value='/chat/adminInbox'/>">
                                <i class="fas  fa-comments"></i>문의쪽지함</a>
                        </li>
                        <li>
                            <a href="<c:url value='/admin/membership'/>">
                                <i class="fas fa-users"></i>회원관리</a>
                        </li>
                        <li>
                            <a href="<c:url value='/admin/adminship'/>">
                                <i class="fas fa-sitemap"></i>운영자 관리</a>
                        </li>
                        <li>
                            <a href="<c:url value='/admin/register'/>">
                                <i class="fas  fa-user-md"></i> 운영자 등록</a>
                        </li>
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
                    <div class="container-fluid">
                        <div class="header-wrap">
                            <form class="form-header" action="" method="POST">
                            </form>
                            <c:if test="${!empty sessionScope.adminId }">
	                            <div class="header-button">
	                                <div class="noti-wrap">
	                                    <div class="noti__item js-item-menu">
	                                        <i class="zmdi zmdi-comment-more"></i>
	                                        <span class="quantity">1</span>
	                                        <div class="mess-dropdown js-dropdown">
	                                            <div class="mess__title">
	                                                <p>You have 2 news message</p>
	                                            </div>
	                                            <div class="mess__item">
	                                                <div class="image img-cir img-40">
	                                                    <img src="${pageContext.request.contextPath}/admin_assets/images/icon/avatar-06.jpg" alt="Michelle Moreno" />
	                                                </div>
	                                                <div class="content">
	                                                    <h6>Michelle Moreno</h6>
	                                                    <p>Have sent a photo</p>
	                                                    <span class="time">3 min ago</span>
	                                                </div>
	                                            </div>
	                                            <div class="mess__item">
	                                                <div class="image img-cir img-40">
	                                                    <img src="${pageContext.request.contextPath}/admin_assets/images/icon/avatar-04.jpg" alt="Diane Myers" />
	                                                </div>
	                                                <div class="content">
	                                                    <h6>Diane Myers</h6>
	                                                    <p>You are now connected on message</p>
	                                                    <span class="time">Yesterday</span>
	                                                </div>
	                                            </div>
	                                            <div class="mess__footer">
	                                                <a href="#">View all messages</a>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="noti__item js-item-menu">
	                                        <i class="zmdi zmdi-email"></i>
	                                        <span class="quantity">1</span>
	                                        <div class="email-dropdown js-dropdown">
	                                            <div class="email__title">
	                                                <p>You have 3 New Emails</p>
	                                            </div>
	                                            <div class="email__item">
	                                                <div class="image img-cir img-40">
	                                                    <img src="${pageContext.request.contextPath}/admin_assets/images/icon/avatar-06.jpg" alt="Cynthia Harvey" />
	                                                </div>
	                                                <div class="content">
	                                                    <p>Meeting about new dashboard...</p>
	                                                    <span>Cynthia Harvey, 3 min ago</span>
	                                                </div>
	                                            </div>
	                                            <div class="email__item">
	                                                <div class="image img-cir img-40">
	                                                    <img src="${pageContext.request.contextPath}/admin_assets/images/icon/avatar-05.jpg" alt="Cynthia Harvey" />
	                                                </div>
	                                                <div class="content">
	                                                    <p>Meeting about new dashboard...</p>
	                                                    <span>Cynthia Harvey, Yesterday</span>
	                                                </div>
	                                            </div>
	                                            <div class="email__item">
	                                                <div class="image img-cir img-40">
	                                                    <img src="${pageContext.request.contextPath}/admin_assets/images/icon/avatar-04.jpg" alt="Cynthia Harvey" />
	                                                </div>
	                                                <div class="content">
	                                                    <p>Meeting about new dashboard...</p>
	                                                    <span>Cynthia Harvey, April 12,,2018</span>
	                                                </div>
	                                            </div>
	                                            <div class="email__footer">
	                                                <a href="#">See all emails</a>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="noti__item js-item-menu">
	                                        <i class="zmdi zmdi-notifications"></i>
	                                        <span class="quantity">3</span>
	                                        <div class="notifi-dropdown js-dropdown">
	                                            <div class="notifi__title">
	                                                <p>You have 3 Notifications</p>
	                                            </div>
	                                            <div class="notifi__item">
	                                                <div class="bg-c1 img-cir img-40">
	                                                    <i class="zmdi zmdi-email-open"></i>
	                                                </div>
	                                                <div class="content">
	                                                    <p>You got a email notification</p>
	                                                    <span class="date">April 12, 2018 06:50</span>
	                                                </div>
	                                            </div>
	                                            <div class="notifi__item">
	                                                <div class="bg-c2 img-cir img-40">
	                                                    <i class="zmdi zmdi-account-box"></i>
	                                                </div>
	                                                <div class="content">
	                                                    <p>Your account has been blocked</p>
	                                                    <span class="date">April 12, 2018 06:50</span>
	                                                </div>
	                                            </div>
	                                            <div class="notifi__item">
	                                                <div class="bg-c3 img-cir img-40">
	                                                    <i class="zmdi zmdi-file-text"></i>
	                                                </div>
	                                                <div class="content">
	                                                    <p>You got a new file</p>
	                                                    <span class="date">April 12, 2018 06:50</span>
	                                                </div>
	                                            </div>
	                                            <div class="notifi__footer">
	                                                <a href="#">All notifications</a>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="account-wrap">
	                                    <div class="account-item clearfix js-item-menu">
			                                    <a class="js-acc-btn" href="#">
													<c:if test="${adminPosition eq 'QnA_Admin'}">
																QnA 담당자
													</c:if>
													<c:if test="${adminPosition eq 'ADMIN'}">
																총책임자
													</c:if>
													<c:if test="${adminPosition eq 'FUNDING_CHECK_ADMIN'}">
																펀딩심사 담당자
													</c:if>
												</a>
	                                        <div class="account-dropdown js-dropdown">
	                                            <div class="account-dropdown__body">
	                                                <div class="account-dropdown__item">
	                                                    <a href="#">
	                                                        <i class="zmdi zmdi-account"></i>계정 정보변경</a>
	                                                </div>
	                                            </div>
	                                            <div class="account-dropdown__footer">
	                                                <a href="<c:url value='/admin/login/logout' />">
	                                                    <i class="zmdi zmdi-power"></i>로그아웃</a>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </header>
            <!-- HEADER DESKTOP-->