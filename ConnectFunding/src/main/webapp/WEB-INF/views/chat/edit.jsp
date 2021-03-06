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
		$('form[name=frmChat]').submit(function(){
			if($('#messageTitle').val().length<1){
				alert('제목을 입력하세요');
				$('#messageTitle').focus();
				return false;
			}else if($('#messageContent').val().length<1){
				alert('내용을 입력하세요');
				$('#messageContent').focus();
				return false;
			}
		});
	});
</script>
<title>쪽지보기</title>
<div class="container">
	<form name="frmChat" method="post" action="<c:url value='/chat/edit?messageNo=${sendVo.messageNo }&currentPage=${param.currentPage }&searchCondition=${param.searchCondition }&searchKeyword=${param.searchKeyword }'/>">
		<h1 class="m-3">쪽지 수정</h1>
		
		<div class="form-group">
			<label for="title">제목</label> 
			<input type="text" class="form-control" id="messageTitle" name="messageTitle" value="${sendVo.messageTitle }">
		</div>

		<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control" id="messageContent" name="messageContent" rows="3">${sendVo.messageContent }</textarea>
			<div class="text-center m-3">
				<input class="btn btn-warning " type="submit" value="수정">
				<a href="<c:url value='/chat/detail?messageNo=${sendVo.messageNo }&currentPage=${param.currentPage }&searchCondition=${param.searchCondition }&searchKeyword=${param.searchKeyword }'/>">
					<input class="btn btn-warning " type="button" value="수정 취소">
				</a>
				<a href="<c:url value='/chat/sent?messageNo=${sendVo.messageNo }&currentPage=${param.currentPage }&searchCondition=${param.searchCondition }&searchKeyword=${param.searchKeyword }'/>">
					<input class="btn btn-warning " type="button" value="목록">
				</a>	
			</div>
		</div>
	</form>
</div>

<%@ include file="../include/bottom.jsp"%>
