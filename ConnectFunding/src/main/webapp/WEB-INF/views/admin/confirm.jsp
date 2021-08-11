
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

	function accept(projectNo){
		if(window.confirm("승인 하시겠습니까?")){
			location.href="<c:url value='/admin/confirmProject?projectNo="+projectNo+"'/>";
		}
	}
	
	function deleteConfirm(projectNo){
		if(window.confirm("프로젝트를 삭제 하시겠습니까?")){
			location.href="<c:url value='/project/adminDelete?projectNo="+projectNo+"'/>";
		}
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
									<th>심사 여부</th>
									<th class="text-center">심사하기</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty list }">
									<tr>
										<td colspan="6">데이터가 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${!empty list }">
									<c:forEach var="vo" items="${list }">
										<tr>
											<td><span class="block-email">${vo.userEmail }</span></td>
											<td class="desc">
												<a href="#" data-toggle="modal" data-target="#myModal${vo.projectNo }" id="btCancleModal">
													${vo.projectName }
												</a>
											</td>
											<td>${vo.projectRegdate }</td>
											<td>&#8361;<fmt:formatNumber value="${vo.totalAmount }" pattern="#,###"/></td>
											<td>
												<c:if test="${vo.confirm=='N' }">
													심사대기
												</c:if>
												<c:if test="${vo.confirm!='N' }">
													심사완료
												</c:if>
											</td>
											<td>
												<div class="table-data-feature">
													<c:if test="${vo.confirm=='N' }">
														<button class="item" data-toggle="tooltip"
															data-placement="top" title="Accept" onclick="accept(${vo.projectNo})">
															<i class="zmdi zmdi-mail-send"></i>
														</button>
													</c:if>
													
													<button class="item" data-toggle="tooltip"
														data-placement="top" title="Delete" onclick="deleteConfirm(${vo.projectNo})">
														<i class="zmdi zmdi-delete"></i>
													</button>
												</div>
											</td>
										</tr>
										<div class="modal fade" id="myModal${vo.projectNo }" data-backdrop="static"
										tabindex="-1" role="dialog"
										aria-labelledby="staticBackdropLabel" aria-hidden="true">
										<div class="modal-dialog" role="document" style="position: absolute;left: 30%;">
											<div class="modal-content" style="width:170%">
												<div class="modal-header">
													<h5 class="modal-title" id="staticBackdropLabel">프로젝트 상세보기</h5>
													<button type="button" class="btn-close" data-dismiss="modal"
														aria-label="Close">X</button>
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