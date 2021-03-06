<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/ssong.css">

<title>마이페이지</title>
<style type="text/css">
.div1 {
	margin: 0px auto;
	position: relative;
	height: auto;
	padding: 0px;
}

.div2{
	padding: 94px 0px;
    flex-direction: row;
    width: 1032px;
    min-height:	620px;
    display: flex;
    margin-left: 230px;
}

.section1{
    min-width: 400px;
    width: 504px;
    order: 2;
    height: auto;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
}

.f1{
    display: block;
    width: 100%;
    height: 100%;
    margin: 0px;

}

.div3{
	padding: 0px;
    order: 1;
    margin: 0px 102px 0px 0px;
    -webkit-box-flex: 1;
    flex-grow: 1;
}

.button{
    border-radius: 20px;
    margin-top: 20px;
    padding: 15px 10px;
    background: rgb(255, 87, 87);
}

.button1{
    border-radius: 20px;
    margin-top: 20px;
    padding: 15px 10px;
    background: rgb(229 229 229);
}
</style>
<div>
	<div class="div1">
		<div class="div2">
			<section class="section1">
				<figure class="f1">
					<img src="<c:url value='/project_assets/projectImg/${plan["PROJECT_IMAGE"]}'/>"
						style="width: 500px; height: 400px; ">
				</figure>
			</section>
			<div class="div3">
				<div class="weekly2-single">
					<div class="weekly2-img" style="margin: 0px 0px 84px;">
						<div style="position: relative;">
							<br><br>
							<div style="margin-bottom: 10px; height: 180px;">
								<div class="color2" style="font-weight: bold; margin-top: 10px; color: #b5b3b3">
								${plan['CATEGORY_NAME']}
								</div>
								<div class="color1" style="font-size: 1.8em;">${plan['PROJECT_NAME']}</div> 
								<div class="color2" style="font-weight: bold; margin-top: 10px; color: #7e7e7e; font-size: 1em;">
								${plan['USER_NAME']}
								</div>
								<div class="color1" style="font-weight: bold; margin-top: 10px; font-size: 1.2em;">
								${plan['PROJECT_INSHORT']}
								</div>
								<div class="color2" style="font-weight: bold; margin-top: 10px; color: #ff6274; font-size: 1em;">
									<fmt:formatDate value="${plan['PROJECT_STARTDATE']}" pattern="yyyy년 MM월 dd일"/>
									<span>공개 예정</span>
								</div>
								<c:if test="${informCheck=='1' }">
									<div class="button1">
										<a href="<c:url value='/mypages/deleteInform?projectNo=${plan["PROJECT_NO"]}'/>" style="color: #ff4747;">
											<img src="<c:url value='/assets/img/ssong/alarm.png'/>" style="width: 30px; margin-left: 100px;">
											<span style="margin-left: 10px; font-size: 1.2em;">알림신청 완료 (${count }명 신청중)</span>
										</a>
									</div>
								</c:if>
								<c:if test="${informCheck=='0' }">
									<div class="button">
										<a href="<c:url value='/mypages/addInform?projectNo=${plan["PROJECT_NO"]}'/>" style="color: white;">
											<img src="<c:url value='/assets/img/ssong/alarm.png'/>" style="width: 30px; margin-left: 100px;">
											<span style="margin-left: 10px; font-size: 1.2em;">알림신청 (${count }명 신청중)</span>
										</a>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<article>
	<c:import url="/project/randomList"></c:import>
	</article>
<%-- 	<article>
	<c:import url="/project/planList"></c:import>
	</article> --%>
</div>
<script type="text/javascript">
var result = '${msg}';
if (result == 'success') {
        alert("알림신청이 완료되었습니다.");
}else if(result == 'fail'){
	 alert("알림신청이 취소되었습니다.");
}
</script>
<%@ include file="../include/bottom.jsp" %>  