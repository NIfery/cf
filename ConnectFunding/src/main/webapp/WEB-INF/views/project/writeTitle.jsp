<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/top.jsp" %>
<script type="text/javascript" src="<c:url value='/assets/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(function() {
		$('#firstSelect').change(function(){
			$.ajax({
				url:"<c:url value='/project/aWriteTitle'/>",
				type:"get",
				data:"firstCategory="+$('#firstSelect').val(),
				dataType:"json",
				success:function(res){
					var str="";
					
					str+="<select id='secondSelect' class='nice-select'>";
					$.each(res, function(idx,item){
						str+="<option>"+item.categoryName+"</option>";
					});
					str+="</select>";
					
					$('#second').html(str);
				},
				error:function(xhr, status, error){
					alert('error 발생 '+error);
				}
			});
		});
	});
</script>

<style type="text/css">
	
</style>
	<div class="weekly2-news-area weekly2-pading gray-bg" style="padding-bottom: 0px;">
        <div class="container">
        	<div class="video-info">
                <div class="row captionMain">
                    <div class="col-lg-6">
                        <div class="video-caption">
                            <div class="bottom-caption">
                            	<h3>커넥트펀딩에 등록할 프로젝트가 있으신가요?</h3>
		                        <br>
		                        <h6 style="color:gray">추후에 변경이 가능합니다.</h6>
		                        <br><br>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                    	<div id="first">
		                	<select id="firstSelect">
		                      	<c:forEach var="vo" items="${fList }">
		                       		<option
		                       		<c:if test="${firstCategory==vo.categoryName }">selected="selected"</c:if>
		                       		>${vo.categoryName }</option>
		                       	</c:forEach>
		                    </select>
                    	</div>
	                	<div id="second">
		                    <select id="secondSelect">
		                       	<c:forEach var="vo" items="${sList }">
		                       		<option>${vo.categoryName }</option>
		                    	</c:forEach>
		                	</select>
	                	</div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="weekly2-news-area" style="background-color: #e9ffe1">
        <div class="container">
            <div class="weekly2-wrapper">
                <!-- section Tittle -->
                <div class="row" style="text-align: center;padding: 50px 0px 50px 0px">
                    <div class="col-lg-12">
                        <div class="section-tittle mb-30">
                        	<br>
							<h2>프로젝트를 시작해보세요!</h2>
		                    <p>
			                   	지금 바로 프로젝트 작성을 시작할 수 있습니다.
								프로젝트를 등록하면 커넥트펀딩의 심사를 거쳐 이용자들에게 공개됩니다.
			                </p>
                        </div>
                    </div>
                </div>
                <div class="row" style="text-align: center;padding: 50px 0px 50px 0px">
                    <div class="col-lg-12">
                        <div class="section-tittle mb-30">
                        	<br>
							<h2>프로젝트를 시작해보세요!</h2>
		                    <p>
			                   	지금 바로 프로젝트 작성을 시작할 수 있습니다.
								프로젝트를 등록하면 커넥트펀딩의 심사를 거쳐 이용자들에게 공개됩니다.
			                </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>    
    </div>    

<%@ include file="../include/bottom.jsp" %>