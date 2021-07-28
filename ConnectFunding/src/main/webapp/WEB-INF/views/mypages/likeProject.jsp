<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/top.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/ssong.css">
<style type="text/css">
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

.nice-select.form-select {
	height: 40px;
	width: 170px;
	font-size: 0.9em;
	margin-left: 250px;
}
</style>

<div style="width: 1000px;  height: 1300px;">
	<div class="single_sidebar_widget post_category_widget"
		style="width: 1000px; margin-left: 200px; background: white; margin-top: 50px;">
		<div>
			<span class="widget_title"
				style="text-align: left; font-size: 2.5em; margin-left: 10px;">
				좋아한 프로젝트</span> <br> <br> <br>
		</div>
		<div style="margin-left: auto; margin-right: auto;">
			<div class="row" style="margin-top: 20px; margin-left: 5px; margin-bottom: 45px;">
				<div class="col-md-6" style="width: 500px; height: 50px;">
					<strong style="color: red;">
						<%-- ${fn:length(likelist)} --%>
						${pageInfo.totalRecord}
					</strong> 건의 후원 내역이 있습니다.
				</div>
				<div class="col-md-6 col-md-offset-6">
					<div class="form-group" style="width: 450px; margin: 3px;">
						<select class="form-select" id="exampleSelect2" name="searchCondition"
							style="padding: 0 0;">
							<option value="추가순">추가순</option>
							<option value="마감 임박순">마감 임박순</option>
						</select>
					</div>
				</div>
			</div>
			<c:if test="${empty likelist }">
				<div class="main" style="height: 600px; margin: 0 auto;">
					<div class="div_1">
						<div class="div_2">
							<img
								src="${pageContext.request.contextPath}/assets/img/ssong/click.png"
								style="width: 100px;">
						</div>
						<div>
							<br> <span style="font-size: 1.2em;">좋아한 프로젝트가 없습니다.</span>
							<br> <br>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${!empty likelist }">
				<div class="row" style="width: 1000px;">
					<c:forEach var="map" items="${likelist }">
						<div class="weekly2-single" style="width: 320px !important; padding: 0px 20px;">
							<div class="weekly2-img" style="margin: 0px 0px 84px;">
								<div style="position: relative;">
									<img src="<c:url value='/project_assets/projectImg/${map["PROJECT_IMAGE"]}'/>"
										style="width: 290px; border-radius: 20px;">
									<br><br>
									<div style="border-bottom: 2px solid #f7e332; margin-bottom: 10px;">
									<span class="color1" style="font-size: 1.4em;">${map['PROJECT_NAME']}</span><br><br> 
									<span class="color2" style="font-weight: bold;">
									${map['PROJECT_INSHORT']}
									</span><br><br>
									</div>
									<div style="margin-left: 15px;">
									<a href="<c:url value='/mypages/deletelike?likeNo=${map["LIKE_NO"] }'/>"
										style="color: red;">
										<img src="${pageContext.request.contextPath}/assets/img/ssong/heart.png"
											style="width: 20px; margin-right: 150px;">
									</a>	
									<img src="${pageContext.request.contextPath}/assets/img/ssong/clock.png"
										style="width: 15px;">
									<span class="color2" style="font-size: 0.8em; color: red;">
									&nbsp ${map['RESTDAY']} 일 남음</span>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:if>
			<!-- 페이징처리 -->
			<nav class="blog-pagination justify-content-center d-flex">
				<ul class="pagination">
					<c:if test="${pageInfo.firstPage>1 }">
						<li class="page-item">
						<a href="#" class="page-link" onclick="pageProc(${pageInfo.firstPage-1})" aria-label="Previous">
						<i class="ti-angle-left"></i></a></li>
					</c:if>	
					
					<c:forEach var="i" begin="${pageInfo.firstPage }" end="${pageInfo.lastPage}" >
						<li class="page-item active"><a href="#" class="page-link">${i}</a>
						</li>
					</c:forEach>
					
					<c:if test="${pageInfo.lastPage < pageInfo.totalPage }">
						<li class="page-item">
							<a href="#" class="page-link" onclick="pageProc(${pageInfo.lastPage+1})"> 
							<i class="ti-angle-right"></i></a>
						</li>
					</c:if>
				</ul>
			</nav> 
			<!-- 페이징처리 끝 -->
		</div>
	</div>
</div>
<form action="<c:url value='/mypages/likeProject'/>" name="frmSupport" method="post">
	<input type="hidden" name="currentPage"><br> 
	<input type="hidden" name="searchCondition" value="${param.searchCondition}"><br>
</form>
<script type="text/javascript">
function pageProc(curPage){
	$('input[name=currentPage]').val(curPage);
	$('form[name=frmSupport]').submit();	
}
</script>

<%@ include file="../include/bottom.jsp"%>