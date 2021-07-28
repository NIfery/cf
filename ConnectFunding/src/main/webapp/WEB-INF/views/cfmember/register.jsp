<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ include file="../include/top.jsp" %> 
    <title>Connect Funding 회원가입</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ssong.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#join').click(function(){
			if($('#userName').val().length<1){
				alert("이름을 입력하세요.");
				$('#userName').focus();
				event.preventDefault();
			}else if($('#userEmail').val().length<1){
				alert("이메일주소를 입력하세요.");
				$('#userEmail').focus();
				event.preventDefault();
			}else if($('#userPwd').val().length<1){
				alert("비밀번호를 입력하세요.");
				$('#userPwd').focus();
				event.preventDefault();
			}else if($('#userPwd').val()!=$('#userPwd2').val()){
				alert("비밀번호가 일치하지 않습니다.");
				$('#userPwd2').focus();
				event.preventDefault();
			}	
		});
	});

$(function(){
	$('#userEmail').keyup(function(){
		var data=$(this).val();
		if(data.length>=1){
			$.ajax({
				url:"<c:url value='/cfmember/checkEmail'/>",
				type:"post",
				data:"userEmail="+data,
				success:function(res){
					var result="";
					if(res){
						result="사용가능한 이메일입니다.";
					}else{
						result="이미 가입된 이메일입니다.";
					}
					$('.error').html(result);
				},
				error:function(xhr, status, error){
					alert("error 발생!!" + error);
				}
			});				
		}
	});
});

$(function(){
	$('#userNickname').keyup(function(){
		var data2=$(this).val();
		if(data2.length>=1){
			$.ajax({
				url:"<c:url value='/cfmember/checkNickname'/>",
				type:"post",
				data:"userNickname="+data2,
				success:function(res2){
					var result2="";
					if(res2){
						result2="사용가능한 닉네임입니다.";
					}else{
						result2="이미 등록된 닉네임입니다.";
					}
					$('.error2').html(result2);
				},
				error:function(xhr, status, error){
					alert("error 발생!!" + error);
				}
			});				
		}
	});
});

function validateEmail(email) {
	var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	return re.test(email);
}
</script>
    <div class="registration-form">
        <form name="frmInsert" method="post"
			action="<c:url value='/cfmember/register'/>">
			<h2>회원가입</h2>
			<br>
            <div class="form-group">
            	<label>이름</label>
                <input type="text" class="form-control item" id="userName" name="userName"
                	 placeholder="이름을 입력하세요.">
            </div>
            <div class="form-group">
         	   <label>이메일 주소</label>
                <input type="text" class="form-control item" id="userEmail" name="userEmail"
                	placeholder="이메일주소를 입력하세요.">
                <span class="error" style="color: red;"></span>	
            </div>
            <div class="form-group">
         	   <label>닉네임</label>
                <input type="text" class="form-control item" id="userNickname" name="userNickname"
                placeholder="사용하실 닉네임을 입력하세요.">
                <span class="error2" style="color: red;"></span>	
            </div>
            <div class="form-group">
            	<label>비밀번호</label>
                <input type="password" class="form-control item" id="userPwd" name="userPwd" 
                	placeholder="비밀번호를 입력하세요.">
                 <input type="password" class="form-control item" id="userPwd2" placeholder="비밀번호를 확인합니다.">
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-block create-account" id="join">가입하기</button>
            </div>
        </form>
        <div class="social-media">
            <h5>또는</h5>
            <div class="social-icons">
                <a href="#"><i class="icon-social-facebook" title="Facebook"></i></a>
                <a href="#"><i class="icon-social-google" title="Google"></i></a>
                <a href="#"><i class="icon-social-twitter" title="Twitter"></i></a>
			    <!-- <input type ="text" name="userFlag"> -->
            </div>
        </div>
    </div>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
    <script src="assets/js/script.js"></script>
<%@ include file="../include/bottom.jsp" %> 