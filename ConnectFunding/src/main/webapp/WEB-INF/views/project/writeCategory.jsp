<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/top.jsp" %>

<script type="text/javascript" src="<c:url value='/assets/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(function() {
		$('.categoryUl a').each(function(){
			$(this).click(function(){
				$('.categoryUl a').css('background','white');
				$(this).css('background','#00f76347');
				$('#divSummary').css('visibility','visible');
				$('#firstCategory').val($(this).html());
			});
		});
		
		$('#taSummary').keyup(function(){
			var lenghtSummary = $(this).val().length;
			$('#lengthSummary').html(lenghtSummary+'/50');
			
			if(lenghtSummary<10 || lenghtSummary>50){
				$('#taSummary').css('border','1px solid red');
				$('#minSummary').css('color','red');
				$('#lengthSummary').css('color','red');
			}else{
				$('#taSummary').css('border','1px solid gray');
				$('#minSummary').css('color','gray');
				$('#lengthSummary').css('color','gray');
			}
		});
		
		$('#next').click(function(){
			var lenghtSummary = $('#taSummary').val().length;
			if(lenghtSummary<10 || lenghtSummary>50){
				alert('10~50자만 입력이 가능합니다.');
				return false;
			}else{
				$('form[name=frm]').submit();
			}
		});
	});
</script>

<style type="text/css">
	.divWriteSecondFirst{
		position: relative;
 		left: 15%;
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
	.categoryUl{
		display: flex;
	    flex-wrap: wrap;
	    justify-content: space-between;
	}
	.categoryUl li{
		margin:5px;
	}
	.genric-btn.primary-border:hover{
		color: black;
   		border: 1px solid black;
    	background: white;
	}
</style>
    <form name="frm" method="post" action="<c:url value='/project/writeTitle'/>">
	<div class="weekly2-news-area weekly2-pading gray-bg">
		<div class="container" style="text-align: center;width:45%;min-width: 300px">
            <div class="weekly2-wrapper">
                <!-- section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle mb-30">
                        <h3>커넥트펀딩에 등록할 프로젝트가 있으신가요?</h3>
                        <br>
                        <h6 style="color:gray">추후에 변경이 가능합니다.</h6>
                        <br><br>
                        <ul class="categoryUl">
                        	<li><a class="genric-btn primary-border circle">게임</a></li>
                        	<li><a class="genric-btn primary-border circle">공연</a></li>
                        	<li><a class="genric-btn primary-border circle">디자인</a></li>
                        	<li><a class="genric-btn primary-border circle">만화</a></li>
                        	<li><a class="genric-btn primary-border circle">예술</a></li>
                        	<li><a class="genric-btn primary-border circle">공예</a></li>
                        	<li><a class="genric-btn primary-border circle">사진</a></li>
                        	<li><a class="genric-btn primary-border circle">영화,비디오</a></li>
                        	<li><a class="genric-btn primary-border circle">푸드</a></li>
                        	<li><a class="genric-btn primary-border circle">음악</a></li>
                        	<li><a class="genric-btn primary-border circle">출판</a></li>
                        	<li><a class="genric-btn primary-border circle">테크</a></li>
                        	<li><a class="genric-btn primary-border circle">패션</a></li>
                        	<li><a class="genric-btn primary-border circle">저널리즘</a></li>
                        </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br><br><br><br>
        <div class="container">
            <div class="weekly2-wrapper">
                <!-- section Tittle -->
                <div class="row" style="width:60%;position: relative;left: 20%">
                    <div class="col-lg-12">
                        <div id="divSummary" class="section-tittle mb-30" style="text-align: center;visibility:hidden">
                        <h3>프로젝트를 간단히 설명해주세요.</h3>
                        <br>
                        <h6 style="color:gray">추후에 변경이 가능합니다.</h6>
                        <br><br>
                        	<div>
	                        	<textarea id="taSummary" name="projectSummary" rows="7" placeholder="프로젝트 요약내용을 입력하세요." style="width:100%;resize: none"></textarea>
	                        	<h6 id="minSummary" style="color:gray;float: left">최소 10자이상 입력해주세요.</h6>
	                        	<h6 id="lengthSummary" style="color:gray;float: right">0/50</h6>
	                        	<br><br><hr style="border:1px solid #f7f7fd85">
	                        	<a id="next" class="genric-btn primary-border circle" style="float:right;">다음</a>
                        	</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>    
    	<input type="hidden" id="firstCategory" name="firstCategory">
    </form>
<%@ include file="../include/bottom.jsp" %>