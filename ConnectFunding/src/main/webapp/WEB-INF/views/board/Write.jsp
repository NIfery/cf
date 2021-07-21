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
<script src="<c:url value='/resources/lang/summernote-ko-KR.js'/>"></script>
	<script type="text/javascript">
		$(function(){
			$('#summernote').summernote({
				height: 300,                 // 에디터 높이
				minHeight: null,             // 최소 높이
				maxHeight: null,             // 최대 높이
				focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
				lang: "ko-KR",					// 한글 설정
				placeholder: '내용을 입력하세요.',	//placeholder 설정
				callbacks: {	//여기 부분이 이미지를 첨부하는 부분
					onImageUpload : function(files) {
						uploadSummernoteImageFile(files[0],this);
					},
					onPaste: function (e) {
						var clipboardData = e.originalEvent.clipboardData;
						if (clipboardData && clipboardData.items && clipboardData.items.length) {
							var item = clipboardData.items[0];
							if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
								e.preventDefault();
							}
						}
					}
				}
	});
        
	/**
	* 이미지 파일 업로드
	*/
	function uploadSummernoteImageFile(file, editor) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/uploadSummernoteImageFile",
			contentType : false,
			processData : false,
			success : function(data) {
            	//항상 업로드된 파일의 url이 있어야 한다.
				$(editor).summernote('insertImage', data.url);
			}
		});
	}
			
			/*  */
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