<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<!-- MAIN CONTENT-->
<div class="main-content">
	<div class="section__content section__content--p30">

		<!-- DATA TABLE-->
		<section class="p-t-20">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h3 class="title-5 m-b-35">받은 편지함</h3>
						<div class="table-responsive table-responsive-data2">
							<table class="table table-data2">
								<thead>
									<tr>
										<th><label class="au-checkbox"> <input
												type="checkbox"> <span class="au-checkmark"></span>
										</label></th>
										<th>회원번호</th>
										<th>제목</th>
										<th>내용</th>
										<th>보낸날짜</th>
										<th class="text-center">답변하기</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty list }">
										<tr>
											<td colspan="6">받은 쪽지가 없습니다.</td>
										</tr>
									</c:if>
									<c:if test="${!empty list }">
										<c:forEach var="vo" items="${list }">
											<tr class="tr-shadow">
												<td><label class="au-checkbox"> <input
														type="checkbox"> <span class="au-checkmark"></span>
												</label></td>
												<td><span class="block-email">${vo.userNo }</span></td>
												<td class="desc">${vo.messageTitle }</td>
												<td>${vo.messageContent }</td>
												<td><fmt:formatDate value="${vo.messageRegdate }"
														type="date" pattern="yyyy-MM-dd" /></td>
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
		<!-- END DATA TABLE-->
		<!-- END PAGE CONTAINER-->
	</div>
</div>
<%@ include file="../inc/adminBottom.jsp"%>