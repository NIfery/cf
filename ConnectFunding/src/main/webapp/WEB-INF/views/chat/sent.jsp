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
		$('#delete').click(function(){
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
<form name="frmPage" method="post" 
	action="<c:url value='/chat/sent'/>">
	<input type="hidden" name="currentPage">	
</form>
<!-- 페이징 처리 form 끝 -->
<div class="container">
	<a href="<c:url value='/chat/write'/>">
		<input class="btn btn-warning m-3" type="button" value="쪽지 보내기">
	</a>
  	<table class="table table-hover">
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
				<a href="<c:url value='/chat/detail?messageNo=${vo.messageNo }'/>">
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
			<td><a id="delete"
				href="<c:url value='/chat/deleteChat?messageNo=${vo.messageNo }'/>">
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
<%@ include file="../include/bottom.jsp" %>
