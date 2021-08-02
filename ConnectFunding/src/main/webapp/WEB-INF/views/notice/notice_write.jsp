<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../include/top.jsp"%>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="<c:url value='/project_assets/js/summernote/summernote-lite.js'/>"></script>
<script src="<c:url value='/project_assets/js/summernote/lang/summernote-ko-KR.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/project_assets/css/summernote/summernote-lite.css'/>">

<script type="text/javascript">
$(document).ready(function() {
	$('#summernote').summernote({ 
		height: 400,                  // 에디터 높이
		minHeight: null,              // 최소 높이
		maxHeight: null,              // 최대 높이
		focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		lang: "ko-KR",				  // 한글 설정
		placeholder: '내용을 입력하세요', //placeholder 설정
		disableResizeEditor: true,
		callbacks: {
	      	onImageUpload: function(files, editor, welEditable) {
	      		for(var i = files.length -1; i>=0; i--) {
	       			sendFile(files[i], this);
	       		}
	       	}
	    }
	});
	
	function sendFile(file, el) {
		var form_data = new FormData();
		form_data.append('file', file);
		$.ajax({
			data: form_data,
			type : "post",
			url: 'notice_image',
			cache :false,
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(img_name) {
				$(el).summernote('editor.insertImage', img_name);
			}
		});
	}
	
});
</script>

<style>
</style>
<div>
	<form method="post" name="frmNotice" enctype="multipart/form-data"
		action="<c:url value='/notice/notice_write'/>">

	<div class="container" style="height: 1000px;">
		<div class="notice_title" style="margin-top: 50px;">
			<h2>공지사항 등록</h2>
			<br>
		</div>
		<div class="mb-3" style="width: 700px;">
			<label for="noticeTitle">제목</label> 
			<input type="text" class="form-control" name="noticeTitle" placeholder="제목을 입력하세요.">
		</div>
		<br>
		<div class="form-group" style="width: 300px;">
			<label for="exampleSelect2" class="form-label mt-4">카테고리</label> 
			<select class="form-select" id="exampleSelect2" name="noticeCategory"
				style="padding: 0 0;">
				<option value="공지사항">공지사항</option>
				<option value="이벤트">이벤트</option>
				<option value="보도자료">보도자료</option>
			</select>
		</div>
		<br>
		<div class="mb-3">
			<label for="content">내용</label>
			<textarea class="form-control" name="noticeContent"
				id="summernote" placeholder="내용을 입력해 주세요">
			</textarea>
		</div>
		<div class="collapse2" id="collapseExample">
			<input class="form-control" type="file" id="formFile" name="file"
				style="width: 330px;">
		</div>
		<br>
		<button class="genric-btn warning circle arrow" type="submit">등록하기</button>
	</div>
	
	</form>
</div>	
	
<%@ include file="../include/bottom.jsp"%>
