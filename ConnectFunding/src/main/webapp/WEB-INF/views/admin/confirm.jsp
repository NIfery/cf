
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript"
	src="<c:url value='/assets/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">	
	function pageProc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();	
	}
</script>
<!-- 페이징 처리를 위한 form -->
<form action="<c:url value='/admin/confirm'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="currentPage"><br>
</form>
<!-- DATA TABLE-->
<div class="page-content--bge5">
	<div class="container">
	<section class="p-t-20">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h3 class="title-5 m-b-35">심사 대기 펀딩</h3>
					<div class="table-responsive table-responsive-data2">
						<table class="table table-data2">
							<thead>
								<tr>
									<th>email</th>
									<th>펀딩명</th>
									<th>펀딩 신청일</th>
									<th>목표 금액</th>
									<th class="text-center">심사하기</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty map }">
									<tr>
										<td colspan="5">데이터가 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${!empty map }">
									<c:forEach var="vo" items="${map }">
										<tr>
											<td><span class="block-email">${vo["USER_EMAIL"] }</span></td>
											<td class="desc">${vo["PROJECT_NAME"] }</td>
											<td>${vo["PROJECT_REGDATE"] }</td>
											<td>&#8361;<fmt:formatNumber value="${vo['TOTAL_AMOUNT'] }" pattern="#,###"/></td>
											<td>
												<div class="table-data-feature">
													<button class="item" data-toggle="tooltip"
														data-placement="top" title="Accept">
														<i class="zmdi zmdi-mail-send"></i>
													</button>
													<button class="item" data-toggle="tooltip"
														data-placement="top" title="Delete">
														<i class="zmdi zmdi-delete"></i>
													</button>
												</div>
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
					<div class="divPage" style="text-align: center"><br>
                          <ul class="pagination" style="justify-content: center;">
							<!-- 페이지 번호 추가 -->		
							<!-- 이전 블럭으로 이동 -->
							<c:if test="${pagingInfo.firstPage>1 }">
								<li class="page-item active"><a href="#" class="page-link" onclick="pageProc(${pagingInfo.firstPage-1})">
									이전 블럭으로
								</a></li>
							</c:if>
												
							<!-- [1][2][3][4][5]-->
							
								<c:forEach var="i" begin="${pagingInfo.firstPage }" 
									end="${pagingInfo.lastPage }">
									<c:if test="${i==pagingInfo.currentPage }">
										<li class="page-item"><a class="page-link" href="#">${i}</a></li>
									</c:if>
									<c:if test="${i!=pagingInfo.currentPage }">
										<li class="page-item active"><a class="page-link" href="#" onclick="pageProc(${i})">${i}</a></li>
									</c:if>
								</c:forEach>
							
							<!-- 다음 블럭으로 이동 -->
							<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
								<li class="page-item active"><a href="#" class="page-link" onclick="pageProc(${pagingInfo.lastPage+1})">
									다음 블럭으로
								</a></li>
							</c:if>
							<!--  페이지 번호 끝 -->
							</ul>
						</div>
				</div>
			</div>
		</div>
		<br> <br> <br>
	</section>
</div>
</div>
<!-- END DATA TABLE-->
<%@ include file="../inc/adminBottom.jsp"%>