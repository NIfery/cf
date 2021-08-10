<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../include/top.jsp"%>
<script type="text/javascript" src="<c:url value='/assets/js/jquery-3.6.0.min.js'/>"></script>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/ssong.css">
<script type="text/javascript">
   var receipt_id;
   function idThrow(id){
      receipt_id=id;
   }
   
   $(function(){
      $('#btDelete').click(function(){
         if($('#pwd').val().length<1){
            alert('비밀번호를 입력하세요.');
            $('#pwd').focus();
            return false;
         }
         location.href="${pageContext.request.contextPath}/project/cancle?receiptId="+receipt_id+"&userNo="+$('#userNo').val()+"&pwd="+$('#pwd').val();
      });
   });
</script>
<style type="text/css">
.has-search .form-control {
	padding-left: 2.375rem;
}

.has-search .form-control-feedback {
	position: absolute;
	z-index: 2;
	display: block;
	width: 2.375rem;
	height: 2.375rem;
	line-height: 2.375rem;
	text-align: center;
	pointer-events: none;
	color: #aaa;
}

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

.page-link {
	background-color: white;
}
</style>
<c:set var="today" value="<%=new java.util.Date()%>" />
<c:set var="todayDate"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd hh:mm:ss" /></c:set>
<div class="single_sidebar_widget post_category_widget"
	style="width: 1000px; margin-left: 200px; background: white; margin-top: 50px; min-height: 1400px;">
	<span class="widget_title"
		style="text-align: left; font-size: 2.5em; margin-left: 10px;">
		후원현황</span> <br> <br> <br>
	<div>
		<div class="row" style="margin-top: 20px; margin-left: 5px;">
			<div class="col-md-6" style="width: 500px; height: 50px;">
				<strong style="color: red;"> <%-- ${fn:length(fdlist)} --%>
					${pageInfo.totalRecord}
				</strong> 건의 후원 내역이 있습니다.
			</div>
		<%-- 	<div class="col-md-6 col-md-offset-6">
				<div class="form-group has-search" style="">
               <span class="fa fa-search form-control-feedback"></span> 
               <form action="<c:url value='/mypages/support'/>" name="frmSearch" method="post">
               <input type="text" class="form-control" name="searchKeyword" value="${map.searchKeyword}"
                  placeholder="프로젝트, 창작자를 입력하세요.">
               </form>
            </div> --%>
				<div class="form-group">
					<div class="input-group mb-3">
						<form action="<c:url value='/mypages/support'/>" name="frmSearch"
							method="post">
							<span class="d-flex"> <input type="text"
								class="form-control" placeholder="프로젝트명을입력하세요."
								name="projectName" value="${map['PROJECT_NAME']}"
								style="width: 250px;">
								<button class="btns" type="submit"
									style="background: none; border: 1px; color: black;">
									<i class="fas fa-search special-tag"></i>
								</button>
							</span>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="main" style="min-height: 600px; margin-top: 20px; height: auto;">
			<c:if test="${empty fdlist}">
				<div class="div_1">
					<div class="div_2">
						<img
							src="${pageContext.request.contextPath}/assets/img/ssong/gift-box.png"
							style="width: 100px;">
					</div>
					<div>
						<br> <span style="font-size: 1.2em;">후원 내역이 없습니다.</span> <br>
						<br>
					</div>
				</div>
			</c:if>
			<c:if test="${!empty fdlist}">
				<c:forEach var="map" items="${fdlist }">
					<div class="wrap"
						style="height: 180px; margin-bottom: 20px; border-radius: 0; border: none; border-bottom: 1px solid #ced4da; width: 900px;">
						<div class="trand-right-single d-flex">
							<div class="trand-right-img">
								<img
									src="<c:url value='/project_assets/projectImg/${map["PROJECT_IMAGE"]}'/>"
									style="width: 180px; height: 130px; margin: 30px 20px; border-radius: 20px;">
							</div>
							<div class="trand-right-cap"
								style="margin: 20px 10px; width: 500px;">
								<span class="color2" style="font-size: 0.9em;">후원일 &nbsp
									<fmt:formatDate value="${map['SUPPORT_DATE']}"
										pattern="yyyy-MM-dd" />
								</span><br>
								<div style="margin-top: 10px; margin-bottom: 10px;">
									<span class="color1" style="font-size: 1.2em;">${map['PROJECT_NAME']}</span><br>
									<span class="color2" style="font-size: 0.9em;">${map['USER_NAME']}</span><br>
									<span class="color2" style="font-weight: bold;"> <fmt:formatNumber
											value="${map['FUNDING_AMOUNT']}" pattern="#,###" />원
									</span><br>
								</div>
								<c:if test="${todayDate>=map['PROJECT_ENDDATE']}">
									<c:if test="${todayDate<map['PROJECT_ENDDATE'] }">
		                        	  <a onclick="idThrow($(this).next().val())" style="color: blue"
										href="#" data-toggle="modal" data-target="#myModal"
										id="btCancleModal">환불하기</a> <input type="hidden" id="receiptId"
										value="${map['RECEIPT_ID'] }"> <input type="hidden"
										id="userNo" value="${map['USER_NO'] }">
		                          	</c:if>
		                        	<c:if test="${todayDate>=map['PROJECT_ENDDATE'] }">
			                    		펀딩종료
		                        	</c:if>
	                            </c:if>
								<div class="modal fade" id="myModal" data-backdrop="static"
									tabindex="-1" role="dialog"
									aria-labelledby="staticBackdropLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="staticBackdropLabel">환불하기</h5>
												<button type="button" class="btn-close" data-dismiss="modal"
													aria-label="Close"></button>
											</div>
											<form name="frmDelete" method="post">
												<div class="modal-body">
													<!-- 모달 body -->
													<div class="form-group" style="width: 450px; margin: 3px;">
														<label class="form-label mt-4">비밀번호 확인</label> <input
															type="password" class="form-control" name="pwd" id="pwd"
															placeholder="비밀번호를 입력하세요.">
													</div>
												</div>
												<div class="modal-footer">
													<button type="button" id="btDelete"
														class="genric-btn warning circle">환불</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
			<!-- 페이징처리 -->
			<nav class="blog-pagination justify-content-center d-flex">
				<ul class="pagination">
					<c:if test="${pageInfo.firstPage>1 }">
						<li class="page-item"><a href="#" class="page-link"
							onclick="pageProc(${pageInfo.firstPage-1})" aria-label="Previous">
								<i class="ti-angle-left"></i>
						</a></li>
					</c:if>

					<c:forEach var="i" begin="${pageInfo.firstPage }" end="${pageInfo.lastPage}">
						<c:if test="${i==pageInfo.currentPage }">
						<li class="page-item active">
							<a href="#" class="page-link">${i}</a>
						</li>
						</c:if>
						<c:if test="${i!=pageInfo.currentPage }">
							<a href="#"  onclick="pageProc(${i})" class="page-link">${i}</a>
						</c:if>
					</c:forEach>

					<c:if test="${pageInfo.lastPage < pageInfo.totalPage }">
						<li class="page-item"><a href="#" class="page-link"
							onclick="pageProc(${pageInfo.lastPage+1})"> <i
								class="ti-angle-right"></i></a></li>
					</c:if>
				</ul>
			</nav>

		</div>
	</div>
<form action="<c:url value='/mypages/support'/>" name="frmSupport" method="post">
	<input type="hidden" name="currentPage"><br> 
	<input type="hidden" name="projectName" value="${map['PROJECT_NAME']}"><br>
</form>
<script type="text/javascript">
function pageProc(curPage){
   $('input[name=currentPage]').val(curPage);
   $('form[name=frmSupport]').submit();   
}
</script>
<%@ include file="../include/bottom.jsp"%>