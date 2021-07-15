<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			$('#summernote').summernote();
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
			<h2>게시글 작성</h2>
			<br>
			<form name="form" id="form" role="form" method="post" action="/board/List">
				<div class="mb-3">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요">
				</div>				
				<br>
				<div class="mb-3">
					<label for="reg_id">작성자</label>
					<input type="text" class="form-control" name="reg_id" id="reg_id" placeholder="id 출력란">
				</div>		
				<br>	
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="10" name="summernote" id="summernote" placeholder="내용을 입력해 주세요" ></textarea>
				</div>
				<br>
				<div class="mb-3">
					<label for="tag">업로드파일</label>
					<input type="file" class="" name="file" id="file" placeholder="업로드 파일을 선택해 주세요">
				</div>
			</form>
				<br>
				<br>
			<div >
				<button type="button" class="btn btn-sm btn-primary" id="btnSave">등록</button>
				<a href="<c:url value='/board/List'/>">
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
				</a>
			</div>
		</div>
	</article>
</body>
</html>