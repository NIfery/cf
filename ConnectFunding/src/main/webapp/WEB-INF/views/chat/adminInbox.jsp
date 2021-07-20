<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<script type="text/javascript"
	src="<c:url value='/assets/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
		$(function(){
			$('input[name=chkAll]').click(function(){
				$('tbody input[type=checkbox]').prop('checked',this.checked);			
			});
			
			$('#delete').click(function(){
				var chkLen=$('tbody input[type=checkbox]:checked').length;
				if(chkLen==0){
					alert('먼저 삭제할 쪽지를 선택하세요');
				}else{			
					if(!confirm('삭제하시겠습니까?')){
						event.preventDefault();
						return false;
					}
					$('form[name="frmList"]').prop('action',
							'<c:url value="/chat/deleteMulti"/>');
					$('form[name="frmList"]').submit();
				}
			});
			
	});
</script>
<!-- MAIN CONTENT-->
<div class="main-content">
	<div class="section__content section__content--p30">

		<!-- DATA TABLE-->
		<section class="p-t-20">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h3 class="title-5 m-b-35">받은 쪽지함</h3>
						<form name="frmList" >
						<div class="table-responsive table-responsive-data2">
							<table class="table table-data2">
								<thead>
									<tr>
										<th><label class="au-checkbox"> <input
												type="checkbox" name="chkAll" > <span class="au-checkmark"></span>
										</label></th>
										<th>회원번호</th>
										<th>제목</th>
										<th>내용</th>
										<th>보낸날짜</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty list }">
										<tr>
											<td colspan="6">받은 쪽지가 없습니다.</td>
										</tr>
									</c:if>
									<c:if test="${!empty list }">
										<c:set var="idx" value="0"/>
										<c:forEach var="vo" items="${list }">
											<tr class="tr-shadow">
												<td><label class="au-checkbox"> <input
														type="checkbox" name="sMessage[${idx }].messageNo" value="${vo.messageNo }"> <span class="au-checkmark"></span>
												</label></td>
												<td><span class="block-email">${vo.userNo }</span></td>
												<td>${vo.messageTitle }</td>
												<td class="desc"><a  href="<c:url value='/chat/adminDetail?messageNo=${vo.messageNo }'/>">${vo.messageContent }</a></td>
												<td><fmt:formatDate value="${vo.messageRegdate }"
														type="date" pattern="yyyy-MM-dd" /></td>
											</tr>
											<c:set var="idx" value="${idx+1 }"/>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
        					<input class="btn btn-warning m-2" type="button" id="delete" value="선택한 쪽지 삭제">
						</div>
						</form>
					</div>
				</div>
			</div>
			<br> <br> <br>
		</section>
		<!-- END DATA TABLE-->
		<!-- END PAGE CONTAINER-->
	</div>
</div>
<%@ include file="../inc/adminBottom.jsp"%>