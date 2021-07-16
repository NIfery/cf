<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../incChat/top.jsp" %> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
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
</script>
<title>받은 쪽지함</title>

  <div class="col-13 col-sm-7 col-md-9">
  	<table class="table table-hover">
  <thead>
    <tr  class="table-warning text-dark">
      <th scope="col">no</th>
      <th scope="col">제목</th>
      <th scope="col">내용</th>
      <th scope="col">작성일</th>
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
	      <th scope="row">${vo.messageNo }</th>
	      <td>${vo.messageTitle }</td>
	      <td>${vo.messageContent }</td>
	      <td><fmt:formatDate value="${vo.messageRegdate }" type="date" pattern="yyyy-MM-dd"/></td>
	      <td><a id="delete" href="<c:url value='/chat/deleteChat?messageNo=${vo.messageNo }'/>">삭제</a>
	      </td>
	    </tr>
  	</c:forEach>
  	
  </c:if>
  </tbody>
</table>
  </div>
</div>
</div>


<%@ include file="../include/bottom.jsp" %> 