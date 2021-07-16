<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp" %>
<style type="text/css">
	.error{
		color: red;
		display: none;
	}
</style>

<script type="text/javascript" src="<c:url value='/project_assets/js/jquery-3.6.0.min.js'/>"></script>
<Script type="text/javascript">
	$(function(){
		$('#lg_btn').click(function(){
			$('.infobox').each(function(idx, item){
				if($(this).val().length<1){
					$(this).next().show();
					event.preventDefault();
					$(item).focus();
				}else{
					$(this).next().hide();					
				}
			});
		});
	});
</Script>

    <div class="page-wrapper">
        <div class="page-content--bge5">
            <div class="container">
                <div class="login-wrap">
                    <div class="login-content">
                        <div class="login-logo">
                            <a href="<c:url value='/admin/login'/>">
                                <img src="${pageContext.request.contextPath}/admin_assets/images/icon/logo_login.png" alt="CoolAdmin">
                            </a>
                        </div>
                        <div class="login-form">
                            <form action="" method="post" action="<c:url value='/admin/login'/>">
                                <div class="form-group">
                                    <label>관리자 계정</label>
                                    <input class="infobox au-input au-input--full" type="text" name="adminId" placeholder="admin-ID" value="${cookie.ck_adminId.value }">
                                    <span class="error">아이디를 입력하세요</span>
                                </div>
                                <div class="form-group">
                                    <label>비밀번호</label>
                                    <input class="infobox au-input au-input--full" type="password" name="adminPwd" placeholder="Password">
                                    <span class="error">비밀번호를 입력하세요</span>
                                </div>
                                <div class="login-checkbox">
                                    <label>
										<input type="checkbox" name="chkSave" id="chkSave"
											<c:if test="${!empty cookie.ck_adminId }">
												checked="checked"
											</c:if>
										>아이디 기억하기
                                    </label>
                                </div>
                                <input class="au-btn au-btn--block au-btn--green m-b-20" type="submit" id="lg_btn" value="로그인">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%@ include file="../inc/adminBottom.jsp" %>