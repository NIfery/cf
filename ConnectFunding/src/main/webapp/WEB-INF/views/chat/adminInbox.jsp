<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<script src="${pageContext.request.contextPath}/admin_assets/vendor/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/admin_assets/vendor/bootstrap-4.1/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/jquery-ui.css"/>
<script type="text/javascript" 
   src="<c:url value='/assets/js/jquery-ui.js'/>"></script>

<script type="text/javascript">
		$(function(){
			$('#startD').datepicker({
				dateFormat:'yy-mm-dd',
				changeYear:true,
				dayNamesMin:['일','월','화','수','목','금','토'],
				monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
			})
			$('#endD').datepicker({
				dateFormat:'yy-mm-dd',
				changeYear:true,
				dayNamesMin:['일','월','화','수','목','금','토'],
				monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
			})
			
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
	<input type="hidden" name="searchCondition" value="${param.searchCondition }">
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword }">
	<input type="hidden" name="startDay" value="${dateSearchVO.startDay }">
	<input type="hidden" name="endDay" value="${dateSearchVO.endDay }">
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
						<h1 class="title-5 m-b-35">받은 쪽지함(${pagingInfo.totalRecord })</h1>
						<form name="frmSearch" method="post"
							action='<c:url value="/chat/adminInbox"/>'>
							조회기간
							<div class="row">
							<div class="col-md-2">
							<input type="text" name="startDay" id="startD" class="form-control form-control-sm" 
								 value="${searchVOChat.startDay }">
							</div>
							~
							<div class="col-md-2">
							<input type="text" name="endDay" id="endD" class="form-control form-control-sm" 
								 value="${searchVOChat.endDay }">
							</div>
							<div class="col-md-2">
							<select name="searchCondition" class="form-control form-control-sm">
								<option value="MESSAGE_TITLE" 
					            	<c:if test="${param.searchCondition == 'MESSAGE_TITLE' }">            	
					            		selected="selected"
					            	</c:if>
					            >제목</option>
					            <option value="MESSAGE_CONTENT" 
					            	<c:if test="${param.searchCondition == 'MESSAGE_CONTENT' }">            	
					            		selected="selected"
					            	</c:if>
					            >내용</option>
					            <option value="USER_NO" 
					            	<c:if test="${param.searchCondition == 'USER_NO' }">            	
					            		selected="selected"
					            	</c:if>
					            >회원번호</option>
							</select> 
							</div>
							<div class="col-md-4">
							<input name="searchKeyword" class="form-control form-control-sm" type="text" value="${param.searchKeyword }">
							</div>
							<div class="col-md-1">
							<input class="btn btn-warning" type="submit" value="검색">
							</div>
							</div>
							
						</form>
						
						<form name="frmList" >
						<div class="table-responsive table-responsive-data2">
						
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
						<input class="btn btn-warning m-2" type="button" id="delete" value="선택한 쪽지 삭제">
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
	</div>
</div>
<%@ include file="../inc/adminChatBottom.jsp"%>