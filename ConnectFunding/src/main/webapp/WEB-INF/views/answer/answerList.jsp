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
		
		$('form[name=frmAnswer]').submit(function(){
			if($('#answerContent').val().length<1){
				alert('답변을 입력하세요');
				$('#answerContent').focus();
				return false;
			}
		});
		
		$('form[name=frmEdit]').submit(function(){
			if($('#answerEdit').val().length<1){
				alert('답변을 입력하세요');
				$('#answerEdit').focus();
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
<form name="frmPage" method="post" action="<c:url value='/answer/answerList?projectNo=${param.projectNo }'/>">
	<input type="hidden" name="currentPage">	
	<input type="hidden" name="searchCondition" value="${param.searchCondition }">
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword }">
</form>
<!-- 페이징 처리 form 끝 -->

<div class="container">
	<br>
	<h1>받은 프로젝트 문의</h1>
	<br>
	<c:if test="${empty list }">
	  	<div style="height:500px;">등록된 문의가 없습니다.</div>
	</c:if>
	<c:if test="${!empty list }">
		<c:forEach var="vo" items="${list }">
			<div class="row">
				<div class="col-md-10">
					<span class="font-weight-bold">Q.</span>
					<c:if test="${fn:contains(vo.questionFlag,'Y') }">
						<span style="color:red">답변완료</span>
					</c:if>
				</div>
				<div class="col-md-2">
					<c:if test="${fn:contains(vo.questionFlag,'N') }">
						<a href="#" data-toggle="modal" data-target="#writeModal${vo.questionNo }" >답변하기</a>
			    			<div class="modal fade" id="writeModal${vo.questionNo }" data-backdrop="static" tabindex="-1" role="dialog"
								aria-labelledby="staticBackdropLabel" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="staticBackdropLabel">답변하기</h5>
											<button type="button" class="btn-close" data-dismiss="modal"
												aria-label="Close" id="btFundingModalClose">
											</button>
										</div>
										<form name="frmAnswer" method="post" action="<c:url value='/answer/answerWrtie?questionNo=${vo.questionNo }'/>">
											<div class="modal-body">
											<p>사용자 번호: ${vo.userNo }</p><br>
											<p>${vo.questionTitle }</p><br>
											<p>${vo.questionContent }</p>
											<p><fmt:formatDate value="${vo.questionRegdate }" type="date" pattern="yyyy-MM-dd" /></p>
											<input type="hidden" name="projectNo" value="${vo.projectNo }">
												<!-- 모달 body -->
												<div class="form-group" style="width: 450px; margin: 3px;">
													<label class="form-label mt-4">답변</label> 
													<textarea class="form-control" id="answerContent" name="answerContent" rows="3"
														placeholder="답변을 입력하세요"></textarea>
												</div>
											</div>
										<div class="modal-footer">
											<button type="submit" id="btAnswer" class="genric-btn warning circle">답변하기</button>
										</div>
										</form>
									</div>
								</div>
							</div>
					</c:if>
				</div>
				<div class="row m-3">
					<p>사용자 번호: ${vo.userNo }</p><br>
					<p class="font-weight-bold">${vo.questionTitle }</p>
					<p>${vo.questionContent }</p>
					<p><small><fmt:formatDate value="${vo.questionRegdate }" type="date" pattern="yyyy-MM-dd" /></small></p>
				</div>
			</div>
			<c:if test="${fn:contains(vo.questionFlag,'Y') }">
				<c:forEach var="answerVo" items="${answerList }">
					<c:if test="${vo.questionNo==answerVo.questionNo }">
						<span class="font-weight-bold">A.</span>
						<span>답변</span>
						<div class="row m-3">
							<p>${answerVo.answerContent }</p>
							<p><small><fmt:formatDate value="${answerVo.answerRegdate }" type="date" pattern="yyyy-MM-dd" /></small></p>
						</div>
						<a href="#" data-toggle="modal" data-target="#editModal${answerVo.questionNo }" >답변 수정</a>
		    			<div class="modal fade" id="editModal${answerVo.questionNo }" data-backdrop="static" tabindex="-1" role="dialog"
							aria-labelledby="staticBackdropLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="staticBackdropLabel">답변 수정</h5>
										<button type="button" class="btn-close" data-dismiss="modal"
											aria-label="Close" id="btFundingModalClose">
										</button>
									</div>
									<form name="frmEdit" method="post" action="<c:url value='/answer/answerEdit?questionNo=${answerVo.questionNo }'/>">
										<div class="modal-body">
											<!-- 모달 body -->
											<p>사용자 번호: ${vo.userNo }</p><br>
											<p>제목: ${vo.questionTitle }</p><br>
											<p>내용: ${vo.questionContent }</p>
											<input type="hidden" name="projectNo" value="${vo.projectNo }">
											<div class="form-group" style="width: 450px; margin: 3px;">
												<label class="form-label mt-4">답변</label> 
												<textarea class="form-control" id="answerEdit" name="answerContent" rows="3"
														placeholder="답변을 입력하세요">${answerVo.answerContent }</textarea>
											</div>
										</div>
									<div class="modal-footer">
										<button type="submit" id="btQuestionEdit" class="genric-btn warning circle">답변 수정</button>
									</div>
									</form>
								</div>
							</div>
						</div>
						<span>
						 / <a id="delete" href="<c:url value='/answer/deleteAnswer?questionNo=${answerVo.questionNo }&projectNo=${vo.projectNo }'/>">답변 삭제</a>
						 </span>
					</c:if>
				</c:forEach>
			</c:if>
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
  <div style="height:300px;"></div>
</div>

<%@ include file="../include/bottom.jsp"%>