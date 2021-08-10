<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/top2.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ConnectFunding 게시글 조회	</title>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/bootstrap.js'/>"></script>
	
	<script type="text/javascript">
		$(function(){
			$('#DeleteOk').click(function(){
				$('form[name=boardInfo]').submit();
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
	<form name="boardInfo" method="post" enctype="multipart/form-data" action="<c:url value='/board/DeleteOk'/>">
		<input type="hidden" name="boardNo" value="${vo.boardNo }">
		<input type="hidden" name="boardOldfilename" value="${vo.boardFilename }">
	</form>

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
					<input type="text" class="form-control" name="userNickName" id="userNickName" placeholder="id 출력란" readonly="readonly" value="${vo.userNickName }">
				</div>		
				<br>	
				<div class="mb-3">
					<label for="content">내용</label>
					<div style="height: 500px" class="form-control" name="boardContent" >${vo.boardContent }</div>
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
				<c:if test="${vo.userNickName == userNickName}">
					<a href="<c:url value='/board/Edit?boardNo=${vo.boardNo}'/>">
						<button type="submit" class="btn btn-sm btn-primary" id="btnEdit">수정</button>
					</a>
						<button type="button" class="btn btn-sm btn-primary" id="btnDelete" data-toggle="modal" data-target="#exampleModal">삭제</button>
				</c:if>
			<!-- end -->
			
				<!-- 모달 영역 -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true"
			>
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">제목 : ${vo.boardTitle}</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">게시물을 삭제하시겠습니까?</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="DeleteOk" onclick="DeleteOk">삭제하기</button>
							<button type="button" class="btn btn-primary" data-dismiss="modal">취소하기</button>
						</div>
					</div>
				</div>
			</div>
			
				<!-- 모달 종료 -->
			
				<a href="<c:url value='/board/List'/>">
					<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
				</a>
				<hr>
				<!-- 이전글 다음글  -->
				<c:if test="${vo2.preTitle =='다음글이 없습니다.' }">
					<div>▲ 다음글 ${vo2.preTitle }</div>
				</c:if>
				<c:if test="${vo2.preTitle !='다음글이 없습니다.' }">
					<div>▲ 다음글 <a href="<c:url value='/board/CountUpdate?boardNo=${vo2.preNo }'/>">${vo2.preTitle } </a></div>
				</c:if>
				<c:if test="${vo2.nextTitle =='이전글이 없습니다.' }">
					<div>▼ 이전글 ${vo2.nextTitle }</div>
				</c:if>
				<c:if test="${vo2.nextTitle !='이전글이 없습니다.' }">
					<div>▼ 이전글 <a href="<c:url value='/board/CountUpdate?boardNo=${vo2.nextNo }'/>">${vo2.nextTitle} </a></div>
				</c:if>
				<!--  -->
			</div>
				<br>
				<c:if test="${vo.userNickName != userNickName }">
				<a href="<c:url value='/board/List?searchCondition=USER_NICKNAME&searchKeyword=${vo.userNickName }'/>">
				 	< ${vo.userNickName }님의 게시글 더 보기 >
				</a>
				</c:if> 
				
				<c:if test="${vo.userNickName == userNickName }">
				<a href="<c:url value='/board/List?searchCondition=USER_NICKNAME&searchKeyword=${userNickName }'/>">
					< 내가쓴 게시글 더 보기 >
				</a>
				</c:if> 
				<br>
		</div>
		<div class="container">
		<h3>댓글 목록</h3>
		</div>
		<hr>
		
		<!-- 댓글 리스트 출력 -->
		<div class="container">
        	<div class="commentList"></div>
    	</div>
		<!-- 출력 종료   -->
		
		<div class="container">
			<label for="content">${userNickName}</label>
			<form name="commentInsertForm">
				<div class="input-group">
					<input type="hidden" name="BoardNo" value="${vo.boardNo}" />
					<input type="hidden" name="userNickName" value="${userNickName}"/>
					<input type="text" class="form-control" id="content" name="CommentContent"placeholder="댓글 내용을 입력하세요.">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button"name="commentInsertBtn">등록</button>
					</span>
				</div>
			</form>
		</div>

		<br>
		<br>
		
	    <!-- ajax 댓글 처리  -->
			<%@ include file="Comments.jsp" %>
		<!-- ajax 처리 종료 -->
		
	</article>
</body>
</html>
<%@ include file="../include/bottom2.jsp" %>