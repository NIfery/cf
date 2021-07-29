<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
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

<!-- MAIN CONTENT-->
<div class="main-content">
	<div class="section__content section__content--p30">
		<h3 class="title-5 m-b-35">받은 편지</h3>
		<div class="form-group">
			<label for="title">제목</label>
			 <input type="text"
				class="form-control" value="${sendVo.messageTitle }" readonly="readonly">
		</div>

		<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control" rows="3" readonly="readonly">${sendVo.messageContent }</textarea>
		</div>
			
		<br>
			
		<div class="border border-warning p-3">
			<h3 class="title-5 m-b-35">답변</h3>
			<form name="frmChat" method="post" 
				action="<c:url value='/chat/adminEdit?messageNo=${receiveVo.messageNo }&currentPage=${param.currentPage }&searchCondition=${param.searchCondition }&searchKeyword=${param.searchKeyword }&startDay=${param.startDay}&endDay=${param.endDay }'/>">
				<div class="form-group">
					<label for="title">제목</label> 
					<input type="text" class="form-control" id="messageTitle" name="messageTitle" value="${receiveVo.messageTitle }">
				</div>
		
				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control" id="messageContent" name="messageContent" rows="3"
						placeholder="내용을 입력하세요">${receiveVo.messageContent }
					</textarea>
				</div>
				<div class="text-center">
					<input class="btn btn-warning m-4" type="submit" value="수정">
					<a href="<c:url value='/chat/adminDetail?messageNo=${receiveVo.messageNo }&currentPage=${param.currentPage }&searchCondition=${param.searchCondition }&searchKeyword=${param.searchKeyword }&startDay=${param.startDay}&endDay=${param.endDay }'/>">
						<input class="btn btn-warning m-2" type="button" value="취소">
					</a>
				</div>
			</form>
		</div>
	</div>
</div>

<%@ include file="../inc/adminBottom.jsp"%>