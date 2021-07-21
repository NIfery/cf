<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/top.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ConnectFunding 게시판</title>
<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/bootstrap.js'/>"></script>

</head>
<body>
	<div class="container">
		<table class="table table-hover">
		<h1> 자유게시판 </h1>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>업로드파일</th>
					<th>조회수</th>
				</tr>
			</thead>
			
			<!-- 게시글 반복 처리 -->
			<tbody>
				<c:if test="${empty list }">
					<tr>
						<td colspan="6">게시글이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty list }">
					<c:forEach var="vo" items="${list }" >
						<tr>
							<th>${vo.boardNo }</th>
							<th>
							<!--제목 클릭시 detail 이동 -->
							<a href="<c:url value='/board/CountUpdate?boardNo=${vo.boardNo}'/>">${vo.boardTitle }</a>
							</th>
							<th>테스터</th>
							<th><fmt:formatDate value="${vo.boardRegdate}" pattern="yyyy-MM-dd HH:mm:ss"/></th>
							<th>${vo.boardOldfilename }</th>
							<th>${vo.boardReadcount }</th>
						</tr>
					</c:forEach>	
				</c:if>
			</tbody>
		</table>
	
		<a class="btn btn-default pull-right" href="<c:url value='/board/Write'/>">게시글 작성</a>
			
		<div id="divSearch">
			<form action="<c:url value='/board/List'/>" method="post">
				<select name="searchCondition">
					<option value="no">글번호</option>
					<option value="title">제목</option>
					<option value="id">작성자</option>
				</select>
				<input type="text" name="searchKeyword" title="검색어 입력" value="">
				<input type="submit" value="검색">
			</form>
		</div>		
	
	<!-- 게시판 페이징 처리 -->
		<div class="text-center">
			<ul class="pagination">
				<li><a href='#'>1</a></li>
				<li><a href='#'>2</a></li>
				<li><a href='#'>3</a></li>
				<li><a href='#'>4</a></li>
				<li><a href='#'>5</a></li>
			</ul>
		</div>
	</div>
</body>
</html>
<%@ include file="../include/bottom.jsp" %> 