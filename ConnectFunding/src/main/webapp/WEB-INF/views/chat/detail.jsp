<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../incChat/top.jsp"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
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

		<div class="col-13 col-sm-7 col-md-8">
			<form name="frmChat" method="post" action="<c:url value='/chat/write'/>">
				<h1>보낸 쪽지</h1>
				<div class="form-group">
					<label for="title">제목</label>
					 <input type="text"
						class="form-control" id="messageTitle" name="messageTitle" value="${sendVo.messageTitle }" readonly="readonly">
				</div>

				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control" id="messageContent" name="messageContent" rows="3" readonly="readonly">${sendVo.messageContent }</textarea>
				</div>
					<a href="<c:url value='/chat/edit?messageNo=${sendVo.messageNo }'/>">
					<input class="btn btn-warning m-2" type="button" value="수정">
					</a> 
        	<a id="delete" href="<c:url value='/chat/deleteChat?messageNo=${sendVo.messageNo }'/>">
        		<input class="btn btn-warning m-2" type="button" value="삭제">
        		</a> 
        	<a href="<c:url value='/chat/sent'/>"><input class="btn btn-warning m-2" type="button" value="목록"></a>	
			</form>
		</div>
	</div>
</div>


<%@ include file="../include/bottom.jsp"%>
