<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script type="text/javascript"
	src="<c:url value='/assets/js/jquery-3.6.0.min.js'/>"></script>
<div class="container">
<div class="row no-gutters m-5">
  <div class="col-6 col-md-2">
  	<ul class="list-group">
  	<a href="${pageContext.request.contextPath}/chat/write"><li class="list-group-item d-flex justify-content-between align-items-center list-group-item-warning">
    쪽지쓰기
  </li></a>
  <a href="${pageContext.request.contextPath}/chat/inbox"><li class="list-group-item d-flex justify-content-between align-items-center">
    받은 쪽지함
    <span class="badge badge-primary badge-warning">${receiveCount }</span>
  </li></a>
  <a href="${pageContext.request.contextPath}/chat/sent"><li class="list-group-item d-flex justify-content-between align-items-center">
    보낸 쪽지함
    <span class="badge badge-primary badge-warning">${sentCount }</span>
  </li></a>
</ul>
  </div>
  <div class="col-12 col-md-1"></div>