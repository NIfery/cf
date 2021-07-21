<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/top.jsp" %>
<script type="text/javascript" src="<c:url value='/assets/js/jquery-3.6.0.min.js'/>"></script>
<script src="../assets/js/bootstrap.min.js"></script>
<style type="text/css">
	.detailRow{
		display:flex;
		flex-wrap: wrap;
		justify-content: center;
	}
</style>

<!--================Blog Area =================-->
   <section class="blog_area single-post-area section-padding" style="padding-top:10px;">
      <div class="container" style="max-width:1800px">
         <div class="row detailRow">
            <div class="col-lg-8 posts-list">
               <div class="single-post">
                  <div class="feature-img">
                     <img class="img-fluid" src="assets/img/blog/single_blog_1.png" alt="">
                  </div>
                  <div class="blog_details">
                  	 <div style="text-align:center">
	                     <h1 style="font-weight:bold;">${map['PROJECT_NAME']}</h1>
	                     <!-- 작성자이름 클릭시 작성자 정보조회? 쪽지문의? -->
                         <a href="#" style="color:gray;"><i class="fa fa-user"></i> ${map['USER_NAME']}</a>
                  	 </div>
                     <div class="quote-wrapper">
	                     <div class="row" style="display:flex;flex-wrap:nowrap">
						    <div class="col-6" style="width:66%">
		                    	<img src="<c:url value='/project_assets/projectImg/${map["PROJECT_IMAGE"] }'/>" style="width:95%;height:500px">
						    </div>
						    <div class="col-4" style="font-style: normal;">
						    	<div class="row row-cols-1">모인 금액</div>
						    	<div class="row row-cols-1">
						    		<c:if test="${empty map['TOTAL_FUNDING_AMOUNT']}">
								    	<h2 style="margin: 5px 0px 20px -10px">0원 0.00%</h2>
						    		</c:if>
						    		<c:if test="${!empty map['TOTAL_FUNDING_AMOUNT']}">
								    	<h2 style="margin: 5px 0px 20px -10px">
							    		<fmt:formatNumber value="${map['TOTAL_FUNDING_AMOUNT'] }" pattern="#,###"/>원 <fmt:formatNumber value="${map['TOTAL_FUNDING_AMOUNT']/map['TOTAL_AMOUNT']*100.0 }" pattern="0.00"/>%</h2>
						    		</c:if>
						    	</div>
						    	<br>
						    	<div class="row row-cols-1">남은 기간</div>
						    	<div class="row row-cols-1">
							    	<fmt:parseDate value="${map['PROJECT_STARTDATE'] }" var="strPlanDate" pattern="yyyy-MM-dd"/>
									<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
									<fmt:parseDate value="${map['PROJECT_ENDDATE'] }" var="endPlanDate" pattern="yyyy-MM-dd"/>
									<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
						    		<h2 style="margin: 5px 0px 20px -10px">${endDate-strDate }일</h2>
						    	</div>
						    	<br>
						    	<div class="row row-cols-1">후원자</div>
						    	<div class="row row-cols-1"><h2 style="margin: 5px 0px 20px -10px">${userCnt }명</h2></div>
						    	<br>
						    	<div class="row row-cols-1">
						    		<div style="background: white;border:2px solid #e4e1e1">
						    			펀딩 진행중<br>
										목표 금액인 ${map['TOTAL_AMOUNT'] }원이 모여야만 결제됩니다.
						    		</div>
						    	</div>
						    	<br>
						    	<div class="row row-cols-1">[후원하기 버튼]</div>
						    </div>
						 </div>
	               </div>
	               <div class="row">
	               <div class="row d-flex justify-content-between">
                        <div class="properties__button">
                            <!--Nav Button  -->
                            <nav>                                                                     
                                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true" style="color:#609b8a">내용</a>
                                    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false" style="color:#609b8a">펀딩 안내</a>
                                </div>
                            </nav>
                            <!--End Nav Button  -->
                        </div>
                   </div>
                   <div class="row" style="padding-left: 23px;">
                    <div class="col-12">
                        <!-- Nav Card -->
                        <div class="tab-content" id="nav-tabContent">
                            <!-- card one -->
                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">           
                                <div class="whats-news-caption">
                                    <div class="row">
                                       <div class="weekly2-news-area weekly2-pading gray-bg" style="padding: 0px;">
									        <div class="container" style="border-bottom: 1px solid #e4e1e1">
									        	<div class="quote-wrapper">
								                     <div class="row" style="display:flex;flex-wrap:nowrap">
													    <div>
													    	${map['PROJECT_CONTENT'] }
													    </div>
													 </div>
								               </div>
									    	</div>
									    </div>   
                                    </div>
                                </div>
                            </div>
                            <!-- Card two -->
                            <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab" style="">
                                <div class="whats-news-caption">
                                    <div class="row">
                                       <div class="weekly2-news-area weekly2-pading gray-bg" style="padding: 20px;">
									      <pre style="white-space: pre-wrap;"><span style="font-weight: bold">이 프로젝트의 환불 및 교환 정책</span>
									      
- 프로젝트 마감일 후에는 즉시 제작 및 실행에 착수하는 프로젝트 특성상 단순 변심에 의한 후원금 환불이 불가능합니다.

- 예상 전달일로부터 30일 이상 선물 전달이 이뤄지지 않을 경우, 환불을 원하시는 분들께는 수수료를 제한 후원금을 환불해 드립니다.
(플랫폼 수수료: 모금액의 5%, 부가세 별도 / 결제 수수료: 결제 성공액의 3%, 부가세 별도 )

- 선물 전달을 위한 배송지 및 서베이 답변은 2021년 9월 16일에 일괄 취합할 예정입니다.

- 이후 배송지 변경이나 서베이 답변 변경을 원하실 때에는 '창작자에게 문의하기'로 개별 문의하셔야 합니다.

- 파손 또는 불량품 수령 시 7일 이내로 교환이 가능합니다.

- 교환 및 AS 문의는 '창작자에게 문의하기'로 신청해 주세요.

- 파손이나 불량품 교환시 발생하는 비용은 창작자가 부담합니다. 선물 확인을 위한 포장 훼손 외에 아이템의 가치가 훼손된 경우에는 교환 및 환불이 불가합니다.

- 후원자가 배송지를 잘못 기재하거나 창작자에게 사전 고지 없이 배송지를 수정하여 배송사고가 발생할 경우 창작자는 1회만 재발송 해 드립니다. 배송비 부담은 후원자에게 있습니다.</pre>     
									   </div>   
										    
									    </div> 
                                    </div>
                                </div>
                            </div>
                    <!-- End Nav Card -->
                    </div>
                </div>
                   </div>
	               
	               
                     
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!--================ Blog Area end =================-->

<%@ include file="../include/bottom.jsp" %>  