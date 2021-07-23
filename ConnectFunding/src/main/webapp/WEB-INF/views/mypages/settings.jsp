<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/ssong.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
<!--
<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="../_assets/css/custom.min.css">
<link rel="stylesheet" href="../_vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="../_vendor/prismjs/themes/prism-okaidia.css">
  -->
<title>마이페이지</title>
<style type="text/css">
.col-12 {
	margin-left: 20px;
}
</style>
	<div class="single_sidebar_widget post_category_widget"
		style="width:980px; margin-left: 200px; background: white; height: 1000px; margin-top: 50px;">
		<span class="widget_title"
			style="text-align: left; font-size: 2.5em; margin-left: 10px;">설정</span>
		<br>
		<br>
		<br>
	
		<div>
			<div class="col-lg-9 col-md-9">
				<div class="properties__button">
					<!--Nav Button  -->
					<nav>
						<div class="nav nav-tabs" id="nav-tab" role="tablist" style="width: 750px;">
							<a class="nav-item nav-link active" id="nav-profiles-tab" data-toggle="tab" 
								href="#nav-profiles" role="tab" aria-controls="nav-profiles" aria-selected="true">
							프로필</a>
							<a class="nav-item nav-link" id="nav-accounts-tab" data-toggle="tab"
								href="#nav-accounts" role="tab" aria-controls="nav-accounts" aria-selected="false">
							계정</a>
							<a class="nav-item nav-link" id="nav-paymethods-tab" data-toggle="tab" href="#nav-paymethods"
								role="tab" aria-controls="nav-paymethods" aria-selected="false">
							결제수단</a>
							<a class="nav-item nav-link" id="nav-addresses-tab" data-toggle="tab" href="#nav-addresses" 
								role="tab" aria-controls="nav-addresses" aria-selected="false">
							배송지</a>
                            <a class="nav-item nav-link" id="nav-notifications" data-toggle="tab" href="#nav-nav-notifications" 
                            	role="tab" aria-controls="nav-notifications" aria-selected="false">
                            알림</a>
						</div>
					</nav>
					<!--End Nav Button  -->
				</div>
			</div>
			</div>
			<div class="row">
				<div class="col-12">
					<!-- Nav Card -->
					<div class="tab-content" id="nav-tabContent">
						<!-- card one -->
						<div class="tab-pane fade show active" id="nav-profiles"
							role="tabpanel" aria-labelledby="nav-profiles-tab">
							<div class="whats-news-caption" id="one">
								<form method="post" action="<c:url value='/mypages/update?userNo=${sessionScope.userNo}'/>">
								<div class="col-lg-4">
									<div class="blog_right_sidebar">
										<div class="single_sidebar_widget post_category_widget"
											style="width: 800px; margin-left: -20px; background: white; height: 700px;">
											<ul class="list cat-list">
												<li><img
													src="${pageContext.request.contextPath}/assets/img/logo/user.png"
													alt="로그인" style="width: 40px;"></li>
												<li>
													<div class="form-group">
														<label class="col-form-label col-form-label-sm mt-4"
															id="label_name"> 이름</label> 
															<input class="form-control form-control-sm" type="text"
															name="userName" disabled="disabled" value="${vo.userName }">
													</div>
												</li>
												<li>
													<div class="form-group">
														<label class="col-form-label col-form-label-sm mt-4"
															id="label_name"> 이메일</label> <input
															class="form-control form-control-sm" type="text"
															name="userEmail" value="${vo.userEmail }">
													</div>
												</li>
												<li>
													<div class="form-group">
														<label class="col-form-label col-form-label-sm mt-4"
															id="label_name"> 연락처</label> <input
															class="form-control form-control-sm" type="text"
															name="userHp" value="${vo.userHp }">
													</div>
												</li>
												<li>
													<div class="form-group" style="width: 500px;">
														<label class="col-form-label col-form-label-sm mt-4"
															id="label_name"> 소개</label>
														<div class="row">
															<div class="col-md-6" id="div_md">등록된 소개가 없습니다.</div>
															<div class="col-md-6 col-md-offset-6">
																<a href="#">+추가</a>
															</div>
														</div>
													</div>
												</li>
												<li>
													<div class="form-group" style="width: 500px;">
														<label class="col-form-label col-form-label-sm mt-4"
															id="label_name"> 웹사이트</label>
														<div class="row">
															<div class="col-md-6" id="div_md">등록된 웹사이트가 없습니다.</div>
															<div class="col-md-6 col-md-offset-6">
																<a href="#">+추가</a>
															</div>
														</div>
													</div>
												</li>
												<li>
													<div class="form-group" style="width: 500px;">
														<label class="col-form-label col-form-label-sm mt-4"
															id="label_name"> 프라이버시</label>
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
						</div>
						<!-- Card two -->
						<div class="tab-pane fade" id="nav-accounts" role="tabpanel"
							aria-labelledby="nav-accounts-tab">
							<div class="whats-news-caption" id="two">
								<form method="post" name="frmPwd" id="frmPwd"
									action="<c:url value='/mypages/pwdUpdate?userNo=${sessionScope.userNo}'/>">
								<div class="col-lg-4">
									<div class="blog_right_sidebar">
										<div class="single_sidebar_widget post_category_widget"
											style="width: 800px; margin-left: -20px; background: white; height: 800px;">
											<h2 class="widget_title">비밀번호 변경</h2>
											<ul class="list cat-list">
												<li>
													<div class="form-group">
														<label class="col-form-label col-form-label-sm mt-4"
															id="label_name"> 현재 비밀번호</label> <input
															class="form-control form-control-sm" type="password"
															name="oldPwd" id="oldPwd">
														<p>
															비밀번호가 기억나지 않나요? <a href="#"
																style="color: rgb(39, 163, 255);">&nbsp 비밀번호 찾기</a>
														</p>
													</div>
												</li>
												<li>
													<div class="form-group">
														<label class="col-form-label col-form-label-sm mt-4"
															id="label_name"> 변경할 비밀번호</label> <input
															class="form-control form-control-sm" type="password"
															name="userPwd" id="userPwd"> <label
															class="col-form-label col-form-label-sm mt-4"
															id="label_name"> 변경할 비밀번호 확인</label> <input
															class="form-control form-control-sm" type="password"
															name="userPwd2" id="userPwd2">
													</div>
												</li>
												<li>
													<div class="form-group" style="width: 500px;">
														<label class="col-form-label col-form-label-sm mt-4"
															id="label_name"> 페이스북 계정 연동</label>
														<div class="row">
															<div class="col-md-6" id="div_md">연동된 페이스북 계정이 없습니다.</div>
															<div class="col-md-6 col-md-offset-6">
																<a href="#">+연동</a>
															</div>
														</div>
													</div>
												</li>
												<li>
													<div class="form-group" style="width: 500px;">
														<label class="col-form-label col-form-label-sm mt-4"
															id="label_name"> 네이버 계정 연동</label>
														<div class="row">
															<div class="col-md-6" id="div_md">연동된 네이버 계정이 없습니다.</div>
															<div class="col-md-6 col-md-offset-6">
																<a href="#">+연동</a>
															</div>
														</div>
													</div>
												</li>
												<li>
													<div class="form-group" style="width: 500px;">
														<label class="col-form-label col-form-label-sm mt-4"
															id="label_name"> 애플 계정 연동</label>
														<div class="row">
															<div class="col-md-6" id="div_md">연동된 애플 계정이 없습니다.</div>
															<div class="col-md-6 col-md-offset-6">
																<a href="#">+연동</a>
															</div>
														</div>
													</div>
												</li>
												<li>
													<div class="form-group">
														<button type="submit" class="genric-btn link-border circle"
															id="change"
															style="margin-left: -25px; font-size: initial;">
															변경하기</button>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</form>
							</div>
						</div>
						
						<!-- Card three -->
						<div class="tab-pane fade" id="nav-paymethods" role="tabpanel"
							aria-labelledby="nav-paymethods-tab">
							<div class="row" style="margin-top: 20px;">
								<div class="col-md-6" style="width: 10px; height: 50px;">등록된 결제수단</div>
								<div class="col-md-6 col-md-offset-6">
									<a href="#" data-toggle="modal" data-target="#myModal"
										style="color: rgb(39, 163, 255); margin-left: 270px;">+추가</a>
								</div>
							</div>
							<div class="whats-news-caption" id="three">
								<!-- mypageload.account.jsp -->
							</div>
							<!-- Modal -->
							<form name="frmAccount" method="post"
								action="<c:url value='/mypages/addAcc'/>">
								<div class="modal fade" id="staticBackdrop"
									data-backdrop="static" tabindex="-1" role="dialog"
									aria-labelledby="staticBackdropLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="staticBackdropLabel">은행계좌 등록</h5>
												<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
												</button>
											</div>
											<!-- 계좌등록 form -->
											<div class="modal-body">
												<!-- 모달 body -->
												<input type="hidden" name="userNo"
													value="${sessionScope.userNo }">
												<div class="form-group" style="width: 450px; margin: 3px;">
													<label class="form-label mt-4">계좌번호</label> <input
														type="text" class="form-control" 
														name="accountNo" id="accountNo"
														placeholder="-를 포함해서 입력해주세요.">
												</div>
												<div class="form-group" style="width: 450px; margin: 3px;">
													<label for="exampleSelect2" class="form-label mt-4">결제은행</label>
													<select class="form-select" id="exampleSelect2"
														name="bankName" style="padding: 0 0;">
														<option value="국민은행">국민은행</option>
														<option value="신한은행">신한은행</option>
														<option value="우리은행">우리은행</option>
														<option value="하나은행">하나은행</option>
														<option value="우체국">우체국</option>
													</select>
												</div>
												<div class="form-group" style="margin-left: 10px;"width: 450px; margin: 3px;">
													<div class="form-check">
														<input class="form-check-input" type="checkbox"
															id="flexCheckDefault"> <label
															class="form-check-label" for="flexCheckDefault"
															style="font-size: 0.9em;"> 사업자 계좌입니다. </label>
													</div>
												</div>
												<div class="row" style="width: 480px;">
													<div class="col-md-6">
														<label class="form-label mt-6">예금주명</label> <input
															type="text" class="form-control" name="accountHolder"
															id="accountHolder" placeholder="예금주 명을 입력해주세요.">
													</div>
													<div class="col-md-6 col-md-offset-6">
														<label class="form-label mt-6" style="color: black">예금주
															생년월일</label> <input type="text" class="form-control" name="birth" 
															id="birth" placeholder="예) 2000-01-01">
													</div>
												</div>
												<div class="form-group"
													style="width: 400px; margin: 10px 5px;">
													<div class="form-check" style="position: relative;">
														<input class="form-check-input" type="checkbox">
														<label class="form-check-label" for="flexCheckDefault"
															style="font-size: 0.9em;"> 결제사 정보제공 동의</label> <span
															style="position: absolute; right: -40px; font-size: 0.9em; color: rgb(39, 163, 255);">
															<a target="_blank"
															href="<c:url value='/cfmember/agree'/>"> 내용보기</a>
														</span>
													</div>
													<div class="form-check">
														<input class="form-check-input" type="checkbox"
															id="flexCheckChecked" checked> <label
															class="form-check-label" for="flexCheckChecked"
															style="font-size: 0.9em;"> 기본 결제수단으로 등록</label>
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="submit" class="genric-btn warning circle"
													id="addacc" style="width: 480px;">등록 완료</button>
											</div>
										</div>
									</div>
								</div>
								<!-- 모달 -->
							</form>
						</div>
						
						<!-- Card four -->
						<div class="tab-pane fade" id="nav-addresses" role="tabpanel"
							aria-labelledby="nav-addresses-tab">
							<div class="row" style="margin-top: 20px;">
								<div class="col-md-6" style="width: 10px; height: 50px;">등록된 배송지</div>
								<div class="col-md-6 col-md-offset-6">
									<a href="#" data-toggle="modal" data-target="#myModal"
										style="color: rgb(39, 163, 255); margin-left: 270px;">+추가</a>
								</div>
							</div>
							<div class="whats-news-caption" id="four">
								<!-- mypageload.address.jsp -->
							</div>
							<!-- Modal -->
							<form name="frmAccount" method="post" action="<c:url value='/mypages/insertAddress'/>">
								<div class="modal fade" id="myModal" data-backdrop="static" tabindex="-1" role="dialog"
									aria-labelledby="staticBackdropLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="staticBackdropLabel">배송지 추가</h5>
												<button type="button" class="btn-close" data-dismiss="modal"
													aria-label="Close">
												</button>
											</div>
											<!-- 주소등록 form -->
											<div class="modal-body">
												<!-- 모달 body -->
												<input type="hidden" name="userNo"
													value="${sessionScope.userNo }">
												<div class="form-group" style="width: 450px; margin: 3px;">
													<label class="form-label mt-4">받는사람</label> <input
														type="text" class="form-control" name="delReceiver"
														id="delReceiver" placeholder="받는 분 성함을 입력해주세요.">
												</div>
												<div class="form-group" style="width: 450px; margin: 3px;">
													<label class="form-label mt-4">주소</label>
													<div class="form-group">
														<div class="input-group mb-3">
															<span class="d-flex"> <input
																type="text" class="form-control" placeholder="주소검색"
																id="address" name="delAddress" disabled="disabled" 
																style="width: 420px;">
																<button class="btns" type="button" onclick="goPopup()"
																	style="background: none; border: 1px; color: black;">
																	<i class="fas fa-search special-tag"></i>
																</button>
															</span>
														</div>
													</div>
												</div>
												<div class="form-group" style="width: 450px; margin: 3px;">
													<label class="form-label mt-4">우편번호</label> <input
														type="text" class="form-control" name="delZipcode"
														id="zipNo" disabled="disabled">
												</div>
												<div class="form-group" style="width: 450px; margin: 3px;">
													<label class="form-label mt-4">받는사람 휴대폰 번호</label> <input
														type="text" class="form-control" name="delHp" id="delHp"
														placeholder="받는 분 휴대폰번호를 입력해주세요.">
												</div>
												<div class="form-group"
													style="width: 400px; margin: 10px 5px;">
													<div class="form-check">
														<input class="form-check-input" type="checkbox" checked>
														<label class="form-check-label" style="font-size: 0.9em;">
															기본 배송지로 등록</label>
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="submit" class="genric-btn warning circle"
													id="addjuso" style="width: 480px;">등록 완료</button>
											</div>
										</div>
									</div>
								</div>
								<!-- 모달 -->
							</form>
						</div>
						
						<!-- Card five -->
						<div class="tab-pane fade" id="nav-nav-notifications" role="tabpanel"
							aria-labelledby="nav-notifications-tab">
							<div class="whats-news-caption" id="five">
									<div class="blog_right_sidebar">
										<div class="single_sidebar_widget post_category_widget"
											style="width: 800px; margin-left: -30px; background: white; height: 800px;">
											<ul class="list cat-list">
												<li>
													<div class="form-group" style="width: 500px;">
														<label class="col-form-label col-form-label-sm mt-4"
															id="label_name"> 메시지</label>
														<div class="form-check" style="margin-left: 5px;">
															<input class="form-check-input" type="checkbox" checked>
															<label class="form-check-label" style="font-size: 0.9em;">
																새 메시지 알림을 이메일로 수신합니다.</label>
														</div>
													</div>
												</li>
												<li>
													<div class="form-group" style="width: 500px;">
														<label class="col-form-label col-form-label-sm mt-4"
															id="label_name"> 프로젝트 업데이트</label>
														<div class="form-check" style="margin-left: 5px;">
															<input class="form-check-input" type="checkbox" checked>
															<label class="form-check-label" style="font-size: 0.9em;">
																프로젝트 업데이트 알림을 이메일로 수신합니다.</label>
														</div>
													</div>
												</li>
												<li>
													<div class="form-group" style="width: 500px;">
														<label class="col-form-label col-form-label-sm mt-4"
															id="label_name"> 팔로우</label>
														<div class="form-check" style="margin-left: 5px;">
															<input class="form-check-input" type="checkbox" checked>
															<label class="form-check-label" style="font-size: 0.9em;">
																팔로우한 사용자의 프로젝트 공개 알림을 이메일로 수신합니다.</label>
														</div>
													</div>
												</li>
												<li>
													<div class="form-group" style="width: 500px;">
														<label class="col-form-label col-form-label-sm mt-4"
															id="label_name"> 마케팅</label>
														<div class="form-check" style="margin-left: 5px;">
															<input class="form-check-input" type="checkbox"> <label
																class="form-check-label" for="flexCheckDefault"
																style="font-size: 0.9em;"> 텀블벅 신규 콘텐츠 및 프로젝트 추천
																알림을 이메일로 수신하지 않습니다.</label>
														</div>
													</div>
												</li>
												<li>
													<div class="form-group">
														<button type="submit" class="genric-btn link-border circle"
															id="change" style="margin-left: -25px; font-size: initial;">
															변경하기</button>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<!-- 탭5 -->
							</div>
						</div>
					</div><!-- tab전체 -->
				</div>
		<!--  -->
</main>
<script type="text/javascript">
	$(document).ready(function(){
		
		$('#nav-paymethods-tab').click(function(){
			$('#three').load('${pageContext.request.contextPath}/mypageload/account');
		});
		
		$('#nav-addresses-tab').click(function(){
			$('#four').load('${pageContext.request.contextPath}/mypageload/address');
		});

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
		
		$('#addacc').on("click",function(e) {
			e.preventDefault();
			if ($('#accountNo').val().length < 1) {
				alert('계좌번호를 입력하세요.');
				$('#accountNo').focus();
				event.preventDefaulut();
			} else if ($('#accountHolder').val().length < 1) {
				alert('예금주명을 입력하세요.');
				$('#accountHolder').focus();
				event.preventDefaulut();
			} else if ($('#birth').val().length < 1) {
				alert("생년월일을 입력하세요.");
				$('#birth').focus();
				event.preventDefaulut();
			}
		});
		
		$('#addjuso').on("click",function(e) {
			e.preventDefault();
			if ($('#delReceiver').val().length < 1) {
				alert('받는사람을 입력하세요.');
				$('#delReceiver').focus();
				event.preventDefaulut();
			} else if ($('#address').val().length < 1) {
				alert('주소검색을 해주세요.');
				$('#address').focus();
				event.preventDefaulut();
			} else if ($('#delHp').val().length < 1) {
				alert("연락처를 입력하세요.");
				$('#delHp').focus();
				event.preventDefaulut();
			}
		});
		
	});//
	
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
</script>	
<%@ include file="../include/bottom.jsp"%>
