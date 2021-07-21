<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제사 정보제공 안내</title>
<style type="text/css">
.back {
	background: linear-gradient(to right, #ff0a8d, #ffa605);
	position: fixed;
	top: 0;
	right: 0;
	left: 0;
	height: 250px;
}

.back_1 {
	margin: 15px 100px;
	width: 960px;
	color: white;
}

.back_1-2{
	display: table-cell;
    vertical-align: middle;
}

.main{
    margin-top: 300px;
    margin-left: 100px;
}

.b_main{
	height: 200px;
}

.list{
	margin: 5px 5px;
}

.generic-blockquote {
    padding: 30px 50px 30px 30px;
    background: #f9f9ff;
    border-left: 2px solid #222;
}
</style>
</head>
<body>
	<header class="back">
		<div class="back_1">
			<div class="back_1-2">
				<p style="font-size: 2.8em;">결제사 정보제공 안내</p>
				<p>관계법령에 따라 소비자 정보를 아래처럼 결제 대행사에 제공합니다.</p>
			</div>
		</div>
	</header>
	
	<section class="main">
		<div class="b_main">
			<h1>신용카드</h1>
			<dl>
				<dt class="list"><strong>정보 수신자</strong> 나이스정보통신 주식회사</dt>
				<dt class="list"><strong>문의</strong> 02 6080 0760, 커넥트펀딩(주)</dt>
				<dt class="list"><strong>제공 정보</strong> 카드 번호, 유효기간, 생년월일, 카드 비밀번호 앞 2자리</dt>
				<dt class="list"><strong>이용 목적</strong> 결제 처리 및 대금 청구</dt>
				<dt class="list"><strong>이용기간</strong> 5년 (금융감독원 규정에 의거 5년 간 의무보관)</dt>
			</dl>
		</div>

		<div class="b_main">
			<h1>계좌이체</h1>
			<dl>
				<dt class="list"><strong>정보 수신자</strong> (주)효성 CMS, 나이스신용평가정보</dt>
				<dt class="list"><strong>문의</strong> 02 6080 0760, 커넥트펀딩(주)</dt>
				<dt class="list"><strong>제공 정보</strong> 계좌번호, 은행, 예금주 성명, 주민등록번호(사업자등록번호)</dt>
				<dt class="list"><strong>이용 목적</strong> 결제 처리 및 대금 청구</dt>
				<dt class="list"><strong>이용기간</strong> 5년 (금융감독원 규정에 의거 5년 간 의무보관)</dt>
			</dl>
		</div>
		
		<div class="b_main">
			<h1>관계법령</h1>
			<div class="row">
				<div class="col-lg-12">
					<blockquote class="generic-blockquote">
						<h3>정보통신망 이용촉진 및 정보보호등에 관한 법률</h3><br>
						<span>
							제 22조 (개인정보의 수집 이용 동의 등)
						</span>
						<h4>
						정보통신서비스 제공자는 다음 각 호의 어느 하나에 해당하는 경우에는 제1항에 따른 동의 없이 이용자의 개인정보를 수집·이용할 수 있다.
						</h4>
						<ol	start="2">
							<li>
							<small>정보통신서비스의 제공에 따른 요금정산을 위하여 필요한 경우</small>
							</li>
						</ol>
					</blockquote>
				</div>
			</div>		
			<div class="row">
				<div class="col-lg-12">
					<blockquote class="generic-blockquote">
						<h3>전자상거래등에서의 소비자보호에관한법률</h3><br>
						<span>
							제 21조 (금지행위)
						</span>
						<h4>
						전자상거래를 행하는 사업자 또는 통신판매업자는 다음 각호의 1에 해당하는 행위를 하여서는 아니된다.
						</h4>
						<ol	start="6">
							<li>
							본인의 허락을 받지 아니하거나 허락 받은 범위를 넘어 소비자에 관한 정보를 이용하는 행위. 다만, 다음 각목의 1에 해당하는 경우를 제외한다.
							</li>
							<li>
							<small>나. 재화등의 거래에 따른 대금정산을 위하여 필요한 경우</small>
							</li>
						</ol>
					</blockquote>
				</div>
			</div>		
		</div>
	</section>	
	<footer style="height: 50px; position: relative; top: 450px;">
		<div></div>
	</footer>
</body>
</html>