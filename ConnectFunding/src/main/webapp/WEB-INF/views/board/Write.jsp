<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/top.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ConnectFunding 게시글작성</title>
<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/bootstrap.js'/>"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
	
	<script type="text/javascript">
		$(function(){
			$('#summernote').summernote()
			
			$('form[name=frmWrite]').submit(function(){
				if($('#boardTitle').val().length < 1){
					alert('제목을 입력하세요');
					$('#title').focus();
					event.preventDefault();
			
				}else if($('#summernote').val().length < 1) {
					alert('내용을 입력하세요');
					$('#summernote').focus();
					event.preventDefault();
				
				}else if($('#boardTitle').val().length > 30) {
					alert('제목은 30자내로 작성해주세요.');
					$('#title').focus();
					event.preventDefault();
				}
			});
		});
		
		cleanText = $("#summernote").code().replace(/<\/?[^>]+(>|$)/g, "");
		
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
			<h2>게시글 작성</h2>
			<br>
			<form name="frmWrite" role="form" method="post" enctype="multipart/form-data" action="<c:url value='/board/Write'/>">
				<div class="mb-3">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="boardTitle" id="boardTitle" placeholder="제목을 입력해 주세요(30자이하)"
						value="">
				</div>				
				<br>
				<div class="mb-3">
					<label for="reg_id">작성자</label>
					<input type="text" class="form-control" name="id" id="id" placeholder="id 출력란">
				</div>		
				<br>	
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="10" name="boardContent" id="summernote" placeholder="내용을 입력해 주세요" ></textarea>
				</div>
				<br>
				<div class="mb-3">
					<label for="tag">업로드파일</label>
					<input type="file" name="upfile" id="upfile" placeholder="업로드 파일을 선택해 주세요">
				</div>
				
			<div>
				<button type="submit" class="btn btn-sm btn-primary" id="btnSave">등록</button>
				<a href="<c:url value='/board/List'/>">
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
				</a>
			</div>
			</form>
				<br>
				<br>
		</div>
	</article>
</body>
</html>
<%@ include file="../include/bottom.jsp" %> 