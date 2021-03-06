 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<script type="text/javascript">
//이름 검사
$(function(){ 
	 $("#adminName").keyup(function(){ 
	       var nameReg = /^[가-힣]{2,10}$/g;
	       if(!nameReg.test( $("#adminName").val())) {
	                $('#chkMsg4').css('color','red','font-weight','bold').html("이름은 한글로만 2~10자 이내여아 합니다.").show();
	                document.getElementById('adminId').disabled = true;
	                document.getElementById('adminPwd').disabled = true;
	                document.getElementById('adminPwd2').disabled = true;
	                document.getElementById('level').disabled = true;
	                document.getElementById('join').disabled = true;
	                $('#join').css('background-color','red').html("양식에 맞게 다시 입력하세요.");
	      }else{
	                $('#chkMsg4').hide();
	                document.getElementById('adminId').disabled = false;
	                document.getElementById('adminPwd').disabled = false;
	                document.getElementById('adminPwd2').disabled = false;
	                document.getElementById('level').disabled = false;
	                document.getElementById('join').disabled = false;
	                $('#join').css('background-color','#63c76a').html("관리자 생성");
	      }
	});
});

//ajax - 아이디 실시간 중복체크
function checkId(){
    var id = $('#adminId').val();
    $.ajax({
        url:"<c:url value='/admin/idDuplChk'/>",
        type:'post',
        data:{adminId:id},
        success:function(data){
        	var idReg = /^[a-z]+[a-z0-9]{5,16}$/g;
            if( !idReg.test( $("#adminId").val() ) ) {
                $('#chkMsg').css('color','red','font-weight','bold').html("아이디는 영문자로 시작하는 6~15자 영문자 또는 숫자이어야 합니다.");
                document.getElementById('adminPwd').disabled = true;
                document.getElementById('adminPwd2').disabled = true;
                document.getElementById('level').disabled = true;
                document.getElementById('join').disabled = true;
                $('#join').css('background-color','red').html("양식에 맞게 다시 입력하세요.");
            }else if($.trim(data)==0){
                $('#chkMsg').css('color','green','font-weight','bold').html("사용할 수 있는 아이디입니다.");
                document.getElementById('adminPwd').disabled = false;
                document.getElementById('adminPwd2').disabled = false;
                document.getElementById('level').disabled = false;
                document.getElementById('join').disabled = false;
                $('#join').css('background-color','#63c76a').html("관리자 생성");
            }else{
                $('#chkMsg').css('color','red','font-weight','bold').html("사용중인 아이디입니다. 다른 아이디를 입력해 주세요");
                document.getElementById('adminPwd').disabled = true;
                document.getElementById('adminPwd2').disabled = true;
                document.getElementById('level').disabled = true;
                document.getElementById('join').disabled = true;
                $('#join').css('background-color','red').html("양식에 맞게 다시 입력하세요.");
            }
        	
            
        },
        error:function(xhr, status, error){
                alert("아이디 중복확인 에러입니다");
        }
    });
}; 



//실시간 비밀번호 확인
$(function(){ 
	$("#adminPwd").keyup(function(){
		var regex = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		if(!regex.test($("#adminPwd").val())){
			$('#chkMsg1').css('color','red','font-weight','bold').html("영문자, 숫자, 특수문자를 포함한 8~15자 이내어야합니다.");
	        $('#join').css('background-color','red').html("양식에 맞게 다시 입력하세요.");
	        document.getElementById('adminPwd2').disabled = true;
	        document.getElementById('level').disabled = true;
	        document.getElementById('join').disabled = true;
	        event.preventDefault();
		 }else{
			 $('#join').css('background-color','#63c76a').html("관리자 생성");
			 document.getElementById('adminPwd2').disabled = false;
		     document.getElementById('level').disabled = false;
		     document.getElementById('join').disabled = false;
		 }
	});
    
   $("#adminPwd2").keyup(function(){ 
	  
      var pwd1=$("#adminPwd").val(); 
      var pwd2=$("#adminPwd2").val(); 
      if(pwd1 != "" || pwd2 != ""){ 
         if(pwd1 == pwd2){ 
             $('#chkMsg1').css('color','green','font-weight','bold').html("비밀번호가 일치합니다.");
             $('#chkMsg2').hide();
             $('#join').css('background-color','#63c76a').html("관리자 생성");
                 document.getElementById('level').disabled = false;
                 document.getElementById('join').disabled = false;
         }else{ 
              $('#chkMsg1').css('color','red','font-weight','bold').html("비밀번호가 일치하지 않습니다.");
              $('#join').css('background-color','red').html("양식에 맞게 다시 입력하세요.");
              document.getElementById('level').disabled = true;
              document.getElementById('join').disabled = true;
        } 
      } 
   });
   
   $('#level').click(function(){
	   if ($('#level').val() != '') {
			$('#chkMsg3').hide();						
		}
   });
   
}); 

$(function() {
		$('#join').click(
				function() {
					if ($('#adminName').val().length < 1) {
						$('#chkMsg4').css('color', 'red', 'font-weight', 'bold').html("이름을 입력하세요.");
						$('#adminName').focus();
						event.preventDefault();
					} else if ($('#adminId').val().length < 1) {
						$('#chkMsg').css('color', 'red', 'font-weight', 'bold')
								.html("아이디를 입력하세요.");
						$('#adminId').focus();
						event.preventDefault();
					} else if ($('#adminPwd').val().length < 1) {
						$('#chkMsg1')
								.css('color', 'red', 'font-weight', 'bold')
								.html("비밀번호를 입력하세요.");
						$('#adminPwd').focus();
						event.preventDefault();
					} else if ($('#adminPwd2').val().length < 1) {
						$('#chkMsg2')
								.css('color', 'red', 'font-weight', 'bold')
								.html("비밀번호를 입력하세요.");
						$('#adminPwd2').focus();
						event.preventDefault();
					} else if ($('#level').val() == '') {
						$('#chkMsg3')
								.css('color', 'red', 'font-weight', 'bold')
								.html("직책을 선택하세요.").show();
						$('#level').focus();
						event.preventDefault();
					}
				});
});
</script>
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
                                    <label>이름</label>
                                    <input class="au-input au-input--full" type="text" name="adminName" id="adminName" placeholder="이름" />
                                    <span id = "chkMsg4"></span> 
                                </div>
                                <div class="form-group">
                                    <label>아이디</label>
                                    <input class="au-input au-input--full" type="text" name="adminId" id="adminId" oninput="checkId()" placeholder="아이디" />
                                    <span id = "chkMsg"></span> 
                                </div>
                                <div class="form-group">
                                    <label>비밀번호</label>
                                    <input class="au-input au-input--full" type="password" name="adminPwd" id="adminPwd" placeholder="비밀번호를 입력하세요.">
                                    <span id = "chkMsg1"></span>                
                                </div>
                                <div class="form-group">
                                    <label>비밀번호 확인</label>
                                    <input class="au-input au-input--full" type="password" name="adminPwd2" id="adminPwd2" placeholder="비밀번호를 한번 더 입력하세요.">
                                   <span id = "chkMsg2"></span> 
                                </div>
                                <div class="form-group">
                             <label for="level">관리자 직책 :&nbsp;
                             <select name="adminPosition" id="level">
                                 <option value="">선택하세요</option>
                                    <c:forEach var="map" items="${list }">
                                       <option value="${map['AUTHCODE']}">${map['AUTHNAME'] }</option>               
                                    </c:forEach>                   
                               </select>
                               <span id = "chkMsg3"></span> 
                               </label>
                                </div>
                                <button class="au-btn au-btn--block au-btn--green m-b-20" type="submit" id="join">관리자 생성</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../inc/adminBottom.jsp" %>