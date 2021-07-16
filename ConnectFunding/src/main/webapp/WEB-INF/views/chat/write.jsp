<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../incChat/top.jsp"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script type="text/javascript"
	src="<c:url value='/assets/js/jquery-3.6.0.min.js'/>"></script>

<title>받은 쪽지함</title>

		<div class="col-13 col-sm-7 col-md-6">
			<form>
				<h1>쪽지쓰기</h1>
				<div class="form-group">
					<label for="title">제목</label> <input type="text"
						class="form-control" id="title" placeholder="제목을 입력하세요">
				</div>

				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control" id="content" rows="3"
						placeholder="내용을 입력하세요"></textarea>
					<input class="btn btn-warning m-4" type="submit" value="전송">
					<input class="btn btn-warning m-4" type="reset" value="취소">
				</div>
			</form>
		</div>
	</div>
</div>


<%@ include file="../include/bottom.jsp"%>
