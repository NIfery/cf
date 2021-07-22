<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<script type="text/javascript"
	src="<c:url value='/assets/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('form[name=frmChat]').submit(function(){
			if($('#title').val().length<1){
				alert('제목을 입력하세요');
				$('#title').focus();
				event.preventDefault();
				return false;
			}else if($('#content').val().length<1){
				alert('내용을 입력하세요');
				$('#content').focus();
				event.preventDefault();
				return false;
			}
		});
		
		$('#deleteSend').click(function(){
			if(!confirm('삭제하시겠습니까?')){
				event.preventDefault();
				return false;
			}
		});
		
		$('#deleteReceive').click(function(){
			if(!confirm('삭제하시겠습니까?')){
				event.preventDefault();
				return false;
			}
		});
	});
</script>
<!-- MAIN CONTENT-->
<div class="main-content">
	<div class="section__content section__content--p30">
		<h3 class="title-5 m-b-35">받은 쪽지</h3>
				<div class="form-group">
					<label for="title">제목</label>
					 <input type="text"
						class="form-control" id="messageTitle" name="messageTitle" value="${sendVo.messageTitle }" readonly="readonly">
				</div>

				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control" id="messageContent" name="messageContent" rows="3" readonly="readonly">${sendVo.messageContent }</textarea>
				</div>
				
				<br>
				
				<c:if test="${empty receiveVo }">
				<div class="border border-warning p-3">
				<h3 class="title-5 m-b-35">답변</h3>
				<form name="frmChat" method="post" action="<c:url value='/chat/adminWrite'/>">
				<div class="form-group">
				<input type="hidden" name="messageNo" value="${sendVo.messageNo }">
					<label for="title">제목</label> <input type="text"
						class="form-control" id="messageTitle" name="messageTitle" placeholder="제목을 입력하세요">
				</div>

				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control" id="messageContent" name="messageContent" rows="3"
						placeholder="내용을 입력하세요"></textarea>
				</div>
				<div class="text-center">
					<input class="btn btn-warning m-4" type="submit" value="등록">
					<input class="btn btn-warning m-4" type="reset" value="취소">
				</div>
			</form>
			</div>
			</c:if>
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
				<div class="text-center m-3">
					<a href="<c:url value='/chat/adminEdit?messageNo=${receiveVo.messageNo }'/>">
					<input class="btn btn-warning m-2" type="button" value="수정">
					</a> 
					<a id="deleteReceive" href="<c:url value='/chat/deleteReceive?messageNo=${receiveVo.messageNo }'/>">
        		<input class="btn btn-warning m-2" type="button" value="답변 삭제">
        		</a> 
				</div>
			</div>
			</c:if>
				<div class="text-center m-3">
        	<a id="deleteSend" href="<c:url value='/chat/adminDelete?messageNo=${receiveVo.messageNo }'/>">
        		<input class="btn btn-warning m-2" type="button" value="쪽지 삭제">
        		</a> 
        	<a href="<c:url value='/chat/adminInbox'/>"><input class="btn btn-warning m-2" type="button" value="목록"></a>	
        	</div>
			
			
	</div>
</div>
<%@ include file="../inc/adminBottom.jsp"%>