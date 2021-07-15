<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<style type="text/css">
ul {
	list-style: none;
	padding-left: 0px;
}

a {
	text-decoration: none;
}
.left{
	float: left;
	width: 10%;
}
.container{
	float: left;
	width:60%;
}
</style>
<title>받은 쪽지함</title>
</head>
<body>
	<div class="left">
		<ul>
			<li><button>쪽지쓰기</button></li>
			<li><a href="#">받은 쪽지함</a></li>
			<li><a href="#">보낸 쪽지함</a></li>
		</ul>
	</div>
	<div class="container">
		<button>삭제</button>
		<table>
			<colgroup>
				<col style="width: 5%" />
				<col style="width: 15%" />
				<col style="width: 65%" />
				<col style="width: 15%" />
			</colgroup>
			<thead>
				<tr>
					<th><input type="checkbox" name="chkAll"></th>
					<th scope="col">보낸사람</th>
					<th scope="col">내용</th>
					<th scope="col">날짜</th>
				</tr>
			</thead>
			<tbody>
			
			</tbody>
		</table>
	</div>
</body>
</html>