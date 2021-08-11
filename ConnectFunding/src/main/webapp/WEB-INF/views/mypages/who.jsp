<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../include/top.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="../_vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="../_vendor/prismjs/themes/prism-okaidia.css">
<link rel="stylesheet" href="../_assets/css/custom.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/ssong.css">
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

.genric-btn.primary-border {
    color: #9a9a9a;
    border: 1px solid #9a9a9a;
    background: #fff;
}
</style>
	<div class="single_sidebar_widget post_category_widget"
		style="width: 1200px; margin-left: 200px; background: white; height: auto; margin-top: 50px;">
		<form method="post">
		<input type="hidden" name="following" value="${vo.userName}">
		<input type="hidden" id="followingUserNo" name="followingUserNo" value="${vo.userNo}"> 
		<input type="hidden" name="userNo" value="${sessionScope.userNo}">
		<div class="trand-right-single d-flex">
			<div class="trand-right-img">
				<c:if test="${empty vo.userProfile}">
					<img src="<c:url value='/assets/img/logo/user.png'/>"
						style="width: 60px; height: 60px; margin: 25px 25px; border: none;">
				</c:if>
				<c:if test="${!empty vo.userProfile }">
					<div class="profile" style="margin: 20px 20px; border: none;">
						<img
							src="<c:url value='/profile_img/${vo.userProfile}'/>"
							style="width: 70px; height: 70px;">
					</div>
				</c:if>
			</div>
			<div class="trand-right-cap" id="nos"
				style="margin: 15px 25px; width: 470px;">
				<span class="color1">
					<p style="font-size: 1.2em; margin: 10px 10px;">
						<strong>${vo.userName}</strong>
					</p>
				</span>
				<span class="color1">
					<c:if test="${!empty vo.userIntro}">
						<span style="color: black;">${vo.userIntro}</span>
					</c:if>
					<c:if test="${empty vo.userIntro}">
						<span style="color: #c3bfbf;">등록된 자기소개가 없습니다.</span>
					</c:if>
				</span>
			</div>
			<div>
				<c:if test="${followCheck=='2' }">
						<button class="genric-btn info-border circle arrow" id="follow"
							style="width: 110px; height: 40px; margin: 40px 0px 0px 40px;">+ 팔로우</button>
				</c:if>
				<c:if test="${followCheck=='1' }">
					<button class="genric-btn info circle" id="unfollow"
						style="width: 110px; height: 40px; margin: 40px 0px 0px 40px;">√ 팔로잉</button>	
				</c:if>
			</div>
		</div>
		</form>
		<br>
		<br>
		<br>
	
		<div>
			<div class="col-lg-9 col-md-9">
				<div class="properties__button">
					<!--Nav Button  -->
					<nav>
						<div class="nav nav-tabs" id="nav-tab" role="tablist">
							<a class="nav-item nav-link active" id="nav-created-tab" data-toggle="tab" 
								href="#nav-created" role="tab" aria-controls="nav-created" aria-selected="true">
							올린 프로젝트 <span style="color: #ff6873;">&nbsp${count }</span></a>
							<a class="nav-item nav-link" id="nav-followers-tab" data-toggle="tab"
								href="#nav-followers" role="tab" aria-controls="nav-followers" aria-selected="false">
							팔로워 <span style="color: #ff6873;">&nbsp${followerCount }</span></a>	<!-- 나를 -->
							<a class="nav-item nav-link" id="nav-following-tab" data-toggle="tab" href="#nav-following"
								role="tab" aria-controls="nav-following" aria-selected="false">
							팔로잉 <span style="color: #ff6873;">&nbsp${followCount }</span></a>	<!-- 내가 -->
						</div>
					</nav>
					<!--End Nav Button  -->
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<!-- Nav Card -->
					<div class="tab-content" id="nav-tabContent">
						<!-- card one -->
						<div class="tab-pane fade show active" id="nav-created"
							role="tabpanel" aria-labelledby="nav-created-tab">
							<div class="whats-news-caption" id="one">
							<!-- 내용 시작 -->
								<div class="col-md-6" style="width: 500px; height: 50px; margin: 10px 10px;">
									<strong style="color: red;">
										${pagingInfo.totalRecord}
									</strong> 개의 프로젝트가 있습니다.
								</div>
								<div class="row" style="width: 1000px;">
								<c:if test="${empty list}">
								<div class="div_1">
									<div class="div_2">
										<img
											src="${pageContext.request.contextPath}/assets/img/ssong/create.png"
											style="width: 100px;">
									</div>
									<div>
										<br> <span style="font-size: 1.5em;">작성한 프로젝트가 없습니다.</span>
									</div>
								</div>
								</c:if>
								<c:if test="${!empty list }">
								<c:set var="today" value="<%=new java.util.Date()%>" />
								<c:set var="todayDate"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd hh:mm:ss" /></c:set>
									<c:forEach var="listvo" items="${list }">
										<div class="weekly2-single" style="width: 320px !important; padding: 0px 20px;">
											<div class="weekly2-img" style="margin: 0px 0px 84px;">
												<div style="position: relative;">
													<img src="<c:url value='/project_assets/projectImg/${listvo.projectImage}'/>"
														style="width: 290px; height:210px; border-radius: 20px;">
													<br><br>
													<div style="height: 180px;">
														<span class="color2" style="font-size: 0.9em;">
															<c:if test="${listvo.confirm=='Y' }">
																<c:if test="${todayDate<listvo.projectStartdate }">
																	펀딩대기중
						                                      	</c:if>
																<c:if test="${todayDate>=listvo.projectStartdate }">
																	<c:if test="${todayDate<listvo.projectEnddate }">
							                                      	  펀딩중
							                                      	</c:if>
							                                      	<c:if test="${todayDate>=listvo.projectEnddate }">
								                                      펀딩종료
							                                      	</c:if>
						                                      	</c:if>
															</c:if>
															<c:if test="${listvo.confirm!='Y' }">
																심사중
															</c:if>&nbsp;
														</span><br>
														<c:if test="${listvo.confirm=='Y' }">
														<c:choose>
															<c:when test="${todayDate<listvo.projectStartdate }">
																<div class="color1" style="font-size: 1.4em;">
																	<a href="<c:url value='/project/plan?projectNo=${listvo.projectNo}'/>" 
																		style="color: black;">
																	${listvo.projectName}
																	</a>
																</div> 
															</c:when>
															<c:otherwise>
																<div class="color1" style="font-size: 1.4em;">
																	<a href="<c:url value='/project/detail?projectNo=${listvo.projectNo}'/>" 
																		style="color: black;">
																	${listvo.projectName}
																	</a>
																</div> 
															</c:otherwise>
														</c:choose>
														</c:if>
														<div class="color2" style="font-weight: bold; margin-top: 10px; color: #b5b3b3">
														${vo.userName}
														</div>
														<div class="color2" style="font-weight: bold; margin-top: 10px;">
														${listvo.projectSummary}
														</div>
													</div>
													<div>
													<div class="percentage">
														<div class="progress" style="background:#eceff8;height: 0.3em;">
															<div class="progress-bar color-1" role="progressbar" style="width: ${listvo.totalFundingAmount/listvo.totalAmount*100 }%" 
																aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
														</div>
													</div>
							                        <h6><fmt:formatNumber value="${listvo.totalFundingAmount }" pattern="#,###"/>원<span style="color:red;font-size:0.8em">
							                        <fmt:formatNumber value="${listvo.totalFundingAmount/listvo.totalAmount*100 }" pattern="0.00"/>%</span></h6>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
									<!-- 페이징처리 -->
										<nav class="blog-pagination justify-content-center d-flex">
											<ul class="pagination">
												<c:if test="${pagingInfo.firstPage>1 }">
													<li class="page-item"><a href="#" class="page-link"
														onclick="pageProc(${pagingInfo.firstPage-1})" aria-label="Previous">
															<i class="ti-angle-left"></i>
													</a></li>
												</c:if>
												<c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage}">
													<li class="page-item active"><a href="#" class="page-link" onclick="pageProc(${i})">${i}</a>
													</li>
												</c:forEach>
												<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
													<li class="page-item"><a href="#" class="page-link"
														onclick="pageProc(${pagingInfo.lastPage+1})"> <i
														class="ti-angle-right"></i></a></li>
												</c:if>
											</ul>
										</nav>
									</c:if>
								</div>
							<!-- 내용 끝 -->
							</div>
						</div>
						<!-- Card two -->
						<div class="tab-pane fade" id="nav-followers" role="tabpanel"
							aria-labelledby="nav-followers-tab">
							<div class="whats-news-caption" id="two">
							
							</div>
						</div>
						<!-- Card three -->
						<div class="tab-pane fade" id="nav-following" role="tabpanel"
							aria-labelledby="nav-following-tab">
							<div class="whats-news-caption" id="three">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--  -->
<form action="<c:url value='/mypages/who?userNo=${vo.userNo }'/>" name="frmWho" method="post">
	<input type="hidden" name="currentPage" id="currentPage"><br> 
</form>
<script type="text/javascript">
	$(document).ready(function(){
		var userNo = ${vo.userNo};
		
		/* $('#nav-created-tab').click(function(){
			alert('안녕');
			$('#one').load('${pageContext.request.contextPath}/mypages/follow');
		}); */
		
		$('#nav-followers-tab').click(function(){
			$('#two').load('${pageContext.request.contextPath}/mypageload/who_follower?userNo='+userNo);
		});
		
 		$('#nav-following-tab').click(function(){
			$('#three').load('${pageContext.request.contextPath}/mypageload/who_following?userNo='+userNo);
		}); 
 		
		$('#follow').click(function(){
			$('form').attr('action','<c:url value="/mypageload/who_AddFollow"/>');
			$('form').submit();
		});
		
		$('#unfollow').click(function(){
		var no = $('#followingUserNo').val();
		alert(no);
			$('form').attr('action',"<c:url value='/mypageload/unfollow?no="+no+"'/>");
			$('form').submit();
		});

	});//

	function pageProc(curPage){
	    $('#currentPage').val(curPage);
	    $('form[name=frmWho]').submit();
	}
	
	var result = '${msg}';
	if (result == 'success') {
		alert("성공적으로 팔로우 되었습니다.");
	}else if(result == 'fail'){
		alert("팔로우가 취소되었습니다.");
	}
</script>	
<%@ include file="../include/bottom.jsp"%>