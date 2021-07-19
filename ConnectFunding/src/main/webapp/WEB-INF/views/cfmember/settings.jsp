<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
    <link rel="stylesheet" href="../_vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../_vendor/prismjs/themes/prism-okaidia.css">
    <link rel="stylesheet" href="../_assets/css/custom.min.css">
    <!-- Global Site Tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-23019901-1"></script>
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

.wrap2 {
	width: 500px;
	height: 80px;
	border: 1px solid rgb(230, 230, 230);
	border-radius: 5px;
}

.align_center {
	width: 60px;
	height: 60px;
	margin: 30px 0px 25px 200px;
}

.color1{
	font-size: 1.2em;
    font-weight: bold;
    background: none;
}

.color2{
	background: none;
	font-size: 0.9em;
}

.mt-4 {
	margin-top: 2px!important;
}	

.mt-4, .my-4 {
	margin-top: 2px!important;
}

#label_name{
	font-size: 1.1em;
	color: #78c2ad;
}

#div_md{
	font-size: small;
    margin-top: 10px;
    color: #a1a1a1;
}
</style>


<div id="mytabs" class="div_main">
  <ul class="nav nav-tabs">
    <li class="nav-item"><a class="nav-link active" data-toggle="tab">프로필</a></li>
    <li class="nav-item"><a class="nav-link" data-toggle="tab">계정</a></li>
    <li class="nav-item"><a class="nav-link" data-toggle="tab">결제수단</a></li>
<%--     <li class="nav-item"><a class="nav-link" data-toggle="tab" onclick="listView('${sessionScope.userNo}')">결제수단</a></li> --%>
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
						style="width: 800px; margin-left: -30px; background: white; height: 600px;">
						<h2 class="widget_title">프로필사진
						</h2>
						<ul class="list cat-list">
							<li>
									<img src="${pageContext.request.contextPath}/assets/img/logo/user.png" 
	                                	alt="로그인" style="width: 40px;" >
							</li>
							<li>
								<div class="form-group">
									<label class="col-form-label col-form-label-sm mt-4" id="label_name">
									이름</label> 
									<input class="form-control form-control-sm" type="text" 
										name="userName" value="${vo.userName }">
								</div>
							</li>
							<li>
								<div class="form-group">
									<label class="col-form-label col-form-label-sm mt-4" id="label_name">
									이메일</label> 
									<input class="form-control form-control-sm" type="text" 
										name="userEmail" value="${vo.userEmail }">
								</div>
							</li>
							<li>
								<div class="form-group">
									<label class="col-form-label col-form-label-sm mt-4" id="label_name">
									연락처</label> 
									<input class="form-control form-control-sm" type="text"
										name="userHp" value="${vo.userHp }">
								</div>
							</li>
							<li>
								<div class="form-group" style="width: 500px;">
									<label class="col-form-label col-form-label-sm mt-4" id="label_name">
									소개</label>
									<div class="row">
										<div class="col-md-6" id="div_md">등록된 소개가 없습니다.</div>
										<div class="col-md-6 col-md-offset-6"><a href="#">+추가</a>
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="form-group" style="width: 500px;">
									<label class="col-form-label col-form-label-sm mt-4" id="label_name">
									웹사이트</label>
									<div class="row" >
										<div class="col-md-6" id="div_md">등록된 웹사이트가 없습니다.</div>
										<div class="col-md-6 col-md-offset-6">
											<a href="#">+추가</a></div>
									</div>
								</div>
							</li>
							<li>
								<div class="form-group" style="width: 500px;">
									<label class="col-form-label col-form-label-sm mt-4" id="label_name">
									프라이버시</label>
									<div class="form-check" style="margin-left: 5px;">
											<input class="form-check-input" type="checkbox" checked>
											<label class="form-check-label" style="font-size: 0.9em;">
												밀어준 프로젝트 목록을 공개합니다.</label>
									</div>
								</div>
							</li>
							<li>
								<div class="form-group">
									<button type="submit" class="genric-btn link-border circle"
										style="margin-left: -25px; font-size: initial;">변경하기</button>
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
						style="width: 800px; margin-left: -30px; background: white; height: 800px;">
						<h2 class="widget_title">비밀번호 변경</h2>
						<ul class="list cat-list">
							<li>
								<div class="form-group">
									<label class="col-form-label col-form-label-sm mt-4" id="label_name">
										현재 비밀번호</label> 
									<input class="form-control form-control-sm" type="password" 
										name="oldPwd" id="oldPwd">
									<p>비밀번호가 기억나지 않나요? <a href="#" style="color: rgb(39, 163, 255);">&nbsp 비밀번호 찾기</a></p>	
								</div>
							</li>
							<li>
								<div class="form-group">
									<label class="col-form-label col-form-label-sm mt-4" id="label_name">
										변경할 비밀번호</label> 
									<input class="form-control form-control-sm" type="password" 
										name="userPwd" id="userPwd">
									<label class="col-form-label col-form-label-sm mt-4" id="label_name">
										변경할 비밀번호 확인</label> 
									<input class="form-control form-control-sm" type="password"
										name="userPwd2" id="userPwd2">
								</div>
							</li>
							<li>
								<div class="form-group" style="width: 500px;">
									<label class="col-form-label col-form-label-sm mt-4" id="label_name">
									페이스북 계정 연동</label>
									<div class="row">
										<div class="col-md-6" id="div_md">연동된 페이스북 계정이 없습니다.</div>
										<div class="col-md-6 col-md-offset-6"><a href="#">+연동</a>
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="form-group" style="width: 500px;">
									<label class="col-form-label col-form-label-sm mt-4" id="label_name">
									네이버 계정 연동</label>
									<div class="row">
										<div class="col-md-6" id="div_md">연동된 네이버 계정이 없습니다.</div>
										<div class="col-md-6 col-md-offset-6"><a href="#">+연동</a>
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="form-group" style="width: 500px;">
									<label class="col-form-label col-form-label-sm mt-4" id="label_name">
									애플 계정 연동</label>
									<div class="row">
										<div class="col-md-6" id="div_md">연동된 애플 계정이 없습니다.</div>
										<div class="col-md-6 col-md-offset-6"><a href="#">+연동</a>
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="form-group">
									<button type="submit" class="genric-btn link-border circle" id="change"
										style="margin-left: -25px; font-size: initial;">
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
			<div>
			<a href="<c:url value='/cfmember/showAcc'/>">보기</a>
				<c:if test="${empty accList }">
					<div class="wrap">
							<img src="<c:url value='/assets/img/warning.png'/>"
								class="align_center">
							<div style="font-size: 0.9em; margin-left: 160px;">
							등록된 결제수단이 없습니다.<br>
							결제수단을 추가해주세요.
							</div>
					</div>
				</c:if>
				<c:if test="${!empty accList }">
					<c:forEach var="accVo" items="${accList }">
					<div class="wrap" style="height: 70px;">
						<div class="trand-right-single d-flex">
							<div class="trand-right-img">
								<img src="<c:url value='/assets/img/${accVo.bankName}.png'/>" 
									style="width: 80px; height: 25px; margin: 20px 20px;">
							</div>
							<div class="trand-right-cap" style="margin: 5px 0px; width: 370px;">
								<span class="color1">${accVo.bankName }</span><br> 
								<span class="color2">
									<c:set var="accNo" value="${accVo.accountNo }"/>
									**********${fn:substring(accNo,10,15) }
								</span>
								<a href="<c:url value='/cfmember/deleteAcc?accountNo=${accVo.accountNo}'/>" 
									class="trand-right-img" id="delete">
									<img src="<c:url value='/assets/img/cancel.png'/>" 
										style="width: 20px; margin: -30px 0px 0px 240px;" >
								</a>
							</div>
						</div>
					</div>
					</c:forEach>
				</c:if>
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
										<select class="form-select" id="exampleSelect2" name="bankName" style="padding: 0 0;">
											<option value="국민은행">국민은행</option>
											<option value="신한은행">신한은행</option>
											<option value="우리은행">우리은행</option>
											<option value="하나은행">하나은행</option>
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
												<a target="_blank" href="<c:url value='/cfmember/agree'/>">
												내용보기</a></span>
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
			<div id="show_content">
			<a href="<c:url value='/cfmember/selectAddress'/>" id="content">보기</a>
				<c:if test="${empty delList }">
					<div class="wrap">
							<img src="<c:url value='/assets/img/warning.png'/>"
								class="align_center">
							<div style="font-size: 0.9em; margin-left: 160px;">
							등록된 배송지가 없습니다.<br>
							배송지를 추가해주세요.
							</div>
					</div>
				</c:if>
				<c:if test="${!empty delList }">
					<c:forEach var="delVo" items="${delList }">
					<div class="wrap" style="height: 120px;">
						<div class="trand-right-single d-flex">
							<div class="trand-right-cap" style="margin: 15px 25px; width: 445px;">
								<span class="color1">${delVo.delReceiver }</span><br> 
								<span class="color2">[${delVo.delZipcode}]&nbsp ${delVo.delAddress}</span><br>
								<span class="color2">${delVo.delHp}</span>
								<a href="<c:url value='/cfmember/deleteAddress?delNo=${delVo.delNo}'/>" 
									class="trand-right-img" id="delete">
									<img src="<c:url value='/assets/img/cancel.png'/>" 
										style="width: 20px; margin: -50px 0px 0px 310px;" >
								</a>
							</div>
						</div>
					</div>
					</c:forEach>
				</c:if>
			</div>
			<!-- Modal -->
			<form name="frmAccount" method="post" action="<c:url value='/cfmember/insertAddress'/>">
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
										<input type="text" class="form-control" name="delReceiver"
											placeholder="받는 분 성함을 입력해주세요.">
									</div>
									<div class="form-group" style="width: 450px; margin: 3px;">
										<label class="form-label mt-4">주소</label>
									<div class="form-group">
										<div class="input-group mb-3">
											<span class="input-group-append">
											<input type="text" class="form-control" placeholder="주소검색" 
												id="address" name="delAddress" style="width: 420px;">
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
										<input type="text" class="form-control" name="delZipcode" id="zipNo">
									</div>
									<div class="form-group" style="width: 450px; margin: 3px;">
										<label class="form-label mt-4">받는사람 휴대폰 번호</label> 
										<input type="text" class="form-control" name="delHp"
											placeholder="받는 분 휴대폰번호를 입력해주세요.">
									</div>
									<div class="form-group" style="width: 400px; margin: 10px 5px;">
										<div class="form-check">
											<input class="form-check-input" type="checkbox" checked>
											<label class="form-check-label" style="font-size: 0.9em;">
												기본 배송지로 등록</label>
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
    </div><!-- 탭4 -->
    
    <div class="tab-pane fade">
			<div class="col-lg-4">
				<div class="blog_right_sidebar">
					<div class="single_sidebar_widget post_category_widget"
						style="width: 800px; margin-left: -30px; background: white; height: 800px;">
						<ul class="list cat-list">
							<li>
								<div class="form-group" style="width: 500px;">
									<label class="col-form-label col-form-label-sm mt-4" id="label_name">
									메시지</label>
									<div class="form-check" style="margin-left: 5px;">
											<input class="form-check-input" type="checkbox" checked>
											<label class="form-check-label" style="font-size: 0.9em;">
												새 메시지 알림을 이메일로 수신합니다.</label>
									</div>
								</div>
							</li>
							<li>
								<div class="form-group" style="width: 500px;">
									<label class="col-form-label col-form-label-sm mt-4" id="label_name">
									프로젝트 업데이트</label>
									<div class="form-check" style="margin-left: 5px;">
											<input class="form-check-input" type="checkbox" checked>
											<label class="form-check-label" style="font-size: 0.9em;">
												프로젝트 업데이트 알림을 이메일로 수신합니다.</label>
									</div>
								</div>
							</li>
							<li>
								<div class="form-group" style="width: 500px;">
									<label class="col-form-label col-form-label-sm mt-4" id="label_name">
									팔로우</label>
									<div class="form-check" style="margin-left: 5px;">
											<input class="form-check-input" type="checkbox" checked>
											<label class="form-check-label" style="font-size: 0.9em;">
												팔로우한 사용자의 프로젝트 공개 알림을 이메일로 수신합니다.</label>
									</div>
								</div>
							</li>
							<li>
								<div class="form-group" style="width: 500px;">
									<label class="col-form-label col-form-label-sm mt-4" id="label_name">
									마케팅</label>
									<div class="form-check" style="margin-left: 5px;">
											<input class="form-check-input" type="checkbox" > 
											<label class="form-check-label" for="flexCheckDefault" style="font-size: 0.9em;">
												텀블벅 신규 콘텐츠 및 프로젝트 추천 알림을 이메일로 수신하지 않습니다.</label>
									</div>
								</div>
							</li>
							<li>
								<div class="form-group">
									<button type="submit" class="genric-btn link-border circle" id="change"
										style="margin-left: -25px; font-size: initial;">
										변경하기</button>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>	
    </div><!-- 탭5 -->
 
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
		});
		
		$("#mytabs>ul>li>a").each(function(i){$(this).attr("href","#mytab"+i)})
		$("#mytabs>div>div").each(function(i){$(this).attr("id","mytab"+i)})
	
		/* 	
		//ajax
		$('#content').click(function(){
			$.ajax({
				url="<c:url value='/cfmember/selectAddress'/>",
				type="GET",
				dataType:"json",
				success:function(res){
					if(res.length>0){
						$('#show_content').empty();
						alert('리스트 소환!');
						
						var result="";
						$.each(res,function(idx, item){
							result+= "<p>" + item.delReceiver + ", "
							+ item.delZipcode  + ", "
							+ item.delAddress  + ", "
							+ item.delHp + + "</p>";
						});
						$('#show_content').append(result);
					}
				},
				error:function(xhr, status, error){
					alert("error발생.. " + error);
				}
			});
		});
		 */
});
	
	function goPopup(){
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("<c:url value='/cfmember/jusoPopup'/>","pop",
				"width=500, height=400, top=220, left=550, scrollbars=yes, resizable=yes"); 
	}


	function jusoCallBack(roadFullAddr,zipNo){
			var addressEl = document.querySelector("#address");
			addressEl.value = roadFullAddr;
			
			var zipNoEl = document.querySelector("#zipNo");
			zipNoEl.value = zipNo;
	}	// 주소 API
	
/* 	function listView(userNo){
	    let f = document.createElement('form');
	    
	    let obj;
	    obj = document.createElement('input');
	    obj.setAttribute('type', 'hidden');
	    obj.setAttribute('name', 'userid');
	    obj.setAttribute('value', userNo);
	    
	    f.appendChild(obj);
	    f.setAttribute('method', 'post');
	    f.setAttribute('action', '<c:url value="/cfmember/showAcc"/>');
	    document.body.appendChild(f);
	    f.submit();
	} */
</script>
<%@ include file="../include/bottom.jsp" %> 