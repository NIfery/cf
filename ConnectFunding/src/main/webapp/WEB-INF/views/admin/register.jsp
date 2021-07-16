<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ include file="../inc/adminTop.jsp" %>

<body class="animsition">
    <div class="page-wrapper">
        <div class="page-content--bge5">
            <div class="container">
                <div class="login-wrap">
                    <div class="login-content">
                        <div class="login-logo">
                            <a>
                                <img src="${pageContext.request.contextPath}/admin_assets/images/icon/logo_login.png" alt="CoolAdmin">
                            </a>
                        </div>
                        <div class="login-form">
                            <form action="<c:url value='/admin/register'/>" method="post">
                                <div class="form-group">
                                    <label>아이디</label>
                                    <input class="au-input au-input--full" type="text" name="adminId" id="adminId" placeholder="아이디">
                                </div>
                                <div class="form-group">
                                    <label>비밀번호</label>
                                    <input class="au-input au-input--full" type="password" name="adminPwd" id="adminPwd" placeholder="비밀번호를 입력하세요.">
                                </div>
                                <div class="form-group">
                                    <label>비밀번호 확인</label>
                                    <input class="au-input au-input--full" type="password" name="adminPwd2" id="adminPwd2" placeholder="비밀번호를 한번 더 입력하세요.">
                                </div>
                                <div class="form-group">
							        <label for="level">관리자 직책 :&nbsp;
							        <select name="adminPosition" id="level">
							            <option value="">선택하세요</option>
								            <c:forEach var="map" items="${list }">
									            <option value="${map['AUTHCODE']}">${map['AUTHNAME'] }</option>            	
								            </c:forEach>                   
							       	</select>
							       	</label>
                                </div>
                                <button class="au-btn au-btn--block au-btn--green m-b-20" type="submit">관리자 생성</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%@ include file="../inc/adminBottom.jsp" %>