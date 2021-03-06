<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		var totalAmount = $('#totalAmount').val();
		var taxAmount = AddComma(Math.round(totalAmount*0.05));
		var realAmount = AddComma(Math.round(totalAmount-Math.round(totalAmount*0.05)));
		$('#taxAmount').html(taxAmount);
		$('#realAmount').html(realAmount);
		
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
					alert('error ?????? '+error);
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
			height: 400,                  // ????????? ??????
			minHeight: null,              // ?????? ??????
			maxHeight: null,              // ?????? ??????
			focus: true,                  // ????????? ????????? ???????????? ????????? ??????
			lang: "ko-KR",				  // ?????? ??????
			placeholder: '????????? ???????????????', //placeholder ??????
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
				alert('????????? ???????????????.');
				$('#nav-home-tab').click();
				return false;
			}else if(lenghtSummary<10 || lenghtSummary>50){
				alert('?????? ????????? 10~50?????? ????????? ???????????????.');
				$('#nav-home-tab').click();
				return false;
			}else if($('#totalAmount').val().length<1){
				alert('?????? ????????? ???????????????.');
				$('#nav-profile-tab').click();
				return false;
			}else if($('#projectStartdate').val().length<1){
				alert('???????????? ???????????????.');
				$('#nav-profile-tab').click();
				return false;
			}else if($('#projectEnddate').val().length<1){
				alert('???????????? ???????????????.');
				$('#nav-profile-tab').click();
				return false;
			}else if($('#summernote').val().length<1){
				alert('??????????????? ???????????????.');
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
	<form name="frmWrite" method="post" action="<c:url value='/project/update'/>" >
	<input type="hidden" name="projectNo" value="${map['PROJECT_NO'] }">
    <section class="whats-news-area pt-50 pb-20">
        <div class="container">
            <div class="row">
                <div class="row d-flex justify-content-between">
                        <div class="properties__button">
                            <!--Nav Button  -->
                            <nav>                                                                     
                                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">????????????</a>
                                    <!-- <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">?????? ??????</a> -->
                                    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">??????</a>
									<input type="submit" value="??????"/>
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
									                            	<h3>???????????? ????????????</h3>
											                        <br>
											                        <h6 style="color:gray">???????????? ????????? ?????? ???????????? ??????????????? ??????????????????.<br>
																	???????????? ?????? ?????? ???????????? ?????? ????????? ??? ????????????.</h6>
											                        <br><br>
									                            </div>
									                        </div>
									                    </div>
									                    <div class="col-lg-6">
										                    <div class="row row-cols-2">
															    <div class="col">????????????</div>
																    <div class="col">?????? ????????????</div>
																    	<div class="col">
																    		<div id="first">
														                		<!-- <select id="firstSelect"> -->
														                      		<c:forEach var="vo" items="${fList }">
															                       		<c:if test="${firstCategory==vo.categoryName }">
														                       				<%-- <option selected="selected">${vo.categoryName }</option> --%>
														                       				<input type="text" readonly value="${vo.categoryName }"
														                       				class="single-input" style="width:60%; background-color: #fff;border-radius: 5px;border: solid 1px #e8e8e8;">
														                       			</c:if>
															                       	</c:forEach>
															                    <!-- </select> -->
													                    	</div>
													                    </div>
																	    <div class="col">
																	    	<div id="second">
															                    <select id="secondSelect" name="secondCategoryNo">
															                       	<c:forEach var="vo" items="${sList }">
															                       		<option value="${vo.secondCategoryNo }"
															                       		<c:if test="${map['SECOND_CATEGORY_NO']==vo.secondCategoryNo }">selected="selected"</c:if>
															                       		>${vo.categoryName }</option>
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
									                            	<h3>???????????? ??????</h3>
											                        <br>
											                        <h6 style="color:gray">??????????????? ??????, ????????? ???????????? ????????? ??????????????????.</h6>
											                        <br><br>
									                            </div>
									                        </div>
									                    </div>
									                    <div class="col-lg-6">
										                    <div class="row row-cols-1">
															    <div class="col">??????</div>
															</div>
										                    <div class="row row-cols-1">
																<input type="text" name="projectName" id="projectName" placeholder="????????? ???????????????"
																	onfocus="this.placeholder = ''" onblur="this.placeholder = '????????? ???????????????'"
																	class="single-input" style="background-color: #fff;border-radius: 5px;border: solid 1px #e8e8e8;"
																	value="${map['PROJECT_NAME'] }">
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
									                            	<h3>???????????? ??????</h3>
											                        <br>
											                        <h6 style="color:gray">????????? ????????? ??????????????? ????????? ????????? ??? ?????????<br>
																	???????????? ???????????? ??????????????????.</h6>
											                        <br><br>
									                            </div>
									                        </div>
									                    </div>
									                    <div class="col-lg-6">
										                    <div class="row row-cols-1">
															    <div class="col">
																    <div>
											                        	<textarea id="taSummary" name="projectSummary" rows="7" style="width:100%;resize: none;border-radius: 5px;border: solid 1px #e8e8e8;">${map['PROJECT_SUMMARY'] }</textarea>
											                        	<h6 id="minSummary" style="color:gray;float: left">?????? 10????????? ??????????????????.</h6>
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
                                    </div>
                                </div>
                            </div>
                            <!-- Card two -->
                            <%-- <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab" style="">
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
										                            	<h3>?????? ??????</h3>
												                        <br>
												                        <h6 style="color:gray">??????????????? ???????????? ?????? ????????? ????????? ??????????????????.</h6>
												                        <br><br>
										                            </div>
										                        </div>
									                        </div>
										                    <div class="row row-cols-1" style="width:60%;background:#ff00000d;font-size:0.8em;margin-left:3%;padding:3%;">
										                    	<div class="col" style="color:red">????????????</div>
										                    		<ul style="margin-left:5%">
										                    			<li style="list-style: disc">??????????????? ??????????????? ???????????? ????????? ????????? ????????? ???????????? ????????????.</li>
										                    			<li style="list-style: disc">?????? ??? ?????? ????????? ????????? 10% ?????? ?????? ????????? ????????? ????????????.</li>
										                    			<li style="list-style: disc">?????????, ?????????, ?????? ?????? ?????? ?????? ??????????????????.</li>
										                    		</ul>
									                        </div>
									                        <br><br>
									                    </div>
									                    <div class="col-lg-6">
										                    <div class="row row-cols-1">
															    <div class="col">????????????</div>
															</div>
										                    <div class="row row-cols-1">
										                    	<input type="text" name="totalAmount" id="totalAmount" placeholder="??????????????? ???????????????"
										                    		onfocus="this.placeholder = ''" onblur="this.placeholder = '??????????????? ???????????????'" 
										                    		oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
										                    		class="single-input" style="background-color: #fff;border-radius: 5px;border: solid 1px #e8e8e8;text-align:right;"
										                    		value="${map['TOTAL_AMOUNT'] }">
															</div>
															<br>
															<div class="row row-cols-2" style="border-bottom: 1px solid #e4e1e1">
															    <div class="col">???????????? ?????? ??? ?????? ?????????</div>
															    <div class="col" style="text-align:right;color:red;font-weight: bold;"><span id="realAmount"></span>???</div>
																<br><br>
															</div>
															<br>
															<div class="row row-cols-2" style="font-size: 0.8em">
															    <div class="col">??? ????????? (??? ???????????? 5%)</div>
															    <div class="col" style="text-align:right;"><span id="taxAmount"></span>???</div>
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
										                            	<h3>?????? ??????</h3>
												                        <br>
												                        <h6 style="color:gray">????????? ????????? ?????? ????????? ?????? ???????????????. <br>
												                        ?????? ?????? ????????? ????????? ????????? ??? ??????, ?????? ????????? ????????? ?????? ????????????.</h6>
												                        <br><br>
										                            </div>
										                        </div>
										                    </div>
										                    <div class="col-lg-6">
											                    <div class="row row-cols-1">
																    <div class="col">?????????<input id="datepickerStartdate" width="50%" 
																    	value='<fmt:formatDate value="${map['PROJECT_STARTDATE'] }" pattern="yyyy-MM-dd"/>'/></div>
																    <br><br><br><br>
																    <div class="col">?????????<input id="datepickerEnddate" width="50%"
																    	value='<fmt:formatDate value="${map['PROJECT_ENDDATE'] }" pattern="yyyy-MM-dd"/>'/></div>
																    <input type="hidden" name="projectStartdate" id="projectStartdate"
																    	value='<fmt:formatDate value="${map['PROJECT_STARTDATE'] }" pattern="yyyy-MM-dd hh:mm:ss"/>'>
																    <input type="hidden" name="projectEnddate" id="projectEnddate"
																    	value='<fmt:formatDate value="${map['PROJECT_ENDDATE'] }" pattern="yyyy-MM-dd hh:mm:ss"/>'>
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
                            </div> --%>
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
										                            	<h3>???????????? ??????</h3>
												                        <br>
												                        <h6 style="color:gray">??????????????? ????????????, ???????????? ???????????? ??????????????? ???????????? ????????? ???????????? ??????????????????.</h6>
										                            </div>
										                        </div>
									                        </div>
										                    <div class="row row-cols-1" style="background: white">
										                    	<textarea id="summernote" name="projectContent">${map['PROJECT_CONTENT'] }</textarea>	
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