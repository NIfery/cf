<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
.div_1 {
	padding: 0px 16px;
	display: flex;
	flex-direction: column;
	-webkit-box-pack: center;
	justify-content: center;
	-webkit-box-align: center;
	align-items: center;
	height: 300px;
	margin-top: 70px;
}
.nice-select.form-select{
 height: 40px; width: 170px; font-size: 0.9em;
 margin-left: 250px;
}
</style>

<div class="single_sidebar_widget post_category_widget"
	style="width: 1000px; margin-left: 200px; background: white; height: 700px; margin-top: 50px;">
	<span class="widget_title" style="text-align: left; font-size: 2.5em; margin-left: 10px;">
		좋아한 프로젝트</span>
	<br> <br> <br>
	<div>
		<div class="row" style="margin-top: 20px; margin-left: 5px;">
			<div class="col-md-6" style="width: 500px; height: 50px;">
				<strong style="color: red;">0</strong> 건의 후원 내역이 있습니다.</div>
			<div class="col-md-6 col-md-offset-6">
				<div class="form-group" style="width: 450px; margin: 3px;">
					<select class="form-select" id="exampleSelect2" name="" 
						style="padding: 0 0;">
						<option value="추가순">추가순</option>
						<option value="마감 임박순">마감 임박순</option>
					</select>
				</div>
			</div>
		</div>
		<div class="main" style="height: 600px; margin: 0 auto;">
			<div class="div_1">
				<div class="div_2">
					<img src="${pageContext.request.contextPath}/assets/img/ssong/click.png"
						style="width: 100px;">
				</div>
				<div>
					<br>
					<span style="font-size: 1.2em;">좋아한 프로젝트가 없습니다.</span>	
					<br><br>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../include/bottom.jsp"%>