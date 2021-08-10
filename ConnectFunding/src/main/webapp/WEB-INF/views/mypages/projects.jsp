<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../include/top.jsp"%>
<script type="text/javascript"
	src="<c:url value='/assets/js/jquery-3.6.0.min.js'/>"></script>
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/ssong.css">
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

.page-link {
	background-color: white;
}
</style>
<div class="single_sidebar_widget post_category_widget"
	style="width: 1000px; margin-left: 200px; background: white; height: 1000px; margin-top: 50px;">
	<span class="widget_title"
		style="text-align: left; font-size: 2.5em; margin-left: 10px;">
		내가 만든 프로젝트</span> <br> <br> <br>
	<div>
		<div class="main" style="height: 600px; margin: 0 auto;">
		<c:if test="${empty list}">
			<div class="div_1">
				<div class="div_2">
					<img
						src="${pageContext.request.contextPath}/assets/img/ssong/create.png"
						style="width: 100px;">
				</div>
				<div>
					<br> <span style="font-size: 1.5em;">작성한 프로젝트가 없습니다.</span>
					<br> <br> <a href="<c:url value='/project/writeMain'/>"
						class="genric-btn primary-border circle" style="margin-left: 80px;">
						프로젝트 올리기</a>
				</div>
			</div>
			</c:if>
			<c:if test="${!empty list}">
			<c:forEach var="vo" items="${list }">
				<div class="wrap"
					style="height: 240px; margin-bottom: 20px; border-radius: 0; border: none; border-bottom: 1px solid #ced4da; width: 900px;">
					<div class="trand-right-single d-flex">
						<div class="trand-right-img">
							<a href="#" data-toggle="modal" data-target="#myModal${vo.projectNo }" id="btCancleModal">
								<img src="<c:url value='/project_assets/projectImg/${vo.projectImage}'/>"
									style="width: 180px; height: 130px; margin: 30px 20px; border-radius: 20px;">
							</a>							
						</div>
						<div class="trand-right-cap"
							style="margin: 20px 10px; width: 750px;">
							<div class="row">
								<div class="col">
									<span class="color2" style="font-size: 0.9em;">
										<c:if test="${vo.confirm=='Y' }">
											펀딩중
										</c:if>
										<c:if test="${vo.confirm!='Y' }">
											심사중
										</c:if>
									&nbsp;</span><br>
									<div style="margin-top: 10px; margin-bottom: 10px; width: 400px;">
										<span class="color1" style="font-size: 1.2em;">
											<a style="color: black" href="#" data-toggle="modal" data-target="#myModal${vo.projectNo }" id="btCancleModal">
												${vo.projectName}
											</a>
										</span><br>
										<p><fmt:formatDate value="${vo.projectRegdate }" pattern="yyyy-MM-dd"/></p>
				                        <h6>${vo.projectSummary }</h6>
				                        <div class="percentage">
											<div class="progress" style="background:#eceff8;height: 0.3em;width:50%; ">
												<div class="progress-bar color-1" role="progressbar" style="width: ${vo.totalFundingAmount/vo.totalAmount*100 }%" 
													aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
											</div>
										</div>
				                        <h6><fmt:formatNumber value="${vo.totalFundingAmount }" pattern="#,###"/>원<span style="color:red;font-size:0.8em">
				                        <fmt:formatNumber value="${vo.totalFundingAmount/vo.totalAmount*100 }" pattern="0.00"/>%</span></h6>
									</div>
								</div>
								<div class="col" style="display: flex;flex-direction: column;justify-content: center;">
									<a style="color:blue" href="<c:url value='/answer/answerList?projectNo=${vo.projectNo }'/>">[받은 문의함]</a>
									<a style="color:blue" href="<c:url value='/project/update?projectNo=${vo.projectNo }'/>">[수정]</a>
							    	<a style="color:blue" href="#" data-toggle="modal" data-target="#deleteModal${vo.projectNo }">[삭제]</a>
								</div>
							</div>
							
							<div class="modal fade" id="deleteModal${vo.projectNo }" data-backdrop="static" tabindex="-1" role="dialog"
									aria-labelledby="staticBackdropLabel" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="staticBackdropLabel">프로젝트 삭제</h5>
											<button type="button" class="btn-close" data-dismiss="modal"
												aria-label="Close">
											</button>
										</div>
										<form name="frmDelete" method="post" action="<c:url value='/project/delete?projectNo=${vo.projectNo }&userNo=${vo.userNo }&type=projects'/>">
											<div class="modal-body">
												<!-- 모달 body -->
												<div class="form-group" style="width: 450px; margin: 3px;">
														<label class="form-label mt-4">비밀번호 확인</label> 
														<input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요.">
												</div>
											</div>
											<div class="modal-footer">
												<button type="submit" id="btDelete" class="genric-btn warning circle">삭제</button>
											</div>
										</form>
									</div>
								</div>
							</div>

							<div class="modal fade" id="myModal${vo.projectNo }" data-backdrop="static"
								tabindex="-1" role="dialog"
								aria-labelledby="staticBackdropLabel" aria-hidden="true">
								<div class="modal-dialog" role="document" style="position: absolute;left: 30%;">
									<div class="modal-content" style="width:170%">
										<div class="modal-header">
											<h5 class="modal-title" id="staticBackdropLabel">프로젝트 상세보기</h5>
											<button type="button" class="btn-close" data-dismiss="modal"
												aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<!-- 모달 body -->
											<div class="form-group" style="width: 450px; margin: 3px;position: relative;left: 20%;">
												<span style="color:black; font-size:1.2em">${vo.projectName}</span> <br><br>
												${vo.projectSummary }
												<div class="row">
													<div class="col">
														<img src="<c:url value='/project_assets/projectImg/${vo.projectImage}'/>"
															style="width: 180px; height: 130px; margin: 30px 20px; border-radius: 20px;">
													</div>
													<div class="col" style="display: flex;flex-direction: column;justify-content: center;">
														<div class="row">
															<div class="col">목표금액</div>
															<div class="col"><fmt:formatNumber value="${vo.totalAmount}" pattern="#,###"/>원</div>
														</div>
														<div class="row">
															<div class="col">등록일</div>
															<div class="col"><fmt:formatDate value="${vo.projectRegdate }" pattern="yyyy-MM-dd"/></div>
														</div>
														<div class="row">
															<div class="col">시작일</div>
															<div class="col"><fmt:formatDate value="${vo.projectStartdate}" pattern="yyyy-MM-dd"/></div>
														</div>
														<div class="row">
															<div class="col">종료일</div>
															<div class="col"><fmt:formatDate value="${vo.projectEnddate}" pattern="yyyy-MM-dd"/></div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div style="border-top: 1px solid #eceeef;padding:20px 80px 20px 0px">
											${vo.projectContent }
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			<!-- 페이징처리 -->
			<nav class="blog-pagination justify-content-center d-flex">
				<ul class="pagination">
					<c:if test="${pagingInfo.firstPage>1 }">
						<li class="page-item"><a href="#" class="page-link"
							onclick="pageProc(${pagingInfo.firstPage-1})" aria-label="Previous">
								<i class="ti-angle-left"></i>
						</a></li>
					</c:if>
					<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage}">
						<li class="page-item active"><a href="#" class="page-link" onclick="pageProc(${i})">${i}</a>
						</li>
					</c:forEach>
					<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
						<li class="page-item"><a href="#" class="page-link"
							onclick="pageProc(${pagingInfo.lastPage+1})"> <i
							class="ti-angle-right"></i></a></li>
					</c:if>
				</ul>
			</nav>
		</c:if>
		</div>
	</div>
</div>

<form action="<c:url value='/mypages/projects'/>" name="frmProjects"
	method="post">
	<input type="hidden" name="currentPage" id="currentPage"><br> 
</form>
<script type="text/javascript">
	function pageProc(curPage){
	    $('#currentPage').val(curPage);
	    $('form[name=frmProjects]').submit();
	}
</script>
<%@ include file="../include/bottom.jsp"%>