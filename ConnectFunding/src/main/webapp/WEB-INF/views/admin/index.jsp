<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp" %>
            <!-- MAIN CONTENT-->
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="overview-wrap">
                                    <h2 class="title-1">분야별 Chart</h2>
                                </div>
                            </div>
                        </div>
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
                                                <h2> <fmt:formatNumber value="${totalFundingComm }" pattern="#,###" /></h2>
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
                        <div class="col-md-12">
                            <h3 class="title-5 m-b-35">주요 Chart</h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-lg-4">
                            <!-- CHART-->
                            <div class="top-campaign" style="height: 435px;">
                                <h3 class="title-3 m-b-30">카테고리별 펀딩 수</h3>
                                <div class="chart-wrap">
                                    <canvas id="widgetChart5"></canvas>
                                </div>
                                <div class="statistic-chart-1-note">
                                    <span class="big">10,368</span>
                                    <span>/ 16220 진행중인 펀딩</span>
                                </div>
                            </div>
                            <!-- END CHART-->
                        </div>
                        <div class="col-md-6 col-lg-4">
                            <!-- TOP CAMPAIGN-->
                            <div class="top-campaign">
                                <h3 class="title-3 m-b-30">Top 펀딩금액 달성</h3>
                                <div class="table-responsive">
                                    <table class="table table-top-campaign">
                                        <tbody>
                                            <tr>
                                                <td>1. 믹서기</td>
                                                <td>$70,261.65</td>
                                            </tr>
                                            <tr>
                                                <td>2. 세탁기</td>
                                                <td>$46,399.22</td>
                                            </tr>
                                            <tr>
                                                <td>3. 청소기</td>
                                                <td>$35,364.90</td>
                                            </tr>
                                            <tr>
                                                <td>4. 컴퓨터</td>
                                                <td>$20,366.96</td>
                                            </tr>
                                            <tr>
                                                <td>5. 침대</td>
                                                <td>$10,366.96</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- END TOP CAMPAIGN-->
                        </div>
                        <div class="col-md-6 col-lg-4">
                            <!-- CHART PERCENT-->
                            <div class="chart-percent-2">
                                <h3 class="title-3 m-b-30">펀딩 달성률 %</h3>
                                <div class="chart-wrap">
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