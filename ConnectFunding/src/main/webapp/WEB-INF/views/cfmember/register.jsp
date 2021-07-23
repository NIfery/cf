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
		var data=$('#userEmail').val();
		console.log(data);
		if(data.length>=2){
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
		}else{
			$('.error').text('이메일을 입력하세요.');
		}
	});
});

$(function(){
	$('#userEmail').keyup(function(){
		var data=$(this).val();
		if(validateEmail(data) && data.length>=1){
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
		}else{
			$('.error').text('이메일 규칙에 맞지 않습니다.');
		}
	});
});

function validateEmail(email){
    var emailReg = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
    return emailReg.test(email);
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
                <input type="text" class="form-control item" id="userEmail" name="userEmail">
                <span class="error" style="color: red;"></span>	
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