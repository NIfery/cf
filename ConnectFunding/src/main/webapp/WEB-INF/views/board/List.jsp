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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/nice-select2.css">
<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/bootstrap.js'/>"></script>

<script type="text/javascript">

	function pageProc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();	
	}
</script>

</head>
<body>

<form action="<c:url value='/board/List'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="currentPage"><br>
	<input type="hidden" name="lastPage" value="${pagingInfo.lastPage }">
	<input type="hidden" name="firstPage" value="${pagingInfo.firstPage }">
	<input type="hidden" name="blockSize" value="${pagingInfo.blockSize }">
	<input type="hidden" name="searchCondition" value="${param.searchCondition}"><br>
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword }"><br>	
</form>

	<div class="container">
		<table class="table table-hover">
		<h1><span class="glyphicon glyphicon-list-alt"></span> 자유게시판 </h1>
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
				
				<c:set var="delChk" value="Y"/>
				
				<c:if test="${!empty list }">
					<c:forEach var="vo" items="${list }" >
						<tr>
							<th>${vo.boardNo }</th>
							<th>
							<c:if test="${vo.delFlag == 'N'}">
							<!--제목 클릭시 detail 이동 -->
							<a href="<c:url value='/board/CountUpdate?boardNo=${vo.boardNo}'/>">${vo.boardTitle }
							<c:forEach var="map" items="${countList}">
							<c:if test="${vo.boardNo == map['BOARD_NO']}">
								[${map['COUNT']}]
							</c:if> 
							</c:forEach>  </a>
								<c:if test="${vo.newImg < 24 }">
									<img style="width: 20px" src="<c:url value='/resources/images/newimg.jpg'/>">
								</c:if>
								<c:if test="${!empty vo.boardOldfilename }">
									<img style="width: 30px" src="<c:url value='/resources/images/upload.jpg'/>">
								</c:if>
							</c:if>
							
							<c:if test="${vo.delFlag == 'Y'}">
								해당 글은 작성자에 의하여 삭제된 게시글입니다.	
							</c:if>
							</th>
							<th>${vo.userNickName }</th>
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
			<form class="pull-left" action="<c:url value='/board/List'/>" method="post">
				<select name="searchCondition">
					<option value="BOARD_TITLE"
					 <c:if test="${param.searchCondition == 'BOARD_TITLE' }">            	
            		selected="selected"
            		</c:if>
					>제목</option>
					<option value="USER_NICKNAME"
				    <c:if test="${param.searchCondition == 'USER_NICKNAME' }">            	
            		selected="selected"
            		</c:if>
					>작성자</option>
				</select>
				&nbsp;
				<input style="margin-top: 7px; height: 30px;" type="text" name="searchKeyword" title="검색어 입력" value="${param.searchKeyword }">
				<input type="submit" value="검색">
			</form>
		</div>		
	
	<div class="text-center">
	<!-- 이전 블럭 처리 -->
		<c:if test="${pagingInfo.firstPage>1 }">
			<a href="#" onclick="pageProc(${pagingInfo.firstPage-1})">
				<img src="<c:url value='/resources/images/leftbtn.PNG'/>">
			</a>
		</c:if>
	<!-- 게시판 페이징 처리 -->
	<ul class="pagination">
		<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
				<c:if test="${i ==pagingInfo.currentPage }">
					<li><a>${i}</a></li>
				</c:if>
				
				<c:if test="${i!=pagingInfo.currentPage }">
					<li><a href="#" onclick="pageProc(${i})"> ${i}</a></li>
				</c:if>
		</c:forEach>
	</ul> 
	<!--다음 블럭 처리-->
	<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
		<a href="#" onclick="pageProc(${pagingInfo.lastPage+1})">
			<img src="<c:url value='/resources/images/rightbtn.PNG'/>">
		</a>
	</c:if>
		 </div>
	</div>
</body>
</html>
<%@ include file="../include/bottom2.jsp" %> 