
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
									<th><label class="au-checkbox"> <input
											type="checkbox"> <span class="au-checkmark"></span>
									</label></th>
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
										<td colspan="6">데이터가 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${!empty map }">
									<c:forEach var="vo" items="${map }">
										<tr>
											<td><label class="au-checkbox"> <input
													type="checkbox"> <span class="au-checkmark"></span>
											</label></td>
											<td><span class="block-email">${vo["USER_EMAIL"] }</span></td>
											<td class="desc">${vo["PROJECT_NAME"] }</td>
											<td>${vo["PROJECT_REGDATE"] }</td>
											<td>&#8361;<fmt:formatNumber value="${vo['TOTAL_AMOUNT'] }" pattern="#,###"/></td>
											<td>
												<div class="table-data-feature">
													<button class="item" data-toggle="tooltip"
														data-placement="top" title="Send">
														<i class="zmdi zmdi-mail-send"></i>
													</button>
													<button class="item" data-toggle="tooltip"
														data-placement="top" title="Edit">
														<i class="zmdi zmdi-edit"></i>
													</button>
													<button class="item" data-toggle="tooltip"
														data-placement="top" title="Delete">
														<i class="zmdi zmdi-delete"></i>
													</button>
													<button class="item" data-toggle="tooltip"
														data-placement="top" title="More">
														<i class="zmdi zmdi-more"></i>
													</button>
												</div>
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
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