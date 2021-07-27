<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../include/top.jsp" %>
<script type="text/javascript" src="<c:url value='/assets/js/jquery-3.6.0.min.js'/>"></script>
<script src="../assets/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gijgo/1.9.13/combined/js/gijgo.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/gijgo/1.9.13/combined/css/gijgo.min.css" rel="stylesheet" type="text/css" />

<!-- include summernote css/js-->
<script src="<c:url value='/project_assets/js/summernote/summernote-lite.js'/>"></script>
<script src="<c:url value='/project_assets/js/summernote/lang/summernote-ko-KR.js'/>"></script>

<link rel="stylesheet" href="<c:url value='/project_assets/css/summernote/summernote-lite.css'/>">
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
					
					str+="<select id='secondSelect' name='secondCategoryNo' style='display:none;'>";
					$.each(res, function(idx,item){
						str+="<option value='"+item.secondCategoryNo+"'>"+item.categoryName+"</option>";
					});
					str+="</select>";
					str+="<div class='nice-select' tabindex='0'>";
					$.each(res, function(idx,item){
						if(idx==0){
							str+="<span class='current'>"+item.categoryName+"</span><ul class='list'><li data-value='"+item.secondCategoryNo+"' class='option selected'>"+item.categoryName+"</li>";
						}else{
							str+="<li data-value='"+item.secondCategoryNo+"' class='option'>"+item.categoryName+"</li>";
						}
					});
					str+="</ul></div>";
					
					$('#second').html(str);
				},
				error:function(xhr, status, error){
					alert('error 발생 '+error);
				}
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
		
		$('#totalAmount').keyup(function(){
			var totalAmount = $(this).val();
			var taxAmount = AddComma(Math.round(totalAmount*0.05));
			var realAmount = AddComma(Math.round(totalAmount-Math.round(totalAmount*0.05)));
			$('#taxAmount').html(taxAmount);
			$('#realAmount').html(realAmount);
		});
		
		var today = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate());
		$('#datepickerStartdate').datepicker({ 
			format: 'yyyy-mm-dd',
			minDate:today, 
			maxDate: function () {
                return $('#datepickerEnddate').val();
        	}
		});
		$('#datepickerEnddate').datepicker({
			format: 'yyyy-mm-dd',
			minDate: function () {
                return $('#datepickerStartdate').val();
            }
		});

		$('#datepickerStartdate').change(function(){
			$('#projectStartdate').val($(this).val()+' 00:00:00');
		});
		$('#datepickerEnddate').change(function(){
			$('#projectEnddate').val($(this).val()+' 00:00:00');
		});
		
		$('#summernote').summernote({ 
			height: 400,                  // 에디터 높이
			minHeight: null,              // 최소 높이
			maxHeight: null,              // 최대 높이
			focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			lang: "ko-KR",				  // 한글 설정
			placeholder: '내용을 입력하세요', //placeholder 설정
			disableResizeEditor: true,
			callbacks: {
		      	onImageUpload: function(files, editor, welEditable) {
		      		for(var i = files.length -1; i>=0; i--) {
		       			sendFile(files[i], this);
		       		}
		       	}
		    }
		});
		
		$('form[name=frmWrite]').submit(function(){
			var lenghtSummary = $('#taSummary').val().length;
			if($('#projectName').val().length<1){
				alert('제목을 입력하세요.');
				$('#nav-home-tab').click();
				return false;
			}else if(lenghtSummary<10 || lenghtSummary>50){
				alert('요약 내용은 10~50자만 입력이 가능합니다.');
				$('#nav-home-tab').click();
				return false;
			}else if($('#totalAmount').val().length<1){
				alert('펀딩 금액을 입력하세요.');
				$('#nav-profile-tab').click();
				return false;
			}else if($('#projectStartdate').val().length<1){
				alert('시작일을 입력하세요.');
				$('#nav-profile-tab').click();
				return false;
			}else if($('#projectEnddate').val().length<1){
				alert('종료일을 입력하세요.');
				$('#nav-profile-tab').click();
				return false;
			}else if($('#summernote').val().length<1){
				alert('상세내용을 입력하세요.');
				$('#nav-contact-tab').click();
				return false;
			}
		});
	});
	
	function sendFile(file, el) {
		var form_data = new FormData();
		form_data.append('file', file);
		$.ajax({
			data: form_data,
			type : "post",
			url: 'summer_image',
			cache :false,
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(img_name) {
				var ttt="<img src='${pageContext.request.contextPath}/"+img_name+"'>";
				$(el).summernote('editor.insertImage', img_name);
			}
		});
	}
	
	function AddComma(num) {
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}
</script>

<style type="text/css">
	.nice-select {
 	-webkit-tap-highlight-color: transparent;
	background-color: #fff;
	border-radius: 5px;
	border: solid 1px #e8e8e8;
	box-sizing: border-box;
	clear: both;
	cursor: pointer;
	display: block;
	float: left;
	font-family: inherit;
	font-size: 14px;
	font-weight: normal;
	height: 42px;
 	line-height: 40px;
	outline: none;
	padding-left: 18px;
	padding-right: 30px;
	position: relative;
	text-align: left !important;
	-webkit-transition: all 0.2s ease-in-out;
	transition: all 0.2s ease-in-out;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	white-space: nowrap;
	width: auto; 
	width: 80%;
}

.nice-select:hover {
	border-color: #dbdbdb;
}

.nice-select:active, .nice-select.open, .nice-select:focus {
	border-color: #999;
}

 .nice-select:after {
	border-bottom: 2px solid #999;
	border-right: 2px solid #999;
	content: '';
	display: block;
	height: 5px;
	margin-top: -4px;
	pointer-events: none;
	position: absolute;
	right: 12px;
	top: 50%;
	-webkit-transform-origin: 66% 66%;
	-ms-transform-origin: 66% 66%;
	transform-origin: 66% 66%;
	-webkit-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	transform: rotate(45deg);
	-webkit-transition: all 0.15s ease-in-out;
	transition: all 0.15s ease-in-out;
	width: 5px;
} 

.nice-select.open:after {
	-webkit-transform: rotate(-135deg);
	-ms-transform: rotate(-135deg);
	transform: rotate(-135deg);
}

.nice-select.open .list {
	opacity: 1;
	pointer-events: auto;
	-webkit-transform: scale(1) translateY(0);
	-ms-transform: scale(1) translateY(0);
	transform: scale(1) translateY(0);
}

.nice-select.disabled {
	border-color: #ededed;
	color: #999;
	pointer-events: none;
}

.nice-select.disabled:after {
	border-color: #cccccc;
}

.nice-select.wide {
	width: 100%;
}

.nice-select.wide .list {
	left: 0 !important;
	right: 0 !important;
}

.nice-select.right {
	float: right;
}

.nice-select.right .list {
	left: auto;
	right: 0;
}

.nice-select.small {
	font-size: 12px;
	height: 36px;
	line-height: 34px;
}

.nice-select.small:after {
	height: 4px;
	width: 4px;
}

.nice-select.small .option {
	line-height: 34px;
	min-height: 34px;
}

.nice-select .list {
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 0 0 1px rgba(68, 68, 68, 0.11);
	box-sizing: border-box;
	margin-top: 4px;
	opacity: 0;
	overflow: hidden;
	padding: 0;
	pointer-events: none;
	position: absolute;
	top: 100%;
	left: 0;
	-webkit-transform-origin: 50% 0;
	-ms-transform-origin: 50% 0;
	transform-origin: 50% 0;
	-webkit-transform: scale(0.75) translateY(-21px);
	-ms-transform: scale(0.75) translateY(-21px);
	transform: scale(0.75) translateY(-21px);
	-webkit-transition: all 0.2s cubic-bezier(0.5, 0, 0, 1.25), opacity
		0.15s ease-out;
	transition: all 0.2s cubic-bezier(0.5, 0, 0, 1.25), opacity 0.15s
		ease-out;
	z-index: 9;
	width: 80%;
}

.nice-select .list:hover .option:not(:hover) {
	background-color: transparent !important;
}

.nice-select .option {
	cursor: pointer;
	font-weight: 400;
	line-height: 40px;
	list-style: none;
	min-height: 40px;
	outline: none;
	padding-left: 18px;
	padding-right: 29px;
	text-align: left;
	-webkit-transition: all 0.2s;
	transition: all 0.2s;
}

.nice-select .option:hover, .nice-select .option.focus, .nice-select .option.selected.focus
	{
	background-color: #f6f6f6;
}

.nice-select .option.selected {
	font-weight: bold;
}

.nice-select .option.disabled {
	background-color: transparent;
	color: #999;
	cursor: default;
}

.no-csspointerevents .nice-select .list {
	display: none;
}

.no-csspointerevents .nice-select.open .list {
	display: block;
}
</style>

	<!-- Whats New Start -->
	<form name="frmWrite" method="post" enctype="multipart/form-data"
		action="<c:url value='/project/writeTitleSecond'/>" >
    <section class="whats-news-area pt-50 pb-20">
        <div class="container">
            <div class="row">
                <div class="row d-flex justify-content-between">
                        <div class="properties__button">
                            <!--Nav Button  -->
                            <nav>                                                                     
                                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">기본정보</a>
                                    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">펀딩 계획</a>
                                    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">내용</a>
									<input class="btn btn-default" type="submit" value="등록"/>
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
																<input type="text" name="projectName" id="projectName" placeholder="제목을 입력하세요"
																	onfocus="this.placeholder = ''" onblur="this.placeholder = '제목을 입력하세요'"
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
									        <div class="container" style="border-bottom: 1px solid #e4e1e1">
									        	<div class="video-info">
									                <div class="row captionMain">
									                    <div class="col-lg-6">
										                    <div class="row row-cols-1">
										                        <div class="video-caption">
										                            <div class="bottom-caption">
										                            	<h3>목표 금액</h3>
												                        <br>
												                        <h6 style="color:gray">프로젝트를 완수하기 위해 필요한 금액을 설정해주세요.</h6>
												                        <br><br>
										                            </div>
										                        </div>
									                        </div>
										                    <div class="row row-cols-1" style="width:60%;background:#ff00000d;font-size:0.8em;margin-left:3%;padding:3%;">
										                    	<div class="col" style="color:red">주의사항</div>
										                    		<ul style="margin-left:5%">
										                    			<li style="list-style: disc">종료 전 후원 취소를 대비해 10% 이상 초과 달성을 목표로 해주세요.</li>
										                    			<li style="list-style: disc">제작비, 인건비, 예비 비용 등을 함께 고려해주세요.</li>
										                    		</ul>
									                        </div>
									                        <br><br>
									                    </div>
									                    <div class="col-lg-6">
										                    <div class="row row-cols-1">
															    <div class="col">목표금액</div>
															</div>
										                    <div class="row row-cols-1">
										                    	<input type="text" name="totalAmount" id="totalAmount" placeholder="목표금액을 입력하세요"
										                    		onfocus="this.placeholder = ''" onblur="this.placeholder = '목표금액을 입력하세요'" 
										                    		oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
										                    		class="single-input" style="background-color: #fff;border-radius: 5px;border: solid 1px #e8e8e8;text-align:right;">
															</div>
															<br>
															<div class="row row-cols-2" style="border-bottom: 1px solid #e4e1e1">
															    <div class="col">목표금액 달성 시 예상 수령액</div>
															    <div class="col" style="text-align:right;color:red;font-weight: bold;"><span id="realAmount"></span>원</div>
																<br><br>
															</div>
															<br>
															<div class="row row-cols-2" style="font-size: 0.8em">
															    <div class="col">총 수수료 (총 모금액의 5%)</div>
															    <div class="col" style="text-align:right;"><span id="taxAmount"></span>원</div>
															</div>
															<br><br>
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
										                            	<h3>펀딩 일정</h3>
												                        <br>
												                        <h6 style="color:gray">설정한 일시가 되면 펀딩이 자동 시작됩니다. <br>
												                        펀딩 시작 전까지 날짜를 변경할 수 있고, 즉시 펀딩을 시작할 수도 있습니다.</h6>
												                        <br><br>
										                            </div>
										                        </div>
										                    </div>
										                    <div class="col-lg-6">
											                    <div class="row row-cols-1">
																    <div class="col">시작일<input id="datepickerStartdate" width="50%"/></div>
																    <br><br><br><br>
																    <div class="col">종료일<input id="datepickerEnddate" width="50%"/></div>
																    <input type="hidden" name="projectStartdate" id="projectStartdate">
																    <input type="hidden" name="projectEnddate" id="projectEnddate">
																</div>
											                    <div class="row row-cols-1">
																	
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
                            <!-- Card three -->
                            <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                                <div class="whats-news-caption">
                                    <div class="row">
                                       <div class="weekly2-news-area weekly2-pading gray-bg" style="padding-bottom: 0px;">
									        <div class="container" style="border-bottom: 1px solid #e4e1e1">
									        	<div class="video-info">
									                <div class="row captionMain">
										                    <div class="row row-cols-1">
										                        <div class="video-caption">
										                            <div class="bottom-caption">
										                            	<h3>프로젝트 내용</h3>
												                        <br>
												                        <h6 style="color:gray">프로젝트를 소개하고, 준비하는 과정에서 후원자에게 들려주고 싶었던 이야기를 작성해주세요.</h6>
										                            </div>
										                        </div>
									                        </div>
										                    <div class="row row-cols-1" style="background: white">
										                    	<textarea id="summernote" name="projectContent"><h4 style="margin-left: 100px;"><b><span style="font-family: " arial="" black";"="">프로젝트 소개</span></b></h4><p style="margin-left: 100px;">

- 무엇을 만들기 위한 프로젝트인가요? 이 프로젝트의 특별한 점은 무엇인가요?</p><p style="margin-left: 100px;">
- 기획, 구상부터 디자인, 시제품 제작에 오기까지 그간의 고민, 시행착오 등 고유한 창작 '과정'이 잘 드러나도록 스토리를 작성해 주세요.
</p><p style="margin-left: 100px;">- 샘플이나 콘텐츠 미리보기 이미지를 포함해 주세요. 매력적인 이미지는 후원자 참여에 중요한 역할을 합니다.<br></p><p><br></p><h4 style="margin-left: 100px;"><b>
프로젝트 예산</b></h4><p style="margin-left: 100px;">

- 설정하신 목표 금액을 제작에 어떻게 사용할 것인지 알려주세요.</p><p style="margin-left: 100px;">
- 이번 프로젝트 제작에 필요한 비용을 '인건비', '배송비', '인쇄비', '대관료'와 같이 구체적으로 작성하셔야 합니다.</p><p style="margin-left: 100px;">
- 이번 프로젝트 제작과 무관한 계획(예시: 기부, 다음 프로젝트에 사용, 목표 금액 초과 달성분의 활용)은 포함하지 않으셔도 됩니다.
</p><p style="margin-left: 100px;"><br></p><h4 style="margin-left: 100px;"><b>
제작 일정
</b></h4><p style="margin-left: 100px;">
- 현재 프로젝트가 어디까지 진행되었나요? 구상 단계인지, 시제품이나 파일럿 등 가안 제작 단계인지 정확히 알려주세요.
</p><p style="margin-left: 100px;">- 펀딩에 성공한다면 어떤 일정으로 제작을 완수할 계획인가요? 완성까지 필요한 중간 단계들을 어떠한 일정으로 완수하여 선물의 '예상 전달일'을 지킬 것인지 구체적인 날짜와 함께 적어주세요.
</p><p style="margin-left: 100px;"><br></p><h4 style="margin-left: 100px;"><b>
후원자 안내
</b></h4><p style="margin-left: 100px;">
- 손상되기 쉬운 선물의 포장·전달 방법이나 행사 일정/장소, 디지털 파일 전달할 방법 등을 짚어 주세요.
</p><p style="margin-left: 100px;">- 문의 방법(창작자에게 문의하기)이나 환불 교환 정책, 상품 정보 고시는 별도의 기능이 있으므로 스토리에 또 기재하지 않아도 됩니다.
</p><p style="margin-left: 100px;">- 그 밖에 후원자들에게 전하고 싶은 말이 있나요?<br></p></textarea>	
									                        </div>
									                        <br><br>
									                    
									      			  </div>
									    		</div>   
									    	</div>   
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
    </section>
    <!-- Whats New End -->
	</form>
</main>
    
   <footer>
       <!-- footer-bottom aera -->
       <div class="footer-bottom-area">
           <div class="container">
               <div class="footer-border">
                    <div class="row d-flex align-items-center justify-content-between">
                        <div class="col-lg-6">
                            <div class="footer-copy-right">
                                <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | Connect Funding &nbsp<i class="ti-heart" aria-hidden="true"></i></a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="footer-menu f-right">
                                <ul>                             
                                    <li><a href="#">Terms of use</a></li>
                                    <li><a href="#">Privacy Policy</a></li>
                                    <li><a href="#">Contact</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
               </div>
           </div>
       </div>
       <!-- Footer End-->
   </footer>
   
	<!-- JS here -->
	
		<!-- All JS Custom Plugins Link Here here -->
        <script src="../assets/js/vendor/modernizr-3.5.0.min.js"></script>
		<!-- Jquery, Popper, Bootstrap -->
        <script src="../assets/js/popper.min.js"></script>
        <script src="../assets/js/bootstrap.min.js"></script>
	    <!-- Jquery Mobile Menu -->
        <script src="../assets/js/jquery.slicknav.min.js"></script>

		<!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="../assets/js/owl.carousel.min.js"></script>
        <script src="../assets/js/slick.min.js"></script>
        <!-- Date Picker -->
        <script src="../assets/js/gijgo.min.js"></script>
		<!-- One Page, Animated-HeadLin -->
        <script src="../assets/js/wow.min.js"></script>
		<script src="../assets/js/animated.headline.js"></script>
        <script src="../assets/js/jquery.magnific-popup.js"></script>

        <!-- Breaking New Pluging -->
        <script src="../assets/js/jquery.ticker.js"></script>
        <script src="../assets/js/site.js"></script>

		<!-- Scrollup, nice-select, sticky -->
        <script src="../assets/js/jquery.scrollUp.min.js"></script>
        <script src="../assets/js/jquery.nice-select.min.js"></script>
		<script src="../assets/js/jquery.sticky.js"></script>
        
        <!-- contact js -->
        <script src="../assets/js/contact.js"></script>
        <script src="../assets/js/jquery.form.js"></script>
        <script src="../assets/js/jquery.validate.min.js"></script>
        <script src="../assets/js/mail-script.js"></script>
        <script src="../assets/js/jquery.ajaxchimp.min.js"></script>
        
		<!-- Jquery Plugins, main Jquery -->	
        <script src="../assets/js/plugins.js"></script>
        <script src="../assets/js/main.js"></script>
        
    </body>
</html>