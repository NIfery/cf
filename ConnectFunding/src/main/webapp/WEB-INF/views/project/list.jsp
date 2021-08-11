<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

      <style type="text/css">
         .dropdown{
            float: left;
            width:150px;
            margin-right:1%;
         }
         .btn{
            background: white;
            color: #6c757d;
            border: 1px solid #6c757d;
            min-width: 150px;
            padding: 10px 0px;
         }
         .btn::before{
            background: #6c757d;
            color: white;
         }
         hr {
            border-bottom: 5px solid #eceff8;
         }
         .dropdown-submenu {
             position: relative;
         }

         .dropdown-submenu .dropdown-menu {
            top: 0;
            left: 100%;
            margin-top: -1px;
         }
         .col-12{
            margin-left: 5.5%;
         }
         
      </style>
      
      <script type="text/javascript" 
         src="<c:url value='/project_assets/js/jquery-3.6.0.min.js'/>"></script>
      <script type="text/javascript"
         src="<c:url value='/project_assets/js/paging.js'/>"></script>
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
      <script type="text/javascript">
         var totalCount=0;
         var today = getFormatDate(new Date());
         function getFormatDate(date){
     		var year = date.getFullYear();
     		var month = (1 + date.getMonth());
     		month = month >= 10 ? month : '0' + month;
     		var day = date.getDate();
     		day = day >= 10 ? day : '0' + day;
     		return year + '-' + month + '-' + day;
     	 }
         
         $(function(){
            $('.dropdown-submenu a.test').on("click", function(e){
               $(this).next('ul').toggle();
               
               $(this).parent().siblings().find('ul').css('display','none');
               
               e.stopPropagation();
               e.preventDefault();
            });
            
            $('#btWrite').click(function(){
               location.href="<c:url value='/project/writeMain'/>";
            });
            
         });
         
         function send(curPage) {
            $('#currentPage').val(curPage);
         }
         
         function pageProc(curPage){
            $('input[name=currentPage]').val(curPage);
            $('form[name=frmPage]').submit();   
         }
         
         var fType=0;
         var sType=0;
         var vIType=0;
         
         function cate(type1, type2){
            filter(type1, type2, vIType);
         }
         function ingT(iType){
            filter(fType, sType, iType);
         }
         
         function filter(type1, type2, iType){
            fType=type1;
            sType=type2;
            vIType=iType;
            $('.dropdown-submenu a.test').next('ul').css('display','none');
            $.ajax({
               url:"<c:url value='/project/alist'/>",
               type:"get",
               data:{
                     firstCategoryNo:type1,
                     secondCategoryNo:type2,
                     ingType:iType,
                     curPage:$('#currentPage').val()
                  },
               dataType:"json",
               success:function(res){
                  var list = res.list;
                  var pagingInfo = res.pagingInfo;
                  
                  totalCount = pagingInfo.totalRecord;
                  
                  $('#test').empty();
                  $('#divPage').empty();
                  
                  var str="";
                  str+="<div class='container'><div class='weekly2-wrapper'><div class='row'>";
                  str+="<div class='col-lg-12'><div class='section-tittle mb-30' style='margin-left: 6%;'>";
                  str+="<h3><span style='color:red'>"+totalCount+"</span>개의 프로젝트가 있습니다.</h3>";
                  str+="</div></div></div><div class='row'><div class='col-12'>";
                  str+="<div class='dot-style d-flex dot-style'>";
                  if(list==''){
                     str+="데이터가 없습니다.";
                     str+="</div></div></div></div></div><br><br><br><br><br><br><br>";
                  }else{
                     $.each(list, function(idx,item){
                        if(idx<4){
                           str+="<div class='weekly2-single'><div class='weekly2-img'>";
                           if((today>=moment(item.projectStartdate).format("YYYY-MM-DD"))){
	                           str+="<a href='${pageContext.request.contextPath}/project/detail?projectNo="+item.projectNo+"'><img src='${pageContext.request.contextPath}/project_assets/projectImg/"+item.projectImage+"' style='width:263px; height:170px'></a></div>";
	                           str+="<div class='weekly2-caption'><span></span>";
	                           str+="<h4><a href='${pageContext.request.contextPath}/project/detail?projectNo="+item.projectNo+"'>"+item.projectName+"</a></h4>";
                           }else{
                        	   str+="<a href='${pageContext.request.contextPath}/project/plan?projectNo="+item.projectNo+"'><img src='${pageContext.request.contextPath}/project_assets/projectImg/"+item.projectImage+"' style='width:263px; height:170px'></a></div>";
	                           str+="<div class='weekly2-caption'><span></span>";
	                           str+="<h4><a href='${pageContext.request.contextPath}/project/plan?projectNo="+item.projectNo+"'>"+item.projectName+"</a></h4>";
                           }
                           str+="<p>"+moment(item.projectRegdate).format("YYYY-MM-DD")+"</p>";
                           str+="<h6>"+item.projectSummary+"</h6>";
                           
                           str+="<div class='percentage'><div class='progress' style='background:#eceff8;height: 0.3em;'>";
                           str+="<div class='progress-bar color-1' role='progressbar' style='width: "+(item.totalFundingAmount/+item.totalAmount*100).toFixed(2)+"%' aria-valuenow='80' aria-valuemin='0' aria-valuemax='100'></div></div></div>";
                           
                           str+="<h6>"+AddComma(item.totalFundingAmount)+"원<span style='color:red;font-size:0.8em'>"+(item.totalFundingAmount/+item.totalAmount*100).toFixed(2)+"%</span></h6>";
                           str+="</div></div>";
                        }
                     });
                     str+="</div></div></div></div></div>";
                     if(list.length>4){
                        str+="<div class='container'><div class='weekly2-wrapper'><div class='row'>";
                        str+="<div class='col-lg-12'><div class='section-tittle mb-30'></div></div></div>";
                        str+="<div class='row'><div class='col-12'>";
                        str+="<div class='dot-style d-flex dot-style'>";
                        $.each(list, function(idx,item){
                           if(idx>=4){
                              str+="<div class='weekly2-single'><div class='weekly2-img'>";
                              if((today>=moment(item.projectStartdate).format("YYYY-MM-DD"))){
   	                           str+="<a href='${pageContext.request.contextPath}/project/detail?projectNo="+item.projectNo+"'><img src='${pageContext.request.contextPath}/project_assets/projectImg/"+item.projectImage+"' style='width:263px; height:170px'></a></div>";
   	                           str+="<div class='weekly2-caption'><span></span>";
   	                           str+="<h4><a href='${pageContext.request.contextPath}/project/detail?projectNo="+item.projectNo+"'>"+item.projectName+"</a></h4>";
                              }else{
                           	   str+="<a href='${pageContext.request.contextPath}/project/plan?projectNo="+item.projectNo+"'><img src='${pageContext.request.contextPath}/project_assets/projectImg/"+item.projectImage+"' style='width:263px; height:170px'></a></div>";
   	                           str+="<div class='weekly2-caption'><span></span>";
   	                           str+="<h4><a href='${pageContext.request.contextPath}/project/plan?projectNo="+item.projectNo+"'>"+item.projectName+"</a></h4>";
                              }
                              str+="<p>"+moment(item.projectRegdate).format("YYYY-MM-DD")+"</p>";
                              str+="<h6>"+item.projectSummary+"</h6>";

                              str+="<div class='percentage'><div class='progress' style='background:#eceff8;height: 0.3em;'>";
                              str+="<div class='progress-bar color-1' role='progressbar' style='width: "+(item.totalFundingAmount/+item.totalAmount*100).toFixed(2)+"%' aria-valuenow='80' aria-valuemin='0' aria-valuemax='100'></div></div></div>";
                              
                              str+="<h6>"+AddComma(item.totalFundingAmount)+"원<span style='color:red;font-size:0.8em'>"+(item.totalFundingAmount/+item.totalAmount*100).toFixed(2)+"%</span></h6>";
                              str+="</div></div>";
                           }
                        });
                        str+="</div></div></div></div></div>";
                     }
                     
                     //페이징처리
                      var pageStr="";
                     
                     pageStr += "<br><br><br><div class='pagination-area pb-45 text-center'><div class='container'>";
                     pageStr += "<div class='row'><div class='col-xl-12'><div class='single-wrap d-flex justify-content-center'>";
                     pageStr += "<nav aria-label='Page navigation example'><ul class='pagination justify-content-start'>";
                     if(pagingInfo.firstPage>1){
                        pageStr += "<li class='page-item'><a class='page-link' href='#' onclick='pageProc("+(pagingInfo.firstPage-1)+")'><span class='flaticon-arrow roted'></span></a></li>";
                     }
                     
                     //[1][2][3][4][5][6][7][8][9][10]
                     for (var i = pagingInfo.firstPage; i <= pagingInfo.lastPage; i++) {
                        if (i == pagingInfo.currentPage) {
                           pageStr += "<li class='page-item active'><a class='page-link'>";
                           if(i<10){
                              pageStr += "0"+i;
                           }else{
                              pageStr += i;
                           }
                           pageStr += "</a></li>";
                        } else {
                           pageStr += "<li class='page-item'><a class='page-link' href='#' onclick='send("+i+");filter("+type1+","+type2+","+iType+")'>";
                           if(i<10){
                              pageStr += "0"+i;
                           }else{
                              pageStr += i;
                           }
                           pageStr += "</a></li>";
                        }
                     }
                     
                     if(pagingInfo.lastPage < pagingInfo.totalPage){
                        pageStr += "<li class='page-item'><a class='page-link' href='#' onclick='pageProc("+(pagingInfo.lastPage+1)+")'><span class='flaticon-arrow right-arrow'></span></a></li>";
                     }
                     
                     pageStr += "</ul></nav></div></div></div></div></div>";
                     
                     $('#divPage').html(pageStr);
                  }
                  
                  $('#test').append(str);
               },
               error:function(xhr, status, error){
                  alert("Error 발생 : " + error);
               }
            });
         }
         
         function AddComma(num) {
            var regexp = /\B(?=(\d{3})+(?!\d))/g;
            return num.toString().replace(regexp, ',');
         }
         
         var result = '${msg}';
         if (result == 'success') {
                 alert("좋아한 프로젝트에 추가되었습니다.");
         }else if(result == 'fail'){
        	 alert("삭제되었습니다.");
         }

      </script>   
<br>
	<c:set var="today" value="<%=new java.util.Date()%>" />
	<c:set var="todayDate"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd hh:mm:ss" /></c:set>
    <div class="weekly-news-area pt-50">
        <div class="container">
           <div class="weekly-wrapper">
                <!-- section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                    
                    <div class="dropdown">
                   <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">카테고리
                   <span class="caret"></span></button>
                   <ul class="dropdown-menu">
                     <c:forEach var="firstCt" items="${fList }">
                       <li class="dropdown-submenu dropend">
                         <a class="test dropdown-item dropdown-toggle" tabindex="-1" href="#">${firstCt.categoryName }<span class="caret"></span></a>
                         <ul class="dropdown-menu">
                            <li><a tabindex="-1" href="#" class="dropdown-item" onclick="send('1');cate(${firstCt.firstCategoryNo},'0')">모든 ${firstCt.categoryName }</a></li>
                            <c:forEach var="secondCt" items="${sList }">
                               <c:if test="${secondCt.firstCategoryNo==firstCt.firstCategoryNo }">
                               <li><a tabindex="-1" href="#" class="dropdown-item" onclick="send('1');cate('0','${secondCt.secondCategoryNo}');">${secondCt.categoryName }</a></li>
                               </c:if>
                            </c:forEach>
                           </ul>
                     </c:forEach>
                   </ul>
                 </div>
                 <div class="dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      상태
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                      <a class="dropdown-item" href="#" onclick="send('1');ingT('1')">진행중인 프로젝트</a>
                      <a class="dropdown-item" href="#" onclick="send('1');ingT('2')">기간종료된 프로젝트</a>
                      <a class="dropdown-item" href="#" onclick="send('1');ingT('3')">대기중인 프로젝트</a>
                    </div>
                  </div>
                    
                  <div class="dropdown" style="float:right;padding:3px;">
                     <button class="btn btn-default" type="button" id="btWrite" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                        style="padding:12px 0px;">
                        프로젝트 등록
                     </button>
                  </div>
                  <div class="dropdown" style="float:right;padding:3px;">
                       <button class="btn btn-default" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                          style="padding:12px 0px;" onclick="send('1');filter('0','0','0')">
                         전체보기
                       </button>
                  </div>
                    </div>
                </div>
                
           </div>
        </div>
    </div>           
    
    <div class="weekly2-news-area  weekly2-pading gray-bg" id="test">
        <div class="container">
            <div class="weekly2-wrapper">
                <!-- section Tittle -->
                <div class="row" style="position: relative;left: 6%;">
                    <div class="col-lg-12">
                        <div class="section-tittle mb-30">

                  <c:if test="${empty list }">
                            <h3><span style="color:red">0</span>개의 프로젝트가 있습니다.</h3>
                        </c:if>    
                  <c:if test="${!empty list }">
                            <h3><span style="color:red">${pagingInfo.totalRecord }</span>개의 프로젝트가 있습니다.</h3>
                        </c:if>    
                            
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-12">
                        <div class="dot-style d-flex dot-style">
                         <c:if test="${empty list }">
                            데이터가 없습니다.
                         </c:if>
                         <c:if test="${!empty list }">
                            <c:forEach var="vo" items="${list }" begin="0" end="3">
                               <div class="weekly2-single" style="width: 270px;">
                                      <div class="weekly2-img">
	                                      <c:if test="${todayDate<vo.projectStartdate }">
	                                      	  <a href="<c:url value="/project/plan?projectNo=${vo.projectNo }"/>"><img src="${pageContext.request.contextPath}/project_assets/projectImg/${vo.projectImage}"
		                                             style="width:263px; height:170px"></a>
	                                      </c:if>
	                                      <c:if test="${todayDate>=vo.projectStartdate }">
		                                      <a href="<c:url value="/project/detail?projectNo=${vo.projectNo }"/>"><img src="${pageContext.request.contextPath}/project_assets/projectImg/${vo.projectImage}"
		                                             style="width:263px; height:170px"></a>
	                                      </c:if>
                                      </div>
                                      <div class="weekly2-caption">
                                          <span></span>
                                          <c:if test="${todayDate<vo.projectStartdate }">
	                                      	<h4 style="height: 60px;"><a href="<c:url value="/project/plan?projectNo=${vo.projectNo }"/>">${vo.projectName}</a></h4>
	                                      </c:if>
	                                      <c:if test="${todayDate>=vo.projectStartdate }">
                                          	<h4 style="height: 60px;"><a href="<c:url value="/project/detail?projectNo=${vo.projectNo }"/>">${vo.projectName}</a></h4>
                                          </c:if>
                                          <p><fmt:formatDate value="${vo.projectRegdate }" pattern="yyyy-MM-dd"/></p>
                                          <h6 style="height: 40px;">${vo.projectSummary }</h6>
                                          <div class="percentage">
                                    <div class="progress" style="background:#eceff8;height: 0.3em; ">
                                       <div class="progress-bar color-1" role="progressbar" style="width: ${vo.totalFundingAmount/vo.totalAmount*100 }%" 
                                          aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                 </div>
                                 <div style="display: flex;">
                                          <h6><fmt:formatNumber value="${vo.totalFundingAmount }" pattern="#,###"/>원<span style="color:red;font-size:0.8em">
                                          <fmt:formatNumber value="${vo.totalFundingAmount/vo.totalAmount*100 }" pattern="0.00"/>%</span></h6>
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
        
        <div class="container">
            <div class="weekly2-wrapper">
                <!-- section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle mb-30">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="dot-style d-flex dot-style">
                            <c:if test="${!empty list && fn:length(list)>4}">
                            <c:forEach var="vo" items="${list }" begin="4">
                            <div class="weekly2-single" style="width: 270px;">
                                     <div class="weekly2-img">
                                         <a href="<c:url value="/project/detail?projectNo=${vo.projectNo }"/>"><img src="${pageContext.request.contextPath}/project_assets/projectImg/${vo.projectImage}"
                                               style="width:263px; height:170px"></a>
                                     </div>
                                     <div class="weekly2-caption">
                                         <span></span>
                                         <h4 style="height: 60px;"><a href="<c:url value="/project/detail?projectNo=${vo.projectNo }"/>">${vo.projectName}</a></h4>
                                         <p><fmt:formatDate value="${vo.projectRegdate }" pattern="yyyy-MM-dd"/></p>
                                         <h6 style="height: 40px;">${vo.projectSummary }</h6>
                                         <div class="percentage">
                                    <div class="progress" style="background:#eceff8;height: 0.3em; ">
                                       <div class="progress-bar color-1" role="progressbar" style="width: ${vo.totalFundingAmount/vo.totalAmount*100 }%" 
                                          aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                 </div>
                                 	<div style="display: flex;">
                                          
                                         <h6><fmt:formatNumber value="${vo.totalFundingAmount }" pattern="#,###"/>원<span style="color:red;font-size:0.8em">
                                         <fmt:formatNumber value="${vo.totalFundingAmount/vo.totalAmount*100 }" pattern="0.00"/>%</span></h6>
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
        <div id="divPage" style="text-align: center">
           <br><br><br>
            <!--Start pagination -->
          <div class="pagination-area pb-45 text-center">
              <div class="container">
                  <div class="row">
                      <div class="col-xl-12">
                          <div class="single-wrap d-flex justify-content-center">
                              <nav aria-label="Page navigation example">
                                  <ul class="pagination justify-content-start">
                                  
                                     <c:if test="${pagingInfo.firstPage>1 }">
                                          <li class="page-item">
                                    <a class="page-link" href="#" onclick="pageProc(${pagingInfo.firstPage-1})">
                                       <span class="flaticon-arrow roted"></span>
                                    </a>
                                 </li>
                              </c:if>
                           
                                      <!-- [1][2][3][4][5][6][7][8][9][10] -->
                              <c:forEach var="i" begin="${pagingInfo.firstPage }" 
                                 end="${pagingInfo.lastPage }">
                                 <c:if test="${i==pagingInfo.currentPage }">
                                    <li class="page-item active">
                                       <a class="page-link">
                                          <c:if test="${i<10 }">
                                             0${i}
                                          </c:if>
                                          <c:if test="${i>=10 }">
                                             ${i}
                                          </c:if>
                                       </a>
                                    </li>
                                 </c:if>
                                 <c:if test="${i!=pagingInfo.currentPage }">
                                    <li class="page-item">
                                       <a class="page-link" href="#" onclick="pageProc(${i})">
                                          <c:if test="${i<10 }">
                                             0${i}
                                          </c:if>
                                          <c:if test="${i>=10 }">
                                             ${i}
                                          </c:if>
                                       </a>
                                    </li>
                                 </c:if>
                              </c:forEach>
                                     
                                      <c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
                                           <li class="page-item">
                                    <a class="page-link" href="#" onclick="pageProc(${pagingInfo.lastPage+1})">
                                       <span class="flaticon-arrow right-arrow"></span>
                                    </a>
                                 </li>
                              </c:if> 
                                  </ul>
                                </nav>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
          <!-- End pagination  -->
      </div>
      <br><br><br>
    <form action="<c:url value='/project/list'/>" 
      name="frmPage" method="post">
      <input type="hidden" name="currentPage" id="currentPage"><br>
      <input type="hidden" name="countPerPage" id="countPerPage" value="8" />
   </form>
   
   <%@ include file="../include/bottom.jsp" %>  