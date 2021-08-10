<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<title>Connect Funding 비밀번호 찾기</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/ssong.css">
<link rel="stylesheet" type="text/css"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js">
<link rel="stylesheet" type="text/css"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
<script type="text/javascript" src="<c:url value='/assets/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$("#findBtn").click(function(){
			$.ajax({
				url : "<c:url value='/cfmember/findPw'/>",
				type : "POST",
				data : {
					userEmail : $("#userEmail").val()
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	});	
</script>   
    <div class="container">
        <div class="row">
            <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                <div class="card card-signin my-5">
                    <div class="card-body">
                    <br><br><br><br><br>
                        <h2 class="card-title text-center">비밀번호 찾기</h2>
                        <br>
						
                         <div class="form-label-group"> 
                         	<input type="email" id="userEmail" class="form-control" name="userEmail" placeholder="회원가입한 이메일주소를 입력하세요" required autofocus> 
                         </div>
						<br><br>
                   		<button class="btn btn-lg btn-primary btn-block text-uppercase" id="findBtn" type="button">임시 비밀번호 받기</button>
                   		<br><br><br><br><br>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%@ include file="../include/bottom.jsp" %>  