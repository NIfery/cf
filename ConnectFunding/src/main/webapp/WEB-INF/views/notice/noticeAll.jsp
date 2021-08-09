<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon.ico">
<!-- CSS here -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/ticker-style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/flaticon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/slicknav.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/animate.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/magnific-popup.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/themify-icons.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/slick.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/nice-select.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/ssong.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
.page-link{
	background-color: white;
}
</style>
<div style="height: auto; min-height: 800px;">
<c:if test="${!empty noticeVo.noticeTitle }">
	<p>검색어 : ${noticeVo.noticeTitle}, ${pageInfo.totalRecord} 건 검색되었습니다.</p>
</c:if>
	<c:if test="${!empty allList }">
		<c:forEach var="noticeVo" items="${allList }">
			<div class="wrap" style="height: 130px; width: 900px; margin-top: 10px;">
				<div class="trand-right-single d-flex">
					<div class="trand-right-cap"
						style="margin: 15px 25px; width: 600px;">
						<span class="color2" style="font-weight: bold; font-size: 1em;">${noticeVo.noticeCategory }</span>
						<br>
						<div style="margin-top: 10px; margin-bottom: 10px;">
						<span class="color1" >
							<a href="<c:url value='/notice/all_detail?noticeNo=${noticeVo.noticeNo }'/>"
								style="color: black;"> 
							${noticeVo.noticeTitle}
							</a>
						</span><br> 
						</div>
						<span class="color2" style="font-size: 0.8em;">
							<fmt:formatDate value="${noticeVo.noticeRegdate }" pattern="yyyy-MM-dd"/>
						</span>
						<c:if test="${empty noticeVo.noticeFilename}">
							<img src="<c:url value='/assets/img/logo/logo.png'/>"
								style="width: 150px; margin: -80px 0px 0px 700px; display: flex;">
						</c:if>
						<c:if test="${!empty noticeVo.noticeFilename}">
							<img src="<c:url value='/project_assets/noticeImg/${noticeVo.noticeFilename }'/>"
								style="width: 150px; margin: -104px 0px 0px 700px; display: flex; border-radius: 20px;">
						</c:if>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:if>
	<br>
	<c:if test="${sessionScope.userEmail=='admin@cf' }">
		<a href="<c:url value='/notice/notice_write'/>" style="float: right; margin-right: 300px;"
			class="genric-btn primary-border circle arrow">등록하기</a><br><br>
	</c:if>
	<!-- 페이징처리 -->
	<div style="margin-right: 300px;">
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
	<form action="<c:url value='/notice/notice_tab'/>" name="frmSearch" method="post">
	<span class="d-flex" style="margin-left: 340px; margin-top: 20px;">
		<input type="text" class="form-control" placeholder="검색어를 입력해주세요."
			name="noticeTitle" value="${noticeVo.noticeTitle}" style="width: 250px;">
		<button class="btns" type="submit" style="background: none; border: 1px; color: black;">
			<i class="fas fa-search special-tag"></i>
		</button>
	</span>
	</form>
	<form action="<c:url value='/notice/notice_tab'/>" name="frmSupport" method="post">
		<input type="hidden" name="currentPage"><br> 
		<input type="hidden" name="noticeTitle" value="${noticeVo.noticeTitle}"><br>
	</form>
	</div>
<script>
	function pageProc(curPage){
	   $('input[name=currentPage]').val(curPage);
	   $('form[name=frmSupport]').submit();   
	}
</script>