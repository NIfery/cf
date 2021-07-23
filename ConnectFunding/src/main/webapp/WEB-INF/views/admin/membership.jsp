<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">	
	function pageProc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();	
	}
	
	function selectAll(selectAll)  {
		  const checkboxes 
		       = document.getElementsByName('checkbox');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked;
		  })
		}
	
	function deleteMember(){
        var valueArr = new Array;
        var list = $('input[name="checkbox"]');
        for(var i=0; i<list.length; i++){
        	if(list[i].checked){
        		valueArr.push(list[i].value);
        	}
        }
        if(valueArr.length==0){
        	alert("선택된 회원이 없습니다.");
        }else{
        	var chk = confirm("정말로 삭제하시겠습니까?");
        	$.ajax({
        		url : "<c:url value='/admin/membership'/>",
        		type : 'POST',
        		data : {valueArr : valueArr},
        		success:function(jdata){
        			if(jdata = 1){
        				alert("삭제 성공!");
        			}else{
        				alert("삭제 실패!");
        			}
        		}
        	})
        }
    }
	
</script>
<!-- 페이징 처리를 위한 form -->
<form action="<c:url value='/admin/membership'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="currentPage"><br>
	<input type="hidden" name="searchCondition" value="${param.searchCondition}"><br>
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword }"><br>	
</form>
	 <div class="page-content--bge5">
        <div class="container">
            <!-- DATA TABLE-->
            <section class="p-t-20">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                         <input type="button" class="btn btn-danger float-right" onclick="deleteMember()" value="선택 삭제">
                            <div class="table-responsive table-responsive-data2">
                                <table class="table table-data2">
                                    <thead>
                                        <tr>
                                            <th>
                                                <label class="au-checkbox">
                                                    <input type="checkbox" name="checkbox" value="selectAll" onclick="selectAll(this)">
                                                    <span class="au-checkmark"></span>
                                                </label>
                                            </th>
                                            <th>회원번호</th>
                                            <th>회원구분</th>
                                            <th>email</th>
                                            <th>사업자번호</th>
                                            <th>이름</th>
                                            <th>가입일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                       <c:if test="${empty list }">
											<tr>
												<td colspan="7" class="align_center">데이터가 없습니다.</td>
											</tr>
										</c:if>	
                                       <c:if test="${!empty list }">
												<c:forEach var="vo" items="${list }">
											<tr>
												    <td>
		                                                <label class="au-checkbox">
		                                                    <input type="checkbox" name="checkbox" value="${vo.userNo }">
		                                                    <span class="au-checkmark"></span>
		                                                </label>
		                                            </td>
													<td>${vo.userNo}</td>
													<td>
														<c:if test="${vo.userFlag eq 0}">
															일반회원
														</c:if>
														<c:if test="${vo.userFlag eq 1}">
															사업자회원
														</c:if>
													</td>
													<td>${vo.userEmail }</td>
													<td>
														<c:if test="${vo.userFlag eq 0}">
															-
														</c:if>
														<c:if test="${vo.userFlag eq 1}">
															${vo.businessNo }
														</c:if>
													</td>
													<td>${vo.userName }</td>
													<td>
													<fmt:formatDate value="${vo.userJoindate }" pattern="yyyy-MM-dd"/>
													
													</td>
											</tr>
												</c:forEach>
										</c:if>	
                                    </tbody>
                                </table>
                            </div>
                          <div class="divPage" style="text-align: center"><br>
                          <ul class="pagination" style="justify-content: center;">
							<!-- 페이지 번호 추가 -->		
							<!-- 이전 블럭으로 이동 -->
							<c:if test="${pagingInfo.firstPage>1 }">
								<li class="page-item active"><a href="#" class="page-link" onclick="pageProc(${pagingInfo.firstPage-1})">
									이전 블럭으로
								</a></li>
							</c:if>
												
							<!-- [1][2][3][4][5]-->
							
								<c:forEach var="i" begin="${pagingInfo.firstPage }" 
									end="${pagingInfo.lastPage }">
									<c:if test="${i==pagingInfo.currentPage }">
										<li class="page-item"><a class="page-link" href="#">${i}</a></li>
									</c:if>
									<c:if test="${i!=pagingInfo.currentPage }">
										<li class="page-item active"><a class="page-link" href="#" onclick="pageProc(${i})">${i}</a></li>
									</c:if>
								</c:forEach>
							
							<!-- 다음 블럭으로 이동 -->
							<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
								<li class="page-item active"><a href="#" class="page-link" onclick="pageProc(${pagingInfo.lastPage+1})">
									다음 블럭으로
								</a></li>
							</c:if>
							<!--  페이지 번호 끝 -->
							</ul><br>
		                        <div class="divSearch">
								   	<form name="frmSearch" method="post" 
								   		action='<c:url value="/admin/membership"/>'>
								        <select name="searchCondition">
								            <option value="user_Email" 
								            	<c:if test="${param.searchCondition == 'userEmail' }">            	
								            		selected="selected"
								            	</c:if>
								            >이메일</option>
								            <option value="user_Name" 
								            	<c:if test="${param.searchCondition == 'userName' }">            	
								            		selected="selected"
								            	</c:if>
								            >이름</option>
								           							            
								        </select>
								        <input type="text" name="searchKeyword" title="검색어 입력"
								        	value="${param.searchKeyword }">   
										<input type="submit" value="검색">
								    </form>
								</div>
						</div>
                        </div>
                    </div>
                </div>
                <br><br><br>
            </section>
            <!-- END DATA TABLE-->
            <!-- END PAGE CONTAINER-->
            </div>
        </div>
        

<%@ include file="../inc/adminBottom.jsp" %>