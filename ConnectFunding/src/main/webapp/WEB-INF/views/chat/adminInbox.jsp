<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<script type="text/javascript"
	src="<c:url value='/assets/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
		$(function(){
			$('input[name=chkAll]').click(function(){
				$('tbody input[type=checkbox]').prop('checked',this.checked);			
			});
			
			$('#delete').click(function(){
				var chkLen=$('tbody input[type=checkbox]:checked').length;
				if(chkLen==0){
					alert('먼저 삭제할 쪽지를 선택하세요');
				}else{			
					if(!confirm('삭제하시겠습니까?')){
						event.preventDefault();
						return false;
					}
					$('form[name="frmList"]').prop('action',
							'<c:url value="/chat/deleteMulti"/>');
					$('form[name="frmList"]').submit();
				}
			});
			
	});
		
	function chatList(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
</script>
<!-- 페이징 처리를 위한 form 시작-->
<form name="frmPage" method="post" 
	action="<c:url value='/chat/adminInbox'/>">
	<input type="hidden" name="currentPage">	
</form>
<!-- 페이징 처리 form 끝 -->
<!-- MAIN CONTENT-->
<div class="main-content">
	<div class="section__content section__content--p30">

		<!-- DATA TABLE-->
		<section class="p-t-20">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h3 class="title-5 m-b-35">받은 쪽지함</h3>
						<form name="frmList" >
						<div class="table-responsive table-responsive-data2">
						<input class="btn btn-warning m-2" type="button" id="delete" value="선택한 쪽지 삭제">
							<table class="table table-data2">
								<thead>
									<tr>
										<th><label class="au-checkbox"> <input
												type="checkbox" name="chkAll" > <span class="au-checkmark"></span>
										</label></th>
										<th>회원번호</th>
										<th>제목</th>
										<th>내용</th>
										<th>보낸날짜</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty list }">
										<tr>
											<td colspan="6">받은 쪽지가 없습니다.</td>
										</tr>
									</c:if>
									<c:if test="${!empty list }">
										<c:set var="idx" value="0"/>
										<c:forEach var="vo" items="${list }">
											<tr class="tr-shadow">
												<td><label class="au-checkbox"> <input
														type="checkbox" name="sMessage[${idx }].messageNo" value="${vo.messageNo }"> <span class="au-checkmark"></span>
												</label></td>
												<td><span class="block-email">${vo.userNo }</span></td>
												<td>
													<c:if test="${fn:length(vo.messageTitle)>10 }">
														${fn:substring(vo.messageTitle, 0, 10) }...
													</c:if> 
													<c:if test="${fn:length(vo.messageTitle)<=10 }">
														${vo.messageTitle}
													</c:if>
													</td>
													<td class="desc"><a  href="<c:url value='/chat/adminDetail?messageNo=${vo.messageNo }'/>">
													<c:if test="${fn:length(vo.messageContent)>30 }">
														${fn:substring(vo.messageContent, 0, 30) }...
													</c:if> 
													<c:if test="${fn:length(vo.messageContent)<=30 }">
														${vo.messageContent}
													</c:if></a></td>
												<td><fmt:formatDate value="${vo.messageRegdate }"
														type="date" pattern="yyyy-MM-dd" /></td>
											</tr>
											<c:set var="idx" value="${idx+1 }"/>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
        					
						</div>
						</form>
						<br>
					  <ul class="pagination justify-content-center" >
						<c:if test="${pagingInfo.firstPage>1 }">
							<li class="page-item">
						      <a class="page-link" href="#" aria-label="Previous" onclick="chatList(${pagingInfo.firstPage-1})">
						        <span aria-hidden="true">&laquo;</span>
						        <span class="sr-only">Previous</span>
						      </a>
							</li>
						</c:if>
					    <c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
							<li class="page-item">
								<c:if test="${i==pagingInfo.currentPage }">
									<span style="color:blue;font-weight:bold" class="page-link" >${i }</span>
								</c:if>
								<c:if test="${i!=pagingInfo.currentPage }">						
									<a class="page-link" href="#" onclick="chatList(${i})">${i }</a>
								</c:if>		
							</li>
						</c:forEach>
						<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
							<li class="page-item">
							      <a class="page-link" href="#" aria-label="Next" onclick="chatList(${pagingInfo.lastPage+1})">
							        <span aria-hidden="true">&raquo;</span>
							        <span class="sr-only">Next</span>
							      </a>
							</li>
						</c:if>
					  </ul>
					</div>
				</div>
			</div>
		</section>
		<!-- END DATA TABLE-->
		<!-- END PAGE CONTAINER-->
	</div>
</div>
<%@ include file="../inc/adminBottom.jsp"%>