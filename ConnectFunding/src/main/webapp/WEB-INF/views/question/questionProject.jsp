<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
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
	function questionList(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
	
</script>

<!-- 페이징 처리를 위한 form 시작-->
<form name="frmPage" method="post" action="<c:url value='/question/questionProject'/>">
	<input type="hidden" name="currentPage">	
	<input type="hidden" name="searchCondition" value="${param.searchCondition }">
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword }">
</form>
<!-- 페이징 처리 form 끝 -->

<div class="container">
	<br>
	<h1>프로젝트 문의</h1>
	<br>
	<c:if test="${empty list }">
	  	<tr>
	  		<td colspan="5" style="height: 600px;">등록된 문의가 없습니다.</td>
	  	</tr>
	</c:if>
	<c:if test="${!empty list }">
		<c:forEach var="vo" items="${list }">
			<div class="row">
				<div class="col-md-8">
					<span class="font-weight-bold">Q.</span>
					<c:if test="${fn:contains(vo.questionFlag,'N') }">
						<span>답변예정</span>
					</c:if>
					
				</div>
				<div class="col-md-2">
					<span>수정</span>
				</div>
				<div class="col-md-2">
					<span>삭제</span>
				</div>
				<div class="row m-3">
					<p>${vo.questionTitle }</p>
					<p>${vo.questionContent }</p>
					<p><fmt:formatDate value="${vo.questionRegdate }" type="date" pattern="yyyy-MM-dd" /></p>
				</div>
			</div>
			<c:forEach var="answerVo" items="${answerList }">
				<c:if test="${vo.questionNo==answerVo.questionNo }">
					<span class="font-weight-bold">A.</span>
					<span>답변</span>
					<div class="row m-3">
						<p>${answerVo.answerContent }</p>
						<p><fmt:formatDate value="${answerVo.answerRegdate }" type="date" pattern="yyyy-MM-dd" /></p>
					</div>
				</c:if>
			</c:forEach>
			<hr>
		</c:forEach>
	</c:if>
	
	<br>
  <ul class="pagination justify-content-center" >
	<c:if test="${pagingInfo.firstPage>1 }">
		<li class="page-item">
	      <a class="page-link" href="#" aria-label="Previous" onclick="questionList(${pagingInfo.firstPage-1})">
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
				<a class="page-link" href="#" onclick="questionList(${i})">${i }</a>
			</c:if>		
		</li>
	</c:forEach>
	<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
		<li class="page-item">
		      <a class="page-link" href="#" aria-label="Next" onclick="questionList(${pagingInfo.lastPage+1})">
		        <span aria-hidden="true">&raquo;</span>
		        <span class="sr-only">Next</span>
		      </a>
		</li>
	</c:if>
  </ul>
</div>

<%@ include file="../include/bottom.jsp"%>