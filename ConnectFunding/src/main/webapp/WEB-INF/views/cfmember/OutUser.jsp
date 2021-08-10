<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커넥트펀딩 회원탈퇴</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
.dll dt{
	border-top:1px solid #eaeaea; 
	padding-top: 20px;
	font-size: 0.9em;
	color: black;
}

.dll dd{
	padding-bottom: 20px;
	font-size: 0.9em;
}
</style>
</head>
<body>
    <header>
	    <!-- Logo -->
        <div class="logo" style="border-bottom: 1px solid #eaeaea;">
        	<br>
            <a href="${pageContext.request.contextPath}">
            <img src="${pageContext.request.contextPath}/assets/img/logo/logo.png" 
            	style=" margin-left: 50px;" alt="로고"></a>
        	<br><br></br>
        </div>
	</header>		
	<main style="height: auto; min-height: 800px;">
		<div class="wrap" style="margin: 0 auto; margin-left: 300px;">
		    <br><h1>회원 탈퇴</h1><br>
		    <p><strong>${sessionScope.userName }</strong>님, 커넥트 펀딩을 이용하시는데 혹시 아래와 같은 불편함이 있으셨으면, 아래 방법을 한번 이용해보세요.</p>
			<div style="width: 840px; border: 1px solid #eaeaea; padding: 10px 30px; background: #ecf4ff;">
		    	<dl style="font-size: 0.9em;">
			        <dt>문자 메시지 / 이메일 수신이 불편하신가요?</dt>
			        <dt>수신거부는 MY 정보설정 &gt; <a href="/web/waccount/wAccountUpdateBasicInfo">기본 정보 설정</a>에서 하실 수 있습니다.</dt>
			       	<br>
			        <dt>투자회원 가입 시 업로드한 개인 신분증 때문에 불편하신가요?</dt>
			        <dt>커넥트 펀딩에서는 실명인증 확인 후, 24시간 이내 즉시 파기하고 있습니다.</dt>
			        <br>
			        <dt>기타 불편한 사항이 있으시면 언제든 커넥트 펀딩에게 알려주세요.</dt>
			        <dt>
			        <a href="#" data-intercom-message="회원 탈퇴 관련 질문">커넥트펀딩에 문의하기</a> ㅣ  1004-1004 ㅣ 카카오톡 친구추가 ‘커넥트펀딩’ ㅣ connect@cf</dt>
				</dl>
			</div>
			<br><br>
		    <h3>어떤 점이 불편하셨나요?</h3>
		    <p>커넥트펀딩을 이용하면서 불편했던 점을 말씀해주시면, 커넥트 펀딩의 서비스 개선에 참고하도록 하겠습니다.</p>
				<div class="form-group">
					<select class="form-select" id="exampleSelect1" style="width: 500px;">
						<option value="">탈퇴사유는 무엇인가요?</option>
						<option>재 가입을 위해</option>
						<option>콘텐츠 품질과 서비스 정보 부족</option>
						<option>고객 서비스의 불만</option>
						<option>커넥트펀딩 진행안내 및 메이커 새소식 수신거부</option>
						<option>커넥트펀딩 광고 SMS, EMAIL수신거부</option>
						<option>시스템 장애 (속도, 잦은 장애)</option>
						<option>개인 정보 (통신 및 신용정보 등) 노출 우려</option>
						<option value="etc">기타</option>
					</select>
				</div>
			<br><br>	
			<h3>탈퇴 전, 꼭 확인하세요!</h3>
			<p style="font-size: 0.9em;">탈퇴 전 반드시 아래 유의 사항을 확인하시기 바랍니다.<br>
			<strong style="color: red;">참여∙모집 중인 프로젝트가 있을때 또는 커넥트펀딩 계좌에 예치금이 남았을 경우 탈퇴가 불가능합니다.</strong></p><br>
				<dl style="width: 700px;" class="dll">
					<dt>탈퇴 후 3개월 내 재가입 불가</dt>
					<dd style="">탈퇴 후 3개월 내 동일 아이디(이메일)로 재가입 불가</dd>
					<dt>커넥트펀딩 계좌개설 되어있는 경우 탈퇴 후 3개월 내 동일한 실명정보로 계좌개설 불가</dt>
					<dd>커넥트펀딩 계좌가 있어야만 이용 가능한 투자 신청 이용 불가 </dd>
					<dt>탈퇴 후 재가입 시 신규 회원혜택 제한</dt>
					<dd>재가입 후 신규 회원혜택 및 제휴 프로모션 관련 혜택 지급 불가</dd>
					<dt>탈퇴 후 개인 정보 일괄 삭제</dt>
					<dd>참여한/찜 한/개설 중인 프로젝트 및 쿠폰, 포인트 등 개인 정보 일괄 삭제</dd>
					<dt>커넥트펀딩 내 모든 서비스에서 탈퇴</dt>
					<dd>펀딩, 투자, 스타트업 찾기 등 커넥트펀딩 회원으로서 이용하던 서비스 모두 이용 불가</dd>
					<dt>탈퇴 후 작성한 게시물은 삭제 불가</dt>
					<dd>게시글, 댓글, 펀딩한 프로젝트의 투자 리스트에 남겨진 이름 등 삭제 불가</dd>
					<dt>미상환 투자금 환급 불이익 감수</dt>
					<dd style="border-bottom:1px solid #eaeaea; ">아직 상환되지 않은 투자금이 있을때, 투자금을 돌려받지 못할 불이익과 위험 감수</dd>
				</dl>
			<div id="delcheck">
				<p>
				<label class="form-check-label" for="flexSwitchCheckDefault">
					<input class="form-check-input" type="checkbox" id="outcheck">
					<span style="font-size: 0.9em;">커넥트 펀딩 탈퇴 시 유의 사항을 확인하였습니다.</span>
				</label>
				</p>
			</div>
			<br>
			<h3>본인 확인</h3>
			<p>안전한 탈퇴를 위해 본인 인증 절차를 진행합니다. 가입 이메일과 비밀번호를 입력하세요.</p>
			<div style="width: 500px;">
			<form method="post" name="frmOut" action="${pageContext.request.contextPath}/cfmember/outUser">
				<div class="form-group">
					<label for="exampleInputEmail1" class="form-label mt-4">이메일 주소</label>
					<input type="email" class="form-control" name="userEmail" id="userEmail"
						placeholder="이메일 주소를 입력하세요.">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1" class="form-label mt-4">비밀번호</label>
					<input type="password" class="form-control" name="userPwd" id="userPwd"
						placeholder="비밀번호를 입력하세요.">
				</div>
				<br>
				<button type="submit" class="btn btn-primary" id="delete">탈퇴하기</button>
			</form>
			</div>

		</div>
		<br><br><br>
		<footer>
			<div style="height: 100px; background: black;">
				<p style="text-align: center; padding-top: 35px;">
				Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | Connect Funding &nbsp<i class="ti-heart" aria-hidden="true"></i></a>
				</p>
				</div>
		</footer>
	</main> 
<script type="text/javascript">
$(document).ready(function(){
	$('#delete').on("click",function() {
		var leng = $('#delcheck input[type=checkbox]:checked').length;
		if ($('#userEmail').val().length < 1) {
			alert('이메일을 입력하세요.');
			$('#inputEmail').focus();
			event.preventDefault();
		} else if ($('#userPwd').val().length < 1) {
			alert('비밀번호를 입력하세요.');
			$('#inputPassword').focus();
			event.preventDefault();
		} else if(leng==0){
			alert('탈퇴 시 유의 사항을 확인해주세요.');
			event.preventDefault();
		}else{
			if(!confirm('정말 회원탈퇴하시겠습니까?')){
				event.preventDefault();
			}
		}
	});
});
</script>
</body>
</html>