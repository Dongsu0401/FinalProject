<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardDetail</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!-- <script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script> -->

<style type="text/css">
#boardtable {
	margin: auto;
	width: 80% !important;
	min-height: 600px;
	text-align: center;
}

#w3 {
	margin: auto;
	width: 700px;
	border-collapse: collapse;
}

#w3-sidebar {
	margin-top: 138px;
	height: 356px !important;
}

.replyTable {
	margin: auto;
	width: 500px;
}

.col-sm-7 {
	width: 55.333333% !important;
	margin-top: 10px !important;
}

#rContent {
	margin: auto;
}
th{
 text-align: center !important;
 background: lightblue;
 color: black;
}
.swal2-popup {
  font-size: 20px !important;
}

</style>
</head>
<body>
	<!-- 헤더 -->
	<c:import url="../common/header.jsp" />


	<section class="section normalhead lb">
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
					<h2>게시글 보기</h2>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</div>
	</section>
	<!-- end section -->


	<section class="section overfree">
		<div class="icon-center">
			<i class="fa fa-code"></i>
		</div>
		
		<table border="1" id="boardtable">
		<tr>
			<th width="80px" align="center">번호</th>
			<td>${ board.bo_number }</td>
		
			<td style="width: 150px; background-color: lightblue; font-weight: bold;">제목</td>
			<td>${ board.bo_title }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td colspan="3" >${ board.bo_name }</td>
		</tr>
		<tr>
			<th>작성날짜</th>
			<td colspan="3">
				${ board.bo_date }
			</td>
		</tr>
		<tr>
			<th>모집유형</th>
			<td colspan="3">
				<c:set var="rei" value="${ board.bo_reinfo }" />
				<c:choose>
				    <c:when test="${rei eq 'N'}">
				        	바로
				    </c:when>
				    <c:when test="${rei eq 'Y'}">
				       		예약
				    </c:when>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			
			<!-- 
				이렇게만 두면 엔터가 먹지 않음. 
				DB에는 엔터가 \r\n으로 들어가서 이를 치환해주는 작업 필요
			-->
			
			<% pageContext.setAttribute("newLineChar", "\r\n"); %> <!-- \r\n 말고 그냥 \n도, \r도 가능하다 -->
			<td colspan="3" style="height: 500px; text-align: left;">${ fn:replace(board.bo_detail, newLineChar, "<br>") }<br></td>
		</tr>
		<tr>
			<th>현재 인윈 / 모집 인원</th>
				<c:url var="bJoin" value="bJoin.bo">
					<c:param name="bo_number" value="${ board.bo_number }"/>
					<c:param name="Member_Name" value="${ loginUser.member_Name }"/>
					<c:param name="Member_Id" value="${ loginUser.member_Id }"/>
					<c:param name="bo_member" value="${ board.bo_member }"/>
					<c:param name="bo_maxmember" value="${ board.bo_maxmember }"/>
				</c:url>
				<c:url var="bUnjoin" value="bUnjoin.bo">
					<c:param name="bo_number" value="${ board.bo_number }"/>
					<c:param name="Member_Name" value="${ loginUser.member_Name }"/>
				</c:url>
				<td style="width: 150px;">${ board.bo_member } / ${ board.bo_maxmember }</td>
			<td style="width: 150px; background-color: lightblue; font-weight: bold;">참여자 아이디</td>
			<td>
				<c:set var="join" value="${ board.bo_join }" />
					<c:choose>
					    <c:when test="${join eq NULL}">
					        	참여자가 없어요
					    </c:when>
					    <c:when test="${join != 'NULL'}">
					       		${ board.bo_join}
					    </c:when>
					</c:choose>
				<br>
			<c:set var="joinmember" value="${ board.bo_join }"/>
			<c:if test="${ !empty sessionScope.loginUser }">
				<c:if test="${ board.bo_member < board.bo_maxmember}">
					<c:if test="${ loginUser.member_Name != board.bo_name }">
						<c:if test="${ fn:contains(joinmember,loginUser.member_Name) }">
						<script>
							$(function() {
								$('#join').hide();
								$('#cancel').show();
							})
						</script>
						</c:if>
						<c:if test="${ !fn:contains(joinmember,loginUser.member_Name) }">
						<script>
							$(function() {
								$('#join').show();
								$('#cancel').hide();
							})
						</script>
						</c:if>
							<button class="w3-button w3-round-large w3-light-blue w3-hover-green" id="join">참여</button>
							<button class="w3-button w3-round-large w3-light-blue w3-hover-green" id="cancel">탈퇴</button>
							<script type="text/javascript">
								$('#cancel').click(function(){
									Swal.fire({
										width: 600,
										padding: 100,
									  title: '탈퇴 하시겠습니까?',
									  text: "다시한번 확인해주세요",
									  icon: 'warning',
									  showCancelButton: true,
									  confirmButtonColor: '#3085d6',
									  cancelButtonColor: '#d33',
									  cancelButtonText: '취소',
									  confirmButtonText: '탈퇴할래요!!',
									}).then((result) => {
									if (result.value) {
									    location.href='${ bUnjoin }'
								    	 swalWithBootstrapButtons.fire(
								    		      '탈퇴 되었습니다',
								    		      '탈퇴 완료.',
								    		      'success'
								    		    )
									  } else {
									  }
								  
								})
							});
							</script>
							<script type="text/javascript">
							 $('#join').click(function(){
								Swal.fire({
									width: 600,
									padding: 100,
								  title: '참여 하시겠습니까?',
								  text: "다시한번 확인해주세요",
								  icon: 'warning',
								  showCancelButton: true,
								  confirmButtonColor: '#3085d6',
								  cancelButtonColor: '#d33',
								  cancelButtonText: '취소',
								  confirmButtonText: '참여할래요!'
								}).then((result) => {
									if (result.value) {
									    location.href='${ bJoin }'
								    	 swalWithBootstrapButtons.fire(
								    		      '참여 완료!',
								    		      '열심히 공부해요',
								    		      'success'
								    		    )
									  } else {
									  }
								  
								})
							});  
							</script>
						</c:if>
					</c:if>
					<c:if test="${ board.bo_member == board.bo_maxmember}">
					</c:if>
				</c:if>
			</td>
		</tr>
	
		<c:url var="bUpView" value="bUpView.bo">
			<c:param name="bo_number" value="${ board.bo_number }"/>
		</c:url>
		
		<c:url var="bdelete" value="bdelete.bo">
			<c:param name="bo_number" value="${ board.bo_number }"/>
		</c:url>
		
		<c:url var="blist" value="bList.bo">
		</c:url>
		
		<c:if test="${ loginUser.member_Name eq board.bo_name }">
			<tr>
				<td colspan="2" align="center">
					<button class="w3-button w3-round-large w3-light-blue w3-hover-green" onclick="location.href='${ bUpView }'">수정하기</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="w3-button w3-round-large w3-light-blue w3-hover-green" onclick="location.href='${ bdelete }'">삭제하기</button>
				</td>
			</tr>
		</c:if> 
		
	</table>
	
	
	<br><br>
	 <!-- 댓글 -->
 	 
	<c:if test="${ !empty sessionScope.loginUser }">
		<table class = "replyTable">
		   <tr>
		      <td>
		         <textarea rows = "3" cols = "55" id ="rContent"></textarea>
		      </td>
		      <td>
		         <button id = "rSubmit" class="w3-button w3-round-large w3-light-blue w3-hover-green" >등록하기</button>    
		      </td>
		   </tr>
		</table>
	</c:if>
   <table class = "replyTable" id = "rtb">
      <thead>
         <tr>
            <td colspan = "2"><b id = "rCount"></b>
            </td>
         </tr>
      </thead>
      <tbody></tbody>
      
   </table>
<script>
      $(function(){
    	 getReplyList();
         
         /* setInterval(function(){
            getReplyList();
         } , 10000); */
      });
      
      // 댓글 리스트
      function getReplyList(){
         var bId = ${ board.bo_number } ;
         
         $.ajax({
            url : "rList.bo" ,
            data : {bo_number : bId},
            dataType : "json" ,
            success : function(data){
               $tableBody = $("#rtb tbody");
               $tableBody.html("");
               
               var $tr;
               var $rWriter;
               var $rContent;
               var $rCreateDate;
               var $rUpbutton;
               var $rDebutton;
               
               $("#rCount").text("Comment (" + data.length + ")");
               
               if(data.length > 0){
                  for(var i in data){
                     $tr = $("<tr>");
                     $rWriter = $("<td width = '100'>").text(data[i].rWriter);
                     $rContent = $("<td>").text(decodeURIComponent(data[i].rContent.replace(/\+/g , " ")));
                     $rCreateDate = $("<td width = '100'>").text(data[i].rCreateDate);
                     $rUpbutton = $('<a href="javascript:void(0)" onclick="fn_editReply(' + data[i].rId + ',\'' + data[i].rContent + '\' )" style="padding-right:5px">수정</a>');
                     $rDebutton = $("<a href='javascript:void(0)' onclick='fn_deleteReply(" + data[i].rId + ")'>삭제</a>'");

                     $tr.append($rWriter);
                     $tr.append($rContent);
                     $tr.append($rCreateDate);
                     $tr.append($rUpbutton);
                     $tr.append($rDebutton);
                     $tableBody.append($tr);
                     
                  }
               }else{
                  $tr = $("<tr>");
                  $rContent = $("<td colspan = '3'>").text("등록된 댓글이 없습니다.");
                  $tr.append($rContent);
                  $tableBody.append($tr);
               }
            }
            
         });
      }
      
      // 댓글 등록
      $("#rSubmit").on("click" , function(){
          var rContent = $("#rContent").val();
          var refBid = ${ board.bo_number };
          
          $.ajax({
             url : "addReply.bo" ,
             data : {rContent : rContent , refBid : refBid} ,
             type : "post" ,
             success : function(data){
                if(data == "success"){
                   getReplyList();
                   $("#rContent").val("");
                }
             }
          });
       })
       
       // 댓글 삭제
       function fn_deleteReply(rId){
		var rId = {"rId": rId};

		$.ajax({
			url: "rDelete.bo",
			data : rId ,
			type : 'POST' ,
			success: function(result){
				getReplyList();
			} 
		});
	}



       
       
       
   </script>
 
<%--    <div class="container">
        <label for="content">comment</label>
        <form name="commentInsertForm">
            <div class="input-group">
               <input type="hidden" name="bno" value="${board.bo_number}"/>
               <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">
               <span class="input-group-btn">
                    <button class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
               </span>
              </div>
        </form>
    </div>
    
    <div class="container">
        <div class="commentList"></div>
    </div>
</div>

 <script>
var bno = '${board.bo_number}'; //게시글 번호
 
$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
    commentInsert(insertData); //Insert 함수호출(아래)
});
 
//댓글 목록 
function commentList(){
    $.ajax({
        url : 'rList.bo',
        type : 'post',
        data : {'bo_number':bno},
        success : function(data){
            var a =''; 
            $.each(data, function(key, value){ 
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                a += '<div class="commentInfo'+board.rId+'">'+'댓글번호 : '+board.rId+' / 작성자 : '+board.rWriter;
                a += '<a onclick="commentUpdate('+board.rId+',\''+board.rContent+'\');"> 수정 </a>';
                a += '<a onclick="commentDelete('+board.rId+');"> 삭제 </a> </div>';
                a += '<div class="commentContent'+board.rId+'"> <p> 내용 : '+board.rContent +'</p>';
                a += '</div></div>';
            });
            
            $(".commentList").html(a);
        }
    });
}
 
//댓글 등록
function commentInsert(insertData){
    $.ajax({
        url : '/comment/insert',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
            }
        }
    });
}
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(cno, content){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+cno+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+cno+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+cno).html(a);
    
}
 
//댓글 수정
function commentUpdateProc(cno){
    var updateContent = $('[name=content_'+cno+']').val();
    
    $.ajax({
        url : '/comment/update',
        type : 'post',
        data : {'content' : updateContent, 'cno' : cno},
        success : function(data){
            if(data == 1) commentList(bno); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제 
function commentDelete(cno){
    $.ajax({
        url : '/comment/delete/'+cno,
        type : 'post',
        success : function(data){
            if(data == 1) commentList(bno); //댓글 삭제후 목록 출력 
        }
    });
}
 
 
 
 
$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});
 
 
 
</script> --%>


 
	<br><br>
	
	<p align="center">
		<button class="w3-button w3-round-large w3-light-blue w3-hover-green" onclick="location.href='index.jsp'">시작 페이지로 이동</button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button class="w3-button w3-round-large w3-light-blue w3-hover-green" onclick="location.href='${ blist }'">게시판으로 가기</button>
	</p>
	
	</section>
	<!-- footer -->
	<c:import url="../common/footer.jsp"/>
	
</body>
</html>