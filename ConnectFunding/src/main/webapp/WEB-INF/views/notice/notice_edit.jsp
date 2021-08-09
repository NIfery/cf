<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../include/top.jsp"%>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$('#summernote').summernote({
		height: 400,           
		minHeight: null,             
		maxHeight: null,             
		focus: true,
		lang: "ko-KR",					
		placeholder: '내용을 입력하세요.',
		disableResizeEditor: true,
		callbacks: {
	      	onImageUpload: function(files, editor, welEditable) {
	      		for(var i = files.length -1; i>=0; i--) {
	       			sendFile(files[i], this);
	       		}
	       	}
	    }
	});
	
});
</script>

<style>
</style>
<article>
	<form method="post" name="frmNotice" enctype="multipart/form-data"
		action="<c:url value='/notice/notice_edit'/>">
	<input type="hidden" name="noticeNo" value="${noticeVo.noticeNo }">
	<input type="hidden" name="noticeOldfilename" value="${noticeVo.noticeOldfilename }">
	
	<div class="container" style="height: 1000px;">
		<div class="notice_title" style="margin-top: 50px;">
			<h2>공지사항 수정</h2>
			<br>
		</div>
		<div class="mb-3" style="width: 700px;">
			<label for="noticeTitle">제목</label> 
			<input type="text" class="form-control" name="noticeTitle" value="${noticeVo.noticeTitle }">
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
				id="summernote">${noticeVo.noticeContent }
			</textarea>
		</div>
		<div class="collapse2" id="collapseExample">
			<input class="form-control" type="file" id="formFile" name="file"
				style="width: 330px;"><br>
			<c:if test="${!empty noticeVo.noticeOldfilename}">
            	<span style="color: red;">
            		첨부파일을 새로 지정할 경우 기존파일 ${noticeVo.noticeOldfilename } 는 삭제됩니다.</span>
            </c:if>
		</div>
		<br>
		<button class="genric-btn warning circle arrow" type="submit">수정하기</button>
	</div>
	
	</form>
</article>
<%@ include file="../include/bottom.jsp"%>
