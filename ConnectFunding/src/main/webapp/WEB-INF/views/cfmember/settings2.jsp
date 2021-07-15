<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.0.1/dist/Sketchy/bootstrap.min.css">
<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
<script type="text/javascript" src="<c:url value='/assets/js/jquery-3.6.0.min.js'/>"></script>
<style type="text/css">
.div_main {
	width: 1000px;
	margin-left: 300px;
	height: 1000px;
	margin-top: 20px;
}

.form-group {
	width: 300px;
}

.col-md-offset-6 {
	color: rgb(39, 163, 255);
}

.wrap {
	width: 500px;
	height: 200px;
	border: 1px solid rgb(230, 230, 230);
	border-radius: 5px;
	position: relative;
}

.align_center {
	width: 60px;
	height: 60px;
	margin: 30px 0px 25px 200px;
}
</style>

<script type="text/javascript">
	$(function(){
		$('form[name="frmPwd"]').submit(function(){
			if($(this).find('input[nameoldPwd]').val().length>1){
				alert('비밀번호를 입력하세요.');
				$(this).find('input[name=oldPwd]').focus();
				event.preventDefault();
			}else if($(this).find('input[name=userPwd]').val().length>1){
				alert('변경하실 비밀번호를 입력하세요.');
				$(this).find('input[name=oldPwd]').focus();
				event.preventDefault();
			}else if($(this).find('input[name=userPwd2]').val().length>1){
				alert('비밀번호를 다시 입력하세요.');
				$(this).find('input[name=oldPwd]').focus();
				event.preventDefault();
			}
		});
	});
</script>
<div id="mytabs" class="div_main">
  <ul class="nav nav-tabs">
    <li class="nav-item"><a class="nav-link active" data-toggle="tab">프로필</a></li>
    <li class="nav-item"><a class="nav-link" data-toggle="tab">계정</a></li>
    <li class="nav-item"><a class="nav-link" data-toggle="tab">결제수단</a></li>
    <li class="nav-item"><a class="nav-link" data-toggle="tab">배송지</a></li>
    <li class="nav-item"><a class="nav-link" data-toggle="tab">알림</a></li>
  </ul>

  <!-- 내용 -->
  <div class="tab-content">
    <div class="tab-pane fade show active">
    	<form method="post" action="<c:url value='/cfmember/update?userNo=${sessionScope.userNo}'/>">
			<div class="col-lg-4">
				<div class="blog_right_sidebar">
					<div class="single_sidebar_widget post_category_widget"
						style="width: 800px; margin-left: 10px; background: white; height: 600px;">
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
   	
    <div class="tab-pane fade">
    		<form method="post" name="frmPwd"
    			action="<c:url value='/cfmember/pwdUpdate?userNo=${sessionScope.userNo}'/>">
			<div class="col-lg-4">
				<div class="blog_right_sidebar">
					<div class="single_sidebar_widget post_category_widget"
						style="width: 800px; margin-left: 10px; background: white; height: 800px;">
						<h2 class="widget_title">비밀번호 변경</h2>
						<ul class="list cat-list">
							<li>
								<div class="form-group">
									<label class="col-form-label col-form-label-sm mt-4">
										현재 비밀번호</label> 
									<input class="form-control form-control-sm" type="password" 
										name="oldPwd" id="oldPwd">
									<p>비밀번호가 기억나지 않나요? <a href="#" style="color: rgb(39, 163, 255);">&nbsp 비밀번호 찾기</a></p>	
								</div>
							</li>
							<li>
								<div class="form-group">
									<label class="col-form-label col-form-label-sm mt-4">
										변경할 비밀번호</label> 
									<input class="form-control form-control-sm" type="password" 
										name="userPwd" id="userPwd">
									<label class="col-form-label col-form-label-sm mt-4" >
										변경할 비밀번호 확인</label> 
									<input class="form-control form-control-sm" type="password"
										name="userPwd2" id="userPwd2">
								</div>
							</li>
							<li>
								<div class="form-group">
									<button type="submit" class="btn btn-warning" id="join">변경하기</button>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</form>
    </div><!-- 탭2 -->
    
    <div class="tab-pane fade">
    	<div style="width: 900px; margin-left: 10px; background: white; height: 800px;">
			<div class="row" style="margin-top: 20px;">
				<div class="col-md-6" style="width: 10px; height: 50px;">등록된 결제수단</div>
				<div class="col-md-6 col-md-offset-6"><a href="#"></a>+추가</div>
			</div>
			<div class="wrap">
					<img src="<c:url value='/assets/img/warning.png'/>"
						class="align_center">
					<div style="font-size: 0.9em; margin-left: 160px;">
					등록된 결제수단이 없습니다.<br>
					결제수단을 추가해주세요.
					</div>
			</div>
		</div>	
    </div><!-- 탭3 -->
    
    <div class="tab-pane fade">
    	<div style="width: 900px; margin-left: 10px; background: white; height: 800px;">
			<div class="row" style="margin-top: 20px;">
				<div class="col-md-6" style="width: 10px; height: 50px;">등록된 배송지</div>
				<div class="col-md-6 col-md-offset-6"><a href="#"></a>+추가</div>
			</div>
			<div class="wrap">
					<img src="<c:url value='/assets/img/warning.png'/>"
						class="align_center">
					<div style="font-size: 0.9em; margin-left: 160px;">
					등록된 배송지가 없습니다.<br>
					배송지를 추가해주세요.
					</div>
			</div>
		</div>	
    </div><!-- 탭4 -->
    
    <div class="tab-pane fade">내용5</div>
  </div>
</div>	<!-- divMain -->

<script type="text/javascript">
		$("#mytabs>ul>li>a").each(function(i){$(this).attr("href","#mytab"+i)})
		$("#mytabs>div>div").each(function(i){$(this).attr("id","mytab"+i)})
</script>

<%@ include file="../include/bottom.jsp" %> 