<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp" %>
            <!-- MAIN CONTENT-->
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row m-t-25">
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c1">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-account-o"></i>
                                            </div>
                                            <div class="text">
                                                <h2>${totalUser }명</h2>
                                                <span>전체 회원 현황</span>
                                            </div>
                                        </div>
                                        	<input type="hidden" value="${general}" id="general">
                                        	<input type="hidden" value="${enterprise}" id="enterprise">
                                        <div class="overview-chart">
                                            <canvas id="widgetChart1"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c2">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                        
                                            <div class="icon">
                                                <i class="zmdi zmdi-shopping-cart"></i>
                                            </div>
                                            <div class="text">
                                                <h2>${totalFunding }개</h2>
                                                <span>등록 펀딩 현황</span>
                                            </div>
                                            <c:forEach var="month" items="${map }">
											   <input type="hidden" id="${month.key }" value="${month.value }">
											</c:forEach>
                                        </div>
                                        <div class="overview-chart">
                                            <canvas id="widgetChart2"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c3">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-calendar-note"></i>
                                            </div>
                                            <c:forEach var="month2" items="${map2 }">
											   <input type="hidden" id="${month2.key }" value="${month2.value }">
											</c:forEach>
                                            <div class="text">
                                                <h2>${totalWaitFunding }개</h2>
                                                <span>대기 펀딩 현황</span>
                                            </div>
                                        </div>
                                        <div class="overview-chart">
                                            <canvas id="widgetChart3"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c4">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-money"></i>
                                            </div>
                                            <c:forEach var="month3" items="${map3 }">
											   <input type="hidden" id="${month3.key }" value="${month3.value }">
											</c:forEach>
                                            <div class="text">
                                                <h2><fmt:formatNumber value="${totalFundingComm }" pattern="#,###"/>원</h2>
                                                <span>누적 수수료</span>
                                            </div>
                                        </div>
                                        <div class="overview-chart">
                                            <canvas id="widgetChart4"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
            </div>
            <!-- STATISTIC CHART-->
            <section class="statistic-chart">
                <div class="container">
                    <div class="row">
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-lg-12">
                            <!-- CHART-->
                            <div class="top-campaign" style="height: 435px;">
                       			<c:forEach var="category" items="${map4 }">
									<input type="hidden" id="${category.key }" value="${category.value }">
								</c:forEach>
                                <h3 class="title-3 m-b-30">카테고리별 펀딩 현황</h3>
                                <div class="chart-wrap">
                                    <canvas id="widgetChart5"></canvas>
                                </div>
                                <div style="text-align: center;">
                                    <p> - 현재 등록된 펀딩의 카테고리별 프로젝트 수</p>
                               </div>
                            </div>
                            <!-- END CHART-->
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-lg-6">
                            <!-- TOP CAMPAIGN-->
                            <div class="top-campaign">
                                <h3 class="title-3 m-b-30">Top 5 펀딩금액 순위</h3>
                                <div class="table-responsive">
                                    <table class="table table-top-campaign">
	                                   
										    <tbody>
										    	<c:if test="${empty list}">
											    	<tr>
														<td colspan="2" class="align_center">데이터가 없습니다.</td>
													</tr>
										    	</c:if>
										    	 <c:forEach var="top" items="${list }" varStatus="status">
										    		<c:if test="${!empty list}">
				                                            <tr>
				                                                <td>${status.count }.&emsp;<fmt:formatNumber value="${top.FUNDING_AMOUNT}" pattern="#,###" />원</td>
				                                                <td>${top.PROJECT_NAME }</td>
				                                            </tr>
	                                            	</c:if>
	                                            </c:forEach>
	                                            <c:if test="${list.size()<5}">
													<c:forEach begin="1" end="${cnt }">
														<tr>
															<td colspan="2" class="align_center" style="text-align: center;">데이터가 없습니다.</td>
														</tr>
				                                   </c:forEach>
					                           </c:if>
	                                        </tbody>
                                       
                                    </table>
                                </div>
                                <br><br>
                               <div class="chart-info">
                                    <p> - 카테고리에 상관없이 현재까지 프로젝트의 총 모금액 TOP 5 선정함</p>
                               </div>  
                            </div>
                            <!-- END TOP CAMPAIGN-->
                        </div>
                        <div class="col-md-6 col-lg-6">
                            <!-- CHART PERCENT-->
                            <div class="chart-percent-2">
                                <h3 class="title-3 m-b-30">펀딩 달성률 %</h3>
                                <div class="chart-wrap">
                                <c:forEach var="percent" items="${map5 }">
                                	<input type="hidden" id="${percent.key }" value="${percent.value }">
								</c:forEach>
                                    <canvas id="percent-chart2"></canvas>
                                    <div id="chartjs-tooltip">
                                        <table></table>
                                    </div>
                                </div>
                                <div class="chart-info">
                                    <div class="chart-note">
                                        <span class="dot dot--blue"></span>
                                        <span>100% 달성</span>
                                    </div>
                                    <div class="chart-note">
                                        <span class="dot dot--red"></span>
                                        <span>100% 미달성</span>
                                    </div>
                                </div>
                                <div class="chart-info">
                                    <p> - 펀딩 심사가 완료된 프로젝트 중 목표금액 달성여부 [%]비율</p>
                               </div>      
                            </div>
                            <!-- END CHART PERCENT-->
                        </div>
                    </div>
                </div>
            </section>
            <!-- END STATISTIC CHART-->


            <!-- END PAGE CONTAINER-->
        </div>
    </div>
<%@ include file="../inc/adminBottom.jsp" %>