<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/height.css"/>
<script type="text/javascript" src="<c:url value='/assets/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$("[id='delete']").click(function(){
			if(!confirm('삭제하시겠습니까?')){
				event.preventDefault();
				return false;
			}
		});
	});
	function chatList(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
	
</script>

<!-- 페이징 처리를 위한 form 시작-->
<form name="frmPage" method="post" action="<c:url value='/chat/sent'/>">
	<input type="hidden" name="currentPage">	
	<input type="hidden" name="searchCondition" value="${param.searchCondition }">
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword }">
</form>
<!-- 페이징 처리 form 끝 -->

<div class="container">
	<form name="frmSearch" method="post" action='<c:url value="/chat/sent"/>'>
		<div class="row m-3">
			<div class="col-md-5">
				<input class="btn btn-warning" type="button" data-toggle="modal" data-target="#writeModal" value="쪽지 보내기">
			</div>
			<div class="col-md-2">
				<select name="searchCondition" class="form-control">
					<option value="MESSAGE_TITLE"
						<c:if test="${param.searchCondition == 'MESSAGE_TITLE' }">            	
					    	selected="selected"
					    </c:if>>제목</option>
					<option value="MESSAGE_CONTENT"
						<c:if test="${param.searchCondition == 'MESSAGE_CONTENT' }">            	
		            		selected="selected"
		            	</c:if>>내용</option>
				</select>
			</div>
			<div class="col-md-3">
				<input name="searchKeyword" class="form-control" type="text" value="${param.searchKeyword }">
			</div>
			<div class="col">
				<input class="btn btn-warning" type="submit" value="검색">
			</div>
		</div>
	</form>
	<table class="table table-hover">
		<colgroup>
			<col style="width:20%" />
			<col style="width:30%" />
			<col style="width:15%" />
			<col style="width:15%" />
			<col style="width:10%" />	
		</colgroup>
	  <thead>
	    <tr  class="table-warning text-dark">
	      <th scope="col">제목</th>
	      <th scope="col">내용</th>
	      <th scope="col">작성일</th>
	      <th scope="col">답변일</th>
	      <th scope="col">삭제</th>
	    </tr>
	  </thead>
	  <tbody>
		  <c:if test="${empty list }">
		  	<tr>
		  		<td colspan="5">보낸 쪽지가 없습니다.</td>
		  	</tr>
		  </c:if>
		  <c:if test="${!empty list }">
		  	<c:forEach var="vo" items="${list }">
				<tr>
					<th scope="row">
						<c:if test="${fn:length(vo.messageTitle)>10 }">
							${fn:substring(vo.messageTitle, 0, 10) }...
						</c:if> 
						<c:if test="${fn:length(vo.messageTitle)<=10 }">
							${vo.messageTitle}
						</c:if>
					</th>
					<td>
						<a href="<c:url value='/chat/detail?messageNo=${vo.messageNo }&currentPage=${param.currentPage!=null?param.currentPage:1}&searchCondition=${param.searchCondition }&searchKeyword=${param.searchKeyword }'/>" >
							<c:if test="${fn:length(vo.messageContent)>20 }">
								${fn:substring(vo.messageContent, 0, 20) }...
							</c:if> 
							<c:if test="${fn:length(vo.messageContent)<=20 }">
								${vo.messageContent}
							</c:if>
						</a>
					</td>
					<td>
						<fmt:formatDate value="${vo.messageRegdate }" type="date" pattern="yyyy-MM-dd" />
					</td>
					<td>
						<c:forEach var="voR" items="${listReceive }">
					    	<c:if test="${vo.messageNo == voR.messageNo }">
					    		<fmt:formatDate value="${voR.messageRegdate }" type="date" pattern="yyyy-MM-dd" />
					    	</c:if>
				    	</c:forEach>
					</td>
					<td>
						<a id="delete" href="<c:url value='/chat/deleteChat?messageNo=${vo.messageNo }&searchCondition=${param.searchCondition }&searchKeyword=${param.searchKeyword }'/>">
						<input class="btn btn-warning btn-sm" type="button" value="삭제">
						</a>
					</td>
				</tr>
		  	</c:forEach>
		  </c:if>
	  </tbody>
	</table>
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

<!-- Modal -->
<div class="modal fade" id="writeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    	<button type="button" class="close" data-dismiss="modal">×</button>
		<jsp:include page="../chat/write.jsp"></jsp:include>
    </div>
  </div>
</div>

<%@ include file="../include/bottom.jsp" %>
