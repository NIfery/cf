<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script type="text/javascript"
	src="<c:url value='/assets/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('form[name=frmChat]').submit(function(){
			if($('#title').val().length<1){
				alert('제목을 입력하세요');
				$('#title').focus();
				return false;
			}else if($('#content').val().length<1){
				alert('내용을 입력하세요');
				$('#content').focus();
				return false;
			}
		});
	});
</script>
<title>쪽지보기</title>
<c:import url="/chat/chatCategory"></c:import>
		<div class="col-13 col-sm-7 col-md-6">
			<form name="frmChat" method="post" action="<c:url value='/chat/edit'/>">
				<h1>쪽지쓰기</h1>
				<div class="form-group">
					<label for="title">제목</label> <input type="text"
						class="form-control" id="messageTitle" name="messageTitle" value="${sendVo.messageTitle }">
				</div>

				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control" id="messageContent" name="messageContent" rows="3">${sendVo.messageContent }</textarea>
					<div class="text-center m-3">
					<input class="btn btn-warning " type="submit" value="수정">
					<input type="hidden" name="messageNo" value="${sendVo.messageNo }">
					<a href="<c:url value='/chat/detail?messageNo=${sendVo.messageNo }'/>"><input class="btn btn-warning " type="button" value="수정 취소"></a>
					<a href="<c:url value='/chat/sent'/>"><input class="btn btn-warning " type="button" value="목록"></a>	
					</div>
				</div>
			</form>
		</div>
	</div>
</div>


<%@ include file="../include/bottom.jsp"%>
