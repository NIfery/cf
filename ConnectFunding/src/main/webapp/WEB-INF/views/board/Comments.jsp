<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

var boardNo = '${vo.boardNo}';
var NickName ='${vo.userNickName}';

var userNickName = '<%=(String)session.getAttribute("userNickName")%>';

$('[name=commentInsertBtn]').click(function(){  
    var insertData = $('[name=commentInsertForm]').serialize(); 
    commentInsert(insertData); 
});

//목록 출력
function commentList(){
    $.ajax({
        url : "<c:url value='/Comments/List'/>",
        type : 'get',
        data : {'boardNo':boardNo},
        success : function(data){
        	console.log(data.ProfileImg);
        	console.log(data.CommentList);
			
            var a =''; 
            $.each(data.CommentList, function(key, value){ 
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                if(value.CommentStep > 0) {
               	for(var i=0; i < value.CommentStep; i++ ) {
               		a +='&nbsp&nbsp&nbsp';
               	}
                a += '<img src="<c:url value='/resources/images/re.gif'/>">';
                }
                
                a += '<div class="commentInfo'+value.CommentNo+'">';
            	
                $.each(data.ProfileImg, function(key2, value2){
                	var imgSrcTemplate = '<c:url value="${contextRoot}/profile_img/_PROFILE_" />';
                	if(value.userNickName == value2.NICKNAME) {
                		if(value2.PROFILE !=null){
                		a += '<a href="<c:url value='/board/UserBoard'/>"><img style="width: 20px" src=\"' + imgSrcTemplate.replace( "_PROFILE_",  value2.PROFILE ) + '\"></a>';
                		}else {
                		a += '<a href="<c:url value='/board/UserBoard'/>"><img style="width: 20px" src=\"' + imgSrcTemplate.replace( "_PROFILE_",  "non.PNG" ) + '\"></a>';
                		}
                	}
                		
                });
                
                /* a += '<select class="selectpicker"><option value="게시글보기">게시글보기</option></select>'; */
                 a += '&nbsp<span style="font-weight: 550;">'+value.userNickName+'</span>';

                if(value.userNickName == ${'NickName'}) {
                	a+= '&nbsp<img style="width:40px" src="<c:url value='/resources/images/my.PNG'/>">';
                }
                a += '<div class="commentContent'+value.CommentNo+'"> <p>'+value.CommentContent +'</p>';
                a += '<a data-toggle="collapse" href="#collapseExample'+value.CommentNo+'" aria-expanded="false" aria-controls="collapseExample">답글쓰기</a>';
                if(value.userNickName == ${'userNickName'}){
                a += '<a onclick="commentUpdate('+value.CommentNo+',\''+value.CommentContent+'\');">ㅣ 수정 </a>ㅣ';
                a += '<a onclick="commentDelete('+value.CommentNo+');"> 삭제 </a>';
                }
                a += '</div>';
                a += '<p>'+ChangeDate(value.CommentRegdate)+'</p>';
                
                a += '<div class="collapse" id="collapseExample'+value.CommentNo+'"><form name="ReplyForm'+value.CommentNo+'"><div class="well">';
                a += '<div class="input-group">';
                a += '<input type="hidden" name="CommentGroupNo" value="'+value.CommentGroupNo+'" />';
                a += '<input type="hidden" name="CommentStep" value="'+value.CommentStep+'" />';
                a += '<input type="hidden" name="CommentSortNo" value="'+value.CommentSortNo+'" />';
                a += '<input type="hidden" name="BoardNo" value="'+value.BoardNo+'" />';
                a += '<input type="hidden" name="CommentNo" value="'+value.CommentNo+'" />';
				a += '<input type="hidden" name="userNickName" value="'+${'userNickName'}+'"/>';
               
                a += '<span>'+${'userNickName'}+'</span>';
                
                a += '<input type="text" class="form-control" id="Reply" name="CommentReply" placeholder="댓글 내용을 입력하세요.">';	
                
                a += '<span class="input-group-btn"><button class="btn btn-default" style="margin-top: 20px" type="button" name="ReplyBtn" id="ReplyBtn"><a onclick="commentReply('+value.CommentNo+')">등록</a></button></span>';
               	
                a += '</div>';
                a += '</div></form></div>';
               
                a += '</div>';
                a += '</div>';
            });
            
            $(".commentList").html(a);
        }
    });
}

//댓글 등록
function commentInsert(insertData){
	
    $.ajax({
        url : "<c:url value='/Comments/Write'/>",
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
                commentList(); //reload
                $('[name=CommentContent]').val('');
            }
        },
        error:function(xhr, status,error) {
			alert("댓글 내용을 입력하세요.");
		}
    });
}

//댓글 수정
function commentUpdate(CommentNo, CommentContent){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+CommentNo+'" value="'+CommentContent+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-primary" type="button" onclick="commentUpdateProc('+CommentNo+');">수정</button> </span>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="UpdateCancel('+CommentNo+');">취소</button> </span>';
    a += '</div>';
    
    $('.commentContent'+CommentNo).html(a);
    
}
 
//댓글 수정
function commentUpdateProc(CommentNo){
    var updateContent = $('[name=content_'+CommentNo+']').val();
    
    $.ajax({
        url : "<c:url value='/Comments/Update'/>",
        type : 'post',
        data : {'CommentContent' : updateContent, 'CommentNo' : CommentNo},
        success : function(data){
            if(data == 1) commentList(boardNo); //댓글 수정후 목록 출력 
        }
    });
}

//수정 취소
function UpdateCancel(){
    var check = confirm('댓글 수정을 취소하시겠습니까?');
    if (check){
    	commentList(boardNo);
    }
}
 
//댓글 삭제 
function commentDelete(CommentNo){
	var check = confirm('댓글을 정말 삭제하시겠습니까?');
	if(check) {
    $.ajax({
        url : "<c:url value='/Comments/Delete'/>",
        type : 'post',
        data : {'CommentNo' : CommentNo},
        success : function(data){
            if(data == 1) commentList(boardNo); //댓글 삭제후 목록 출력 
        }
    });
  }
}

function commentReply(CommentNo) {
	var Reply =$('[name=ReplyForm'+CommentNo+']').serialize();
	
	$.ajax({
        url : "<c:url value='/Comments/Reply'/>",
        type : 'post',
        data : Reply,
        success : function(data){
            if(data != 0) {
                commentList(); //reload
                $('[name=CommentContent]').val('');
            }
        },
        error:function(xhr, status,error) {
			alert("댓글 내용을 입력하세요.");
		}
    });
}

//날짜 변환 함수
function ChangeDate(date) {
	date = new Date(date);
	year = date.getFullYear();
	month = date.getMonth()+1;
	day = date.getDate();
	hour = date.getHours();
	minute = date.getMinutes();
	second = date.getSeconds();
	result = year+"."+month+"."+day+" "+hour+":"+minute+":"+second;
	return result;
}
 
$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});
 
</script>
</head>
<body>

</body>
</html>