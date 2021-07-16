<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.0.1/dist/Sketchy/bootstrap.min.css">
<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
									<button type="submit" class="genric-btn warning circle">변경하기</button>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</form>
   	</div>
   	
    <div class="tab-pane fade">
    		<form method="post" name="frmPwd" id="frmPwd"
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
									<button type="submit" class="genric-btn warning circle" id="change">
										변경하기</button>
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
				<div class="col-md-6 col-md-offset-6">
					<a href="#" data-toggle="modal" data-target="#staticBackdrop">+추가</a>
				</div>
			</div>
			<div class="wrap">
					<img src="<c:url value='/assets/img/warning.png'/>"
						class="align_center">
					<div style="font-size: 0.9em; margin-left: 160px;">
					등록된 결제수단이 없습니다.<br>
					결제수단을 추가해주세요.
					</div>
			</div>
			<!-- Modal -->
			<form name="frmAccount" method="post" action="<c:url value='/cfmember/addAcc'/>">
				<div class="modal fade" id="staticBackdrop" data-backdrop="static" tabindex="-1" 
					role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="staticBackdropLabel">은행계좌 등록</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span></button>
							</div>
								<!-- 계좌등록 form -->
							<div class="modal-body"><!-- 모달 body -->
									<input type="hidden" name="userNo" value="${sessionScope.userNo }">
									<div class="form-group" style="width: 450px; margin: 3px;">
										<label class="form-label mt-4">계좌번호</label> 
										<input type="text" class="form-control" name="accountNo"
											placeholder="-를 포함해서 입력해주세요.">
									</div>
									<div class="form-group" style="width: 450px; margin: 3px;">
										<label for="exampleSelect2" class="form-label mt-4">결제은행</label> 
										<select class="form-select" id="exampleSelect2" name="bankName">
											<option value="국민은행">국민은행</option>
											<option value="신한은행">신한은행</option>
											<option value="우리은행">우리은행</option>
											<option value="농협">농협</option>
											<option value="우체국">우체국</option>
										</select>
									</div>
									<div class="form-group" style="margin-left: 10px;"width: 450px; margin: 3px;">
										<div class="form-check">
											<input class="form-check-input" type="checkbox" id="flexCheckDefault"> 
											<label class="form-check-label" for="flexCheckDefault" style="font-size: 0.9em;">
												사업자 계좌입니다. </label>
										</div>
									</div>
									<div class="row" style="width: 480px;">
										<div class="col-md-6">
											<label class="form-label mt-6">예금주명</label> 
											<input type="text" class="form-control" name="accountHolder"
												placeholder="예금주 명을 입력해주세요.">
										</div>
										<div class="col-md-6 col-md-offset-6">
											<label class="form-label mt-6" style="color: black">예금주 생년월일</label> 
											<input type="text" class="form-control" name="birth"
												placeholder="예) 2000-01-01">
										</div>
									</div>
									<div class="form-group" style="width: 400px; margin: 10px 5px;">
										<div class="form-check" style="position: relative;">
											<input class="form-check-input" type="checkbox" > 
											<label class="form-check-label" for="flexCheckDefault" style="font-size: 0.9em;">
												결제사 정보제공 동의</label>
											<span style="position: absolute; right: -40px; font-size: 0.9em; color: rgb(39, 163, 255);">
												<a href="#"></a>내용보기</span>	
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" id="flexCheckChecked" checked>
											<label class="form-check-label" for="flexCheckChecked" style="font-size: 0.9em;">
												기본 결제수단으로 등록</label>
										</div>
									</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="genric-btn warning circle" style="width: 480px;">등록 완료</button>
							</div>
						</div>
					</div>
				</div><!-- 모달 -->
			</form>
		</div>	
    </div><!-- 탭3 -->
    
    <div class="tab-pane fade">
    	<div style="width: 900px; margin-left: 10px; background: white; height: 800px;">
			<div class="row" style="margin-top: 20px;">
				<div class="col-md-6" style="width: 10px; height: 50px;">등록된 배송지</div>
				<div class="col-md-6 col-md-offset-6">
					<%-- <a href="<c:url value='/cfmember/Sample'/>">+추가</a> --%>
					<a href="#" data-toggle="modal" data-target="#myModal">+추가</a>
				</div>
			</div>
			<div class="wrap">
					<img src="<c:url value='/assets/img/warning.png'/>"
						class="align_center">
					<div style="font-size: 0.9em; margin-left: 160px;">
					등록된 배송지가 없습니다.<br>
					배송지를 추가해주세요.
					</div>
			</div>
			<!-- Modal -->
			<%-- <form name="frmAccount" method="post" action="<c:url value='/cfmember/addAcc'/>"> --%>
				<div class="modal fade" id="myModal" data-backdrop="static" tabindex="-1" 
					role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="staticBackdropLabel">배송지 추가</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span></button>
							</div>
							<!-- 주소등록 form -->
							<div class="modal-body"><!-- 모달 body -->
									<input type="hidden" name="userNo" value="${sessionScope.userNo }">
									<div class="form-group" style="width: 450px; margin: 3px;">
										<label class="form-label mt-4">받는사람</label> 
										<input type="text" class="form-control" name="accountNo"
											placeholder="받는 분 성함을 입력해주세요.">
									</div>
									<div class="form-group" style="width: 450px; margin: 3px;">
										<label class="form-label mt-4">주소</label>
									<div class="form-group">
										<div class="input-group mb-3">
											<span class="input-group-append">
											<input type="text" class="form-control" placeholder="주소검색" 
												name="address" style="width: 420px;">
												<button class="btns" type="button" onclick="goPopup()" 
													style="background: none; border: 1px; color: black;">
													<i class="ti-search"></i>
												</button>
												</span>
										</div>
									</div>
								</div>
									<div class="form-group" style="width: 450px; margin: 3px;">
										<label class="form-label mt-4">우편번호</label> 
										<input type="text" class="form-control" name="zipNo">
									</div>
									<div class="form-group" style="width: 450px; margin: 3px;">
										<label class="form-label mt-4">받는사람 휴대폰 번호</label> 
										<input type="text" class="form-control" name="accountNo"
											placeholder="받는 분 휴대폰번호를 입력해주세요.">
									</div>
									<div class="form-group" style="width: 400px; margin: 10px 5px;">
										<div class="form-check">
											<input class="form-check-input" type="checkbox" checked>
											<label class="form-check-label" style="font-size: 0.9em;">
												기본 결제수단으로 등록</label>
										</div>
									</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="genric-btn warning circle" style="width: 480px;">등록 완료</button>
							</div>
						</div>
					</div>
				</div><!-- 모달 -->
		<!-- 	</form> -->
		</div>	
    </div><!-- 탭4 -->
    
    <div class="tab-pane fade">내용5</div>
 
  </div>
</div>	<!-- divMain -->

<script type="text/javascript">
	$(document).ready(function(){
		$('#change').on("click",function(e) {
			e.preventDefault();
			if ($('#oldPwd').val().length < 1) {
				alert('비밀번호를 입력하세요.');
				$('#oldPwd').focus();
				event.preventDefaulut();
			} else if ($('#userPwd').val().length < 1) {
				alert('변경할 비밀번호를 입력하세요.');
				$('#userPwd').focus();
				event.preventDefaulut();
			} else if ($('#userPwd').val() != $('#userPwd2').val()) {
				alert("비밀번호가 일치하지 않습니다.");
				$('#userPwd2').focus();
				event.preventDefaulut();
			}
			//$('#frmPwd').submit();

		});
		
		$("#mytabs>ul>li>a").each(function(i){$(this).attr("href","#mytab"+i)})
		$("#mytabs>div>div").each(function(i){$(this).attr("id","mytab"+i)}) 
	});
</script>
<%@ include file="../include/bottom.jsp" %> 