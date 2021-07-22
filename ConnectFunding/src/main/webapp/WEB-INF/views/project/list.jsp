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
         
         function test(type){
            $('.dropdown-submenu a.test').next('ul').css('display','none');
            $.ajax({
               url:"<c:url value='/project/alist'/>",
               type:"get",
               data:{
                     secondCategoryNo:type,
                     curPage:$('#currentPage').val()
                  },
               dataType:"json",
               success:function(res){
                  var list = res.list;
                  var pagingInfo = res.pagingInfo;
                  
                  
                  totalCount = pagingInfo.totalRecord;
                  
                  $('#test').empty();
                  
                  var str="";
                  str+="<div class='container'><div class='weekly2-wrapper'><div class='row'>";
                  str+="<div class='col-lg-12'><div class='section-tittle mb-30' style='margin-left: 6%;'>";
                  str+="<h3><span style='color:red'>"+totalCount+"</span>개의 프로젝트가 있습니다.</h3>";
                  str+="</div></div></div><div class='row'><div class='col-12'>";
                  str+="<div class='dot-style d-flex dot-style'>";
                  if(list==''){
                     str+="데이터가 없습니다.";
                  }else{
                     $.each(list, function(idx,item){
                        if(idx<4){
                           str+="<div class='weekly2-single'><div class='weekly2-img'>";
                           str+="<a href='${pageContext.request.contextPath}/project/detail?projectNo="+item.projectNo+"'><img src='${pageContext.request.contextPath}/project_assets/projectImg/"+item.projectImage+"' style='width:263px; height:170px'></a></div>";
                           str+="<div class='weekly2-caption'><span></span>";
                           str+="<h4><a href='${pageContext.request.contextPath}/project/detail?projectNo="+item.projectNo+"'>"+item.projectName+"</a></h4>";
                           str+="<p>"+moment(item.projectStartdate).format("YYYY-MM-DD")+"</p>";
                           str+="<h6>"+item.projectSummary+"</h6>";
                           str+="<hr style='margin:5px 0px 8px 0px;'>";
                           str+="<h6>"+AddComma(item.totalFundingAmount)+"원<span style='color:red;font-size:0.8em'>"+(item.totalFundingAmount/+item.totalAmount*100).toFixed(2)+"%</span></h6>";
                           str+="</div></div>";
                        }
                     });
                     str+="</div></div></div></div></div>";
                     if(list.length>4){
                        str+="<div class='container'><div class='weekly2-wrapper'><div class='row'>";
                        str+="<div class='col-lg-12'><div class='section-tittle mb-30'><br><br></div></div></div>";
                        str+="<div class='row'><div class='col-12'>";
                        str+="<div class='dot-style d-flex dot-style'>";
                        $.each(list, function(idx,item){
                           if(idx>=4){
                              str+="<div class='weekly2-single'><div class='weekly2-img'>";
                              str+="<a href='${pageContext.request.contextPath}/project/detail?projectNo="+item.projectNo+"'><img src='${pageContext.request.contextPath}/project_assets/projectImg/"+item.projectImage+"' style='width:263px; height:170px'></a></div>";
                              str+="<div class='weekly2-caption'><span></span>";
                              str+="<h4><a href='${pageContext.request.contextPath}/project/detail?projectNo="+item.projectNo+"'>"+item.projectName+"</a></h4>";
                              str+="<p>"+moment(item.projectStartdate).format("YYYY-MM-DD")+"</p>";
                              str+="<h6>"+item.projectSummary+"</h6>";
                              str+="<hr style='margin:5px 0px 8px 0px;'>";
                              str+="<h6>"+AddComma(item.totalFundingAmount)+"원<span style='color:red;font-size:0.8em'>"+(item.totalFundingAmount/+item.totalAmount*100).toFixed(2)+"%</span></h6>";
                              str+="</div></div>";
                           }
                        });
                        str+="</div></div></div></div></div>";
                     }
                     
                     //페이징처리
                      var pageStr="";

                     //[1][2][3][4][5][6][7][8][9][10]
                     for (var i = pagingInfo.firstPage; i <= pagingInfo.lastPage; i++) {
                        if (i == pagingInfo.currentPage) {
                           pageStr += "<span style='color:blue;font-weight: bold'>" + i
                                 + "</span>";
                        } else {
                           pageStr += "<a style='color:black;text-decoration: none' href='#' onclick='send("+i+");test("+type+")'>[" + i
                                 + "]</a>";
                        }
                     }
                     
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

      </script>   

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
                     <li class="dropdown-submenu dropend">
                       <a class="test dropdown-item dropdown-toggle" tabindex="-1" href="#">게임<span class="caret"></span></a>
                       <ul class="dropdown-menu">
                         <li><a tabindex="-1" href="#" class="dropdown-item" onclick="">모든 게임</a></li>
                         <li><a tabindex="-1" href="#" class="dropdown-item" onclick="send('1');test('1');">모바일 게임</a></li>
                         <li><a tabindex="-1" href="#" class="dropdown-item" onclick="">보드 게임</a></li>
                         <li><a tabindex="-1" href="#" class="dropdown-item" onclick="">비디오 게임</a></li>
                         <li><a tabindex="-1" href="#" class="dropdown-item" onclick="">카드 게임</a></li>
                         <li><a tabindex="-1" href="#" class="dropdown-item" onclick="">게임 페스티벌</a></li>
                       </ul>
                     </li>
                     
                     
                     <c:forEach var="firstCt" items="${fList }">
                       <li class="dropdown-submenu dropend">
                         <a class="test dropdown-item dropdown-toggle" tabindex="-1" href="#">${firstCt.categoryName }<span class="caret"></span></a>
                         <ul class="dropdown-menu">
                            <li><a tabindex="-1" href="#" class="dropdown-item" onclick="">모든 ${firstCt.categoryName }</a></li>
                            <c:forEach var="secondCt" items="${sList }">
                               <c:if test="${secondCt.firstCategoryNo==firstCt.firstCategoryNo }">
                               <li><a tabindex="-1" href="#" class="dropdown-item" onclick="send('1');test('${secondCt.secondCategoryNo}');">${secondCt.categoryName }</a></li>
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
                      <a class="dropdown-item" href="#">Action</a>
                      <a class="dropdown-item" href="#">Another action</a>
                      <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                  </div>
                  <div class="dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      달성률
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                      <a class="dropdown-item" href="#">Action</a>
                      <a class="dropdown-item" href="#">Another action</a>
                      <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                  </div>
                  <div class="dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      모인금액
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                      <a class="dropdown-item" href="#">Action</a>
                      <a class="dropdown-item" href="#">Another action</a>
                      <a class="dropdown-item" href="#">Something else here</a>
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
                          style="padding:12px 0px;" onclick="send('1');test('0')">
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
                               <div class="weekly2-single">
                                      <div class="weekly2-img">
                                          <a href="<c:url value="/project/detail?projectNo=${vo.projectNo }"/>"><img src="${pageContext.request.contextPath}/project_assets/projectImg/${vo.projectImage}"
                                             style="width:263px; height:170px"></a>
                                      </div>
                                      <div class="weekly2-caption">
                                          <span></span>
                                          <h4><a href="<c:url value="/project/detail?projectNo=${vo.projectNo }"/>">${vo.projectName}</a></h4>
                                          <p><fmt:formatDate value="${vo.projectStartdate }" pattern="yyyy-MM-dd"/></p>
                                          <h6>${vo.projectSummary }</h6>
                                          <hr style="margin:5px 0px 8px 0px;">
                                          <h6><fmt:formatNumber value="${vo.totalFundingAmount }" pattern="#,###"/>원<span style="color:red;font-size:0.8em">
                                          <fmt:formatNumber value="${vo.totalFundingAmount/vo.totalAmount*100 }" pattern="0.00"/>%</span></h6>
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
                        <br><br>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="dot-style d-flex dot-style">
                            <c:if test="${!empty list && fn:length(list)>4}">
                            <c:forEach var="vo" items="${list }" begin="4">
                            <div class="weekly2-single">
                                     <div class="weekly2-img">
                                         <a href="<c:url value="/project/detail?projectNo=${vo.projectNo }"/>"><img src="${pageContext.request.contextPath}/project_assets/projectImg/${vo.projectImage}"
                                               style="width:263px; height:170px"></a>
                                     </div>
                                     <div class="weekly2-caption">
                                         <span></span>
                                         <h4><a href="<c:url value="/project/detail?projectNo=${vo.projectNo }"/>">${vo.projectName}</a></h4>
                                         <p><fmt:formatDate value="${vo.projectStartdate }" pattern="yyyy-MM-dd"/></p>
                                         <h6>${vo.projectSummary }</h6>
                                         <hr style="margin:5px 0px 8px 0px;">
                                         <h6><fmt:formatNumber value="${vo.totalFundingAmount }" pattern="#,###"/>원<span style="color:red;font-size:0.8em">
                                         <fmt:formatNumber value="${vo.totalFundingAmount/vo.totalAmount*100 }" pattern="0.00"/>%</span></h6>
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
        <br><br>
        <div id="divPage" style="text-align: center">
         <c:if test="${pagingInfo.firstPage>1 }">
            <a href="#" onclick="pageProc(${pagingInfo.firstPage-1})">
               <img src="<c:url value='/resources/images/first.JPG'/>" alt="이전 블럭으로">
            </a>
         </c:if>
                        
         <!-- [1][2][3][4][5][6][7][8][9][10] -->
         <c:forEach var="i" begin="${pagingInfo.firstPage }" 
            end="${pagingInfo.lastPage }">
            <c:if test="${i==pagingInfo.currentPage }">
               <span style="color:blue;font-weight: bold">${i}</span>
            </c:if>
            <c:if test="${i!=pagingInfo.currentPage }">
               <a style="color:black;text-decoration: none" href="#" onclick="pageProc(${i})">[${i}]</a>
            </c:if>
         </c:forEach>
         
         <c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
            <a href="#" onclick="pageProc(${pagingInfo.lastPage+1})">
               <img src="<c:url value='/resources/images/last.JPG'/>" alt="다음 블럭으로">
            </a>
         </c:if>
      </div>
    <form action="<c:url value='/project/list'/>" 
      name="frmPage" method="post">
      <input type="hidden" name="currentPage" id="currentPage"><br>
      <input type="hidden" name="countPerPage" id="countPerPage" value="8" />
   </form>
   
   <%@ include file="../include/bottom.jsp" %>  