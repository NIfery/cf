<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/ssong.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
.has-search .form-control {
	padding-left: 2.375rem;
}

.has-search .form-control-feedback {
	position: absolute;
	z-index: 2;
	display: block;
	width: 2.375rem;
	height: 2.375rem;
	line-height: 2.375rem;
	text-align: center;
	pointer-events: none;
	color: #aaa;
}

.div_1 {
	padding: 0px 16px;
	display: flex;
	flex-direction: column;
	-webkit-box-pack: center;
	justify-content: center;
	-webkit-box-align: center;
	align-items: center;
	height: 300px;
	margin-top: 70px;
}
</style>

<div class="single_sidebar_widget post_category_widget"
	style="width: 1000px; margin-left: 200px; background: white; height: auto; margin-top: 30px; min-height: 700px; ">
	<span class="widget_title"
		style="text-align: left; font-size: 2.5em; margin-left: 10px;">
		알림</span> <br> <br>
	<div>
		<div class="main" style="margin-top: 20px;">
			<c:if test="${empty iflist}">
				<div class="main" style="margin: 0 auto;">
					<div class="div_1">
						<div class="div_2">
							<img
								src="${pageContext.request.contextPath}/assets/img/ssong/notification-bell.png"
								style="width: 100px;">
						</div>
						<div>
							<br> <span style="font-size: 1.5em;">아직 후원하신 창작자가
								없습니다.</span> <br> <br> <a href="#"
								class="genric-btn primary-border circle"
								style="margin-left: 80px;">프로젝트 둘러보기</a>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${!empty iflist}">
				<c:forEach var="map" items="${iflist }">
					<c:if test="${map['OPENDATE']>=0 }">
					<div class="wrap" style="height: 130px; margin-bottom: 20px; border-radius:0;
						border:none; border-bottom: 1px solid #ced4da; width: 850px;">
						<div class="trand-right-single d-flex">
							<div class="trand-right-img">
								<img src="<c:url value='/project_assets/projectImg/${map["PROJECT_IMAGE"]}'/>"
									style="width: 90px; height: 90px; margin: 20px 20px; border-radius: 20px;">
							</div>
							<div class="trand-right-cap"
								style="margin: 20px 10px; width: 450px;">
								<div style="margin-bottom: 10px;">
									<span class="color1" style="font-size: 1em;">
									알림신청하신 ${map['PROJECT_NAME'] } 프로젝트가 공개되었습니다.
									</span><br>
								</div>
								<c:choose>
									<c:when test="${map['OPENDATE']>0 }">
										<span class="color2" style="font-size: 0.8em;">
										${map['OPENDATE'] }일 전</span> 
									</c:when>
									<c:otherwise>
										<span class="color2" style="font-size: 0.8em;">
											오늘</span> 
									</c:otherwise>
								</c:choose>
								<a href="<c:url value='/mypages/deleteInformView?no=${map["PROJECT_NO"]}'/>"
									class="trand-right-img" id="delete"> 
								<img src="<c:url value='/assets/img/cancel.png'/>"
									style="width: 20px; margin: -135px 0px 0px 620px;">
								</a>	
							</div>
						</div>
					</div>
					</c:if>
				</c:forEach>
			</c:if>
			<div style="margin-right: 200px;">
				<nav class="blog-pagination justify-content-center d-flex">
					<ul class="pagination">
						<c:if test="${pageInfo.firstPage>1 }">
							<li class="page-item"><a href="#" class="page-link"
								onclick="pageProc(${pageInfo.firstPage-1})" aria-label="Previous">
									<i class="ti-angle-left"></i>
							</a></li>
						</c:if>
			
						<c:forEach var="i" begin="${pageInfo.firstPage }" end="${pageInfo.lastPage}">
							<c:if test="${i==pageInfo.currentPage }">
							<li class="page-item active">
								<a href="#" class="page-link">${i}</a>
							</li>
							</c:if>
							<c:if test="${i!=pageInfo.currentPage }">
								<a href="#"  onclick="pageProc(${i})" class="page-link">${i}</a>
							</c:if>
						</c:forEach>
			
						<c:if test="${pageInfo.lastPage < pageInfo.totalPage }">
							<li class="page-item"><a href="#" class="page-link"
								onclick="pageProc(${pageInfo.lastPage+1})"> <i
									class="ti-angle-right"></i></a></li>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</div>
<form action="<c:url value='/mypages/notifications'/>" name="frmSupport" method="post">
	<input type="hidden" name="currentPage"><br> 
</form>
<script type="text/javascript">
function pageProc(curPage){
	$('input[name=currentPage]').val(curPage);
 	$('form[name=frmSupport]').submit();	
 }
</script>
<%@ include file="../include/bottom.jsp"%>