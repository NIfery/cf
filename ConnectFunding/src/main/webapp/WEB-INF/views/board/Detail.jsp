<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/top.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ConnectFunding 게시글 조회	</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/nice-select2.css">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/bootstrap.js'/>"></script>
	
	<script type="text/javascript">
		$(function(){
			$('#btnDelete').click(function(){
				alert('반응테스트');
			});
		});
	</script>

<style>
body {
  padding-top: 70px;
  padding-bottom: 30px;
}
</style>

</head>
<body>
	<article>
		<div class="container">
			<h2>게시글 조회</h2>
			<br>
				<div class="mb-3">
					<label for="title" style="font-size: 20px;">제목 : ${vo.boardTitle}</label> &nbsp;&nbsp;&nbsp;&nbsp;
					<span> 조회수 : ${vo.boardReadcount }</span>
				</div>				
				<br>
				<div class="mb-3">
					<label for="reg_id">작성자</label>
					<input type="text" class="form-control" name="userName" id="userName" placeholder="id 출력란" readonly="readonly" value="${vo.userName }">
				</div>		
				<br>	
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="10" name="boardContent" readonly="readonly">${vo.boardContent }</textarea>
				</div>
				<br>
				
				<div class="mb-3">
					<label for="upFile">첨부파일</label>
					<c:if test="${!empty vo.boardFilename }">
					<a href="<c:url value='/board/Download?boardNo=${vo.boardNo}&boardFilename=${vo.boardFilename }&boardOldfilename=${vo.boardOldfilename }'/>">
					<span>파일정보 : ${fileInfo}</span>
					</a>
					<span>다운로드수 : ${vo.boardDowncount }</span>
					</c:if>
				</div>
			<div>
			<!-- 본인글 일경우에만 보이게 처리 -->
				<c:if test="${vo.userName == userName}">
					<a href="<c:url value='/board/Edit?boardNo=${vo.boardNo}'/>">
						<button type="submit" class="btn btn-sm btn-primary" id="btnEdit">수정</button>
					</a>
					
						<button type="button" class="btn btn-sm btn-primary" id="btnDelete" data-toggle="modal" data-target="#staticc">삭제</button>
				</c:if>
			<!-- end -->
			
			<!-- 모달테스트 시작 -->
				<button type="button" id='mod' class="btn btn-primary" data-toggle="modal"
					data-target=".bs-example-modal-sm">Small modal</button>

				<div class="modal fade bs-example-modal-sm" tabindex="-1"
					role="dialog" aria-labelledby="mySmallModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-sm">
						<div class="modal-content">...</div>
					</div>
				</div>

			<!-- 모달테스트 종료 -->
			
				<a href="<c:url value='/board/List'/>">
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
				</a>
			</div>
				<br>
				<c:if test="${vo.userName != userName }">
				<a href="<c:url value='/board/List?searchCondition=USER_NAME&searchKeyword=${vo.userName }'/>">
					${vo.userName }님의 게시글 더 보기
				</a>
				</c:if> 
				
				<c:if test="${vo.userName == userName }">
				<a href="<c:url value='/board/List?searchCondition=USER_NAME&searchKeyword=${userName }'/>">
					내가쓴 게시글 더 보기
				</a>
				</c:if> 
				
				<br>
		</div>
	</article>
</body>
</html>
<%@ include file="../include/bottom.jsp" %> 