<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
						    	<div class="row row-cols-1"><h2 style="margin: 5px 0px 20px -10px"><fmt:formatNumber value="${map['TOTAL_FUNDING_AMOUNT'] }" pattern="#,###"/>원 ${map['TOTAL_FUNDING_AMOUNT']/map['TOTAL_AMOUNT'] *100 }%</h2></div>
						    	<br>
						    	<div class="row row-cols-1">남은 기간</div>
						    	<div class="row row-cols-1"><h2 style="margin: 5px 0px 20px -10px">일</h2></div>
						    	<br>
						    	<div class="row row-cols-1">후원자</div>
						    	<div class="row row-cols-1"><h2 style="margin: 5px 0px 20px -10px">명</h2></div>
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
                                    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">내용</a>
                                    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">펀딩 안내</a>
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
                                       <div class="weekly2-news-area weekly2-pading gray-bg" style="padding-bottom: 0px;">
									        <div class="container" style="border-bottom: 1px solid #e4e1e1">
									        	<div class="video-info">
									                <div class="row captionMain">
									                    <div class="col-lg-6">
									                        <div class="video-caption">
									                            <div class="bottom-caption">
									                            	<h3>프로젝트 카테고리</h3>
											                        <br>
											                        <h6 style="color:gray">프로젝트 성격과 가장 일치하는 카테고리를 선택해주세요.<br>
																	적합하지 않을 경우 운영자에 의해 조정될 수 있습니다.</h6>
											                        <br><br>
									                            </div>
									                        </div>
									                    </div>
									                    <div class="col-lg-6">
										                    <div class="row row-cols-2">
															    <div class="col">카테고리</div>
																    <div class="col">세부 카테고리</div>
																    	<div class="col">
																    		<div id="first">
														                		<select id="firstSelect">
														                      		<c:forEach var="vo" items="${fList }">
														                       			<option
															                       		<c:if test="${firstCategory==vo.categoryName }">selected="selected"</c:if>
															                       		>${vo.categoryName }</option>
															                       	</c:forEach>
															                    </select>
													                    	</div>
													                    </div>
																	    <div class="col">
																	    	<div id="second">
															                    <select id="secondSelect" name="secondCategoryNo">
															                       	<c:forEach var="vo" items="${sList }">
															                       		<option value="${vo.secondCategoryNo }">${vo.categoryName }</option>
															                    	</c:forEach>
															                	</select>
														                	</div>
														                </div>
																	</div>
									                   			 </div>
									               			 </div>
									          			  </div>
									      			  </div>
									    		</div>   
									    <div class="weekly2-news-area weekly2-pading gray-bg" style="padding-bottom: 0px;">
									        <div class="container" style="border-bottom: 1px solid #e4e1e1">
									        	<div class="video-info">
									                <div class="row captionMain">
									                    <div class="col-lg-6">
									                        <div class="video-caption">
									                            <div class="bottom-caption">
									                            	<h3>프로젝트 제목</h3>
											                        <br>
											                        <h6 style="color:gray">프로젝트의 주제, 특징이 드러나는 제목을 작성해주세요.</h6>
											                        <br><br>
									                            </div>
									                        </div>
									                    </div>
									                    <div class="col-lg-6">
										                    <div class="row row-cols-1">
															    <div class="col">제목</div>
															</div>
										                    <!-- <div class="row row-cols-1">
															    <div class="col">카테고리</div>
															</div> -->
										                    <div class="row row-cols-1">
																<input type="text" name="projectName" placeholder="제목을 입력하세요"
																	onfocus="this.placeholder = ''" onblur="this.placeholder = '제목을 입력하세요'" required
																	class="single-input" style="background-color: #fff;border-radius: 5px;border: solid 1px #e8e8e8;">
															</div>
									                    </div>
									                </div>
									            </div>
									        </div>
									    </div> 
									
										<div class="weekly2-news-area weekly2-pading gray-bg" style="padding-bottom: 0px;">
									        <div class="container" style="border-bottom: 1px solid #e4e1e1">
									        	<div class="video-info">
									                <div class="row captionMain">
									                    <div class="col-lg-6">
									                        <div class="video-caption">
									                            <div class="bottom-caption">
									                            	<h3>프로젝트 요약</h3>
											                        <br>
											                        <h6 style="color:gray">후원자 분들이 프로젝트를 빠르게 이해할 수 있도록<br>
																	명확하고 간략하게 소개해주세요.</h6>
											                        <br><br>
									                            </div>
									                        </div>
									                    </div>
									                    <div class="col-lg-6">
										                    <div class="row row-cols-1">
															    <div class="col">
																    <div>
											                        	<textarea id="taSummary" name="projectSummary" rows="7" style="width:100%;resize: none;border-radius: 5px;border: solid 1px #e8e8e8;">${param.projectSummary }</textarea>
											                        	<h6 id="minSummary" style="color:gray;float: left">최소 10자이상 입력해주세요.</h6>
											                        	<h6 id="lengthSummary" style="color:gray;float: right">${fn:length(param.projectSummary) }/50</h6>
										                        	</div>
											                        <br><br><br>
									                        	</div>
															</div>
									                    </div>
									                </div>
									            </div>
									        </div>
									    </div>
									    
									    <div class="weekly2-news-area weekly2-pading gray-bg" style="padding-bottom: 0px;">
									        <div class="container">
									        	<div class="video-info">
									                <div class="row captionMain">
									                    <div class="col-lg-6">
									                        <div class="video-caption">
									                            <div class="bottom-caption">
									                            	<h3>프로젝트 대표 이미지</h3>
											                        <br>
											                        <h6 style="color:gray">후원자들이 프로젝트의 내용을 쉽게 파악하고<br>
											                        좋은 인상을 받을 수 있도록 대표 이미지를 설정해주세요.</h6>
											                        <br><br>
											                        <input type="submit" value="테스트"/>
									                            </div>
									                        </div>
									                    </div>
									                    <div class="col-lg-6">
										                    <div class="row row-cols-1">
															    <div class="col">
																	<input type="file" id="upfile" name="upfile">
																</div>
															</div>
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
                                       <div class="weekly2-news-area weekly2-pading gray-bg" style="padding-bottom: 0px;">
									      <pre>이 프로젝트의 환불 및 교환 정책
- 프로젝트 마감일 후에는 즉시 제작 및 실행에 착수하는 프로젝트 특성상 단순 변심에 의한 후원금 환불이 불가능합니다.
- 예상 전달일로부터 30일 이상 선물 전달이 이뤄지지 않을 경우, 환불을 원하시는 분들께는 수수료를 제한 후원금을 환불해 드립니다.
(플랫폼 수수료: 모금액의 5%, 부가세 별도 / 결제 수수료: 결제 성공액의 3%, 부가세 별도 )
- 선물 전달을 위한 배송지 및 서베이 답변은 2021년 9월 16일에 일괄 취합할 예정입니다.
- 이후 배송지 변경이나 서베이 답변 변경을 원하실 때에는 '창작자에게 문의하기'로 개별 문의하셔야 합니다.
- 파손 또는 불량품 수령 시 7일 이내로 교환이 가능합니다.
- 교환 및 AS 문의는 '창작자에게 문의하기'로 신청해 주세요.
- 파손이나 불량품 교환시 발생하는 비용은 창작자가 부담합니다. 선물 확인을 위한 포장 훼손 외에 아이템의 가치가 훼손된 경우에는 교환 및 환불이 불가합니다.
- 후원자가 배송지를 잘못 기재하거나 창작자에게 사전 고지 없이 배송지를 수정하여 배송사고가 발생할 경우 창작자는 1회만 재발송 해 드립니다. 배송비 부담은 후원자에게 있습니다.
                                    	</pre>     
									   </div>   
										    
									    </div> 
                                    </div>
                                </div>
                            </div>
                    <!-- End Nav Card -->
                    </div>
                </div>
                   </div>
	               
	               
                     <p class="excert">
                        MCSE boot camps have its supporters and its detractors. Some people do not understand why you
                        should have to spend money on boot camp when you can get the MCSE study materials yourself at a
                        fraction of the camp price. However, who has the willpower
                     </p>
                     <p>
                        MCSE boot camps have its supporters and its detractors. Some people do not understand why you
                        should have to spend money on boot camp when you can get the MCSE study materials yourself at a
                        fraction of the camp price. However, who has the willpower to actually sit through a
                        self-imposed MCSE training. who has the willpower to actually
                     </p>
                     <div class="quote-wrapper">
                        <div class="quotes">
                           MCSE boot camps have its supporters and its detractors. Some people do not understand why you
                           should have to spend money on boot camp when you can get the MCSE study materials yourself at
                           a fraction of the camp price. However, who has the willpower to actually sit through a
                           self-imposed MCSE training.
                        </div>
                     </div>
                     <p>
                        MCSE boot camps have its supporters and its detractors. Some people do not understand why you
                        should have to spend money on boot camp when you can get the MCSE study materials yourself at a
                        fraction of the camp price. However, who has the willpower
                     </p>
                     <p>
                        MCSE boot camps have its supporters and its detractors. Some people do not understand why you
                        should have to spend money on boot camp when you can get the MCSE study materials yourself at a
                        fraction of the camp price. However, who has the willpower to actually sit through a
                        self-imposed MCSE training. who has the willpower to actually
                     </p>
                  </div>
               </div>
               <div class="navigation-top">
                  <div class="d-sm-flex justify-content-between text-center">
                     <p class="like-info"><span class="align-middle"><i class="fa fa-heart"></i></span> Lily and 4
                        people like this</p>
                     <div class="col-sm-4 text-center my-2 my-sm-0">
                        <!-- <p class="comment-count"><span class="align-middle"><i class="fa fa-comment"></i></span> 06 Comments</p> -->
                     </div>
                     <ul class="social-icons">
                        <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                        <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fab fa-dribbble"></i></a></li>
                        <li><a href="#"><i class="fab fa-behance"></i></a></li>
                     </ul>
                  </div>
                  <div class="navigation-area">
                     <div class="row">
                        <div
                           class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
                           <div class="thumb">
                              <a href="#">
                                 <img class="img-fluid" src="assets/img/post/preview.png" alt="">
                              </a>
                           </div>
                           <div class="arrow">
                              <a href="#">
                                 <span class="lnr text-white ti-arrow-left"></span>
                              </a>
                           </div>
                           <div class="detials">
                              <p>Prev Post</p>
                              <a href="#">
                                 <h4>Space The Final Frontier</h4>
                              </a>
                           </div>
                        </div>
                        <div
                           class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
                           <div class="detials">
                              <p>Next Post</p>
                              <a href="#">
                                 <h4>Telescopes 101</h4>
                              </a>
                           </div>
                           <div class="arrow">
                              <a href="#">
                                 <span class="lnr text-white ti-arrow-right"></span>
                              </a>
                           </div>
                           <div class="thumb">
                              <a href="#">
                                 <img class="img-fluid" src="assets/img/post/next.png" alt="">
                              </a>
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