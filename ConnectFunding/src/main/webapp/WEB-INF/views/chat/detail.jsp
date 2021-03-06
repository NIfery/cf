<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/height.css"/>
<script type="text/javascript"
	src="<c:url value='/assets/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#delete').click(function(){
			if(!confirm('삭제하시겠습니까?')){
				event.preventDefault();
				return false;
			}
		});
		
	});
</script>
<title>쪽지보기</title>
<div class="container">
	<form name="frmChat" method="post" >
		<h1 class="m-3">보낸 쪽지</h1>
		<div class="form-group">
			<label for="title">제목</label>
			 <input type="text"
				class="form-control" id="messageTitle" name="messageTitle" value="${sendVo.messageTitle }" readonly="readonly">
		</div>

		<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control" id="messageContent" name="messageContent" rows="3" readonly="readonly">${sendVo.messageContent }</textarea>
		</div>
		<c:if test="${!empty receiveVo }">
			<div class="border border-warning p-3">
				<h3 class="title-5 m-b-35">답변</h3>
				<div class="form-group">
					<label for="title">제목</label>
					<input type="text"
						class="form-control" id="messageTitle" name="messageTitle" value="${receiveVo.messageTitle }" readonly="readonly">
				</div>
				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control" id="messageContent" name="messageContent" rows="3" readonly="readonly">${receiveVo.messageContent }</textarea>
				</div>
			</div>
		</c:if>
		<div class="text-center m-3">
			<c:if test="${empty receiveVo }">
				<a href="<c:url value='/chat/edit?messageNo=${sendVo.messageNo }&currentPage=${param.currentPage }&searchCondition=${param.searchCondition }&searchKeyword=${param.searchKeyword }'/>">
					<input class="btn btn-warning" type="button" value="쪽지 수정">
				</a> 
			</c:if>
        	<a id="delete" href="<c:url value='/chat/deleteChat?messageNo=${sendVo.messageNo }&searchCondition=${param.searchCondition }&searchKeyword=${param.searchKeyword }'/>">
        		<input class="btn btn-warning" type="button" value="쪽지 삭제">
        	</a> 
        	<a href="<c:url value='/chat/sent?currentPage=${param.currentPage }&searchCondition=${param.searchCondition }&searchKeyword=${param.searchKeyword }'/>">
        		<input class="btn btn-warning" type="button" value="목록">
        	</a>
       	</div>
	</form>
</div>
		
<%@ include file="../include/bottom.jsp"%>
