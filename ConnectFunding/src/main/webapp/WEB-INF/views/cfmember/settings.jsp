<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<title>설정 변경</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.0.1/dist/Sketchy/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<style type="text/css">
	.form-group{
		width: 300px;
	}
	
	.div_main{
		width: 1000px;
		margin-left: 300px;
		height: 1000px; 
		margin-top: 20px;
	}
</style>
<script type="text/javascript">
	$(function(){
		$('#change').click(function(){
			if($('#oldPwd').val().length>1){
				alert('비밀번호를 입력하세요.');
				$('#userPwd').focus();
				event.preventDefault();
			}else if($('#userPwd').val().length>1){
				alert('변경할 비밀번호를 입력하세요.');
				$('#userPwd').focus();
				event.preventDefault();
			}else if($('#userPwd').val()!=$('#userPwd2').val()){
				alert("비밀번호가 일치하지 않습니다.");
				$('#userPwd2').focus();
				event.preventDefault();
			}
		});
	});
</script>
<!-- Tab을 구성할 영역 설정-->
<div class="div_main">
	<!-- Tab 영역 태그는 ul이고 클래스는 nav와 nav-tabs를 설정한다. -->
	<ul class="nav nav-tabs" >
		<!-- Tab 아이템이다. 태그는 li과 li > a이다. li태그에 active는 현재 선택되어 있는 탭 메뉴이다. -->
		<li class="active"><a href="#home" data-toggle="tab">프로필</a></li>
		<!-- a 태그의 href는 아래의 tab-content 영역의 id를 설정하고 data-toggle 속성을 tab으로 설정한다. -->
		<li><a href="#profile" data-toggle="tab">계정</a></li>
		<li><a href="#messages" data-toggle="tab">결제수단</a></li>
		<li><a href="#settings" data-toggle="tab">배송지</a></li>
		<li><a href="#settings" data-toggle="tab">알림</a></li>
	</ul>
	<!-- Tab이 선택되면 내용이 보여지는 영역이다. -->
	<!-- 태그는 div이고 class는 tab-content로 설정한다. -->
	<div class="tab-content">
		<!-- 각 탭이 선택되면 보여지는 내용이다. 태그는 div이고 클래스는 tab-pane이다. -->
		<!-- active 클래스는 현재 선택되어 있는 탭 영역이다. -->
	<div class="tab-pane fade in active" id="home">
		<form method="post" action="<c:url value='/cfmember/update?userNo=${sessionScope.userNo}'/>">
			<div class="col-lg-4">
				<div class="blog_right_sidebar">
					<div class="single_sidebar_widget post_category_widget"
						style="width: 800px; margin-left: 10px; background: white; height: 800px;">
						<h2 class="widget_title">프로필사진
						</h2>
						<ul class="list cat-list">
							<li>
									<img src="${pageContext.request.contextPath}/assets/img/logo/user.png" 
	                                	alt="로그인" style="width: 40px;" >
							</li>
							<li>
								<div class="form-group">
									<label class="col-form-label col-form-label-sm mt-4">
									이름</label> 
									<input class="form-control form-control-sm" type="text" 
										name="userName" value="${vo.userName }">
								</div>
							</li>
							<li>
								<div class="form-group">
									<label class="col-form-label col-form-label-sm mt-4">
									이메일</label> 
									<input class="form-control form-control-sm" type="text" 
										name="userEmail" value="${vo.userEmail }">
								</div>
							</li>
							<li>
								<div class="form-group">
									<label class="col-form-label col-form-label-sm mt-4" >
									연락처</label> 
									<input class="form-control form-control-sm" type="text"
										name="userHp" value="${vo.userHp }">
								</div>
							</li>
							<li>
							<div class="form-group">
							<button type="submit" class="btn btn-warning">변경하기</button>
							</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</form>
	</div>
		<!-- id는 고유한 이름으로 설정하고 tab의 href와 연결되어야 한다. -->
		<div class="tab-pane fade" id="profile">
	
		</div>
		
		<!-- fade 클래스는 선택적인 사항으로 트랜지션(transition)효과가 있다.
<!-- in 클래스는 fade 클래스를 선언하여 트랜지션효과를 사용할 때 in은 active와 선택되어 있는 탭 영역의 설정이다. -->
		<div class="tab-pane fade" id="messages">Messages 메뉴</div>
		<div class="tab-pane fade" id="settings">Settings 메뉴</div>
	</div>
</div>

<%@ include file="../include/bottom.jsp" %> 