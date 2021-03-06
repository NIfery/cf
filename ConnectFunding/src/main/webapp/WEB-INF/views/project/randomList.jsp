<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <div class="weekly2-news-area" style="margin-bottom: 200px; margin-top: 50px;">
    	<br><br>
    	<h4 style="margin-left: 220px;">이런 프로젝트는 어떠세요?</h4>
    	<br><br>
        <div class="container">
            <div class="weekly2-wrapper">
                <div class="row">
                    <div class="col-12">
                        <div class="dot-style d-flex dot-style">
                         <c:if test="${!empty random }">
                            <c:forEach var="map" items="${random }">
                               <div class="weekly2-single" style="width: 270px;">
                                      <div class="weekly2-img">
                                          <a href="<c:url value="/project/detail?projectNo=${map['PROJECT_NO'] }"/>">
                                          <img src="${pageContext.request.contextPath}/project_assets/projectImg/${map['PROJECT_IMAGE']}"
                                             style="width:263px; height:170px"></a>
                                      </div>
                                      <div class="weekly2-caption">
                                          <span></span>
                                          <p style="font-size: 0.9em; color: #b4b1b1;">${map['USER_NAME'] }</p>
                                          <h4 style="height: 60px;">
                                          <a href="<c:url value="/project/detail?projectNo=${map['PROJECT_NO'] }"/>">${map['PROJECT_NAME'] }</a></h4>
                                	 <div style="display: flex;">
                                	 	<span style="font-weight: bold; color: black; font-size: 1em; margin-left: -15px;">
                                     	<fmt:formatNumber value="${map['TOTAL_FUNDING_AMOUNT'] }" pattern="#,###"/>원
                                	 	</span>
                                     	<span style="font-weight: bold; color: #ff6274; font-size: 1em;">
                                		<fmt:formatNumber value="${map['TOTAL_FUNDING_AMOUNT']/map['TOTAL_AMOUNT']*100.0 }" pattern="0.00"/>% 달성
                                     	</span>
                                     </div>
                                      </div>
                                  </div> 
                            </c:forEach>
                        </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>        