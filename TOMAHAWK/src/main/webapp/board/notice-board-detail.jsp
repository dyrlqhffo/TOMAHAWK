<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
  <link href="css/font-awesome.min.css" rel="stylesheet" />
  <link href="css/style.css" rel="stylesheet" />
  <link href="css/responsive.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="js/jquery-3.4.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="js/bootstrap.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
  <script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="js/custom.js"></script>
  <title>공지사항</title>
  <link rel="icon" href="images/favicon1.png">
<style>
  .media {
    display: flex;
    align-items: center;
  }
  .media img {
    width: 50px; /* 원하는 크기로 조절 */
    height: auto; /* 가로 너비에 맞추어 비율 유지 */
    margin-right: 10px; /* 사진과 텍스트 사이의 간격을 조절 (원하는 값으로 변경) */
  }
</style>  
</head>
<body class="sub_page">
  <div class="hero_area">
    <div class="bg-box">
    </div>
    <c:import url="../header.jsp"/>
  </div>

<div class="container pt-3">
<!--   <a href="${pageContext.request.contextPath}/index.jsp">HOME</a> &nbsp;&nbsp;&nbsp;
	<c:if test="${sessionScope.mvo != null}">
		<a id="logoutLink" href="#">로그아웃</a>
		<form method="post" action="${pageContext.request.contextPath}/Logout.do" id="logoutForm"></form>
		<script>
			document.getElementById("logoutLink").addEventListener('click', function(event) {
				event.preventDefault();
				if(confirm("로그아웃 하시겠습니까?")){
					document.getElementById("logoutForm").submit();
				}
			});
		</script>
	</c:if> -->
<hr><br><br>
<h1 align="center"><strong>Notice Board</strong></h1>
<hr style="border-top: 3px solid gray"> 
<br>

<table class="table table-boarderd">
		<thead class="thead-light">
			<tr>
				<th>제목 : ${board.title}</th>
				<th>작성자 : ${board.member.nick}</th>
				<th>작성일 : ${board.registerDate}</th>	
				<th>조회수 : ${board.hits}</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<%-- 
				  pre tag : db에 저장된 글형식 그대로 표현( 줄바꿈 등이 표현됨 ) 
					         pre tag 라인인 행변경없이 한라인으로 표현해야 함   
				 --%>
				<td colspan="5">
					<pre><font size="4">${board.content}</font></pre>
				</td>
			</tr>
		</tbody>
		<c:if test="${sessionScope.mvo.nick == requestScope.board.member.nick}">
		<tr>
		<td colspan="5" class="text-center">								
			<button type="button" class="btn btn-outline-primary" onclick="updatePost()">수정</button>	
			<button type="button" class="btn btn-outline-danger" onclick="deletePost()">삭제</button>			
			<form method="post" action="${pageContext.request.contextPath}/NoticeDeleteBoard.do" id="deleteBoardForm">
				<input type="hidden" name="boardNo" value="${board.boardNo}">
			</form>
			<form method="post" action="${pageContext.request.contextPath}/NoticeUpdateForm.do?no=${board.boardNo}" id="noticeUpdateForm">
				<input type="hidden" name="boardNo" value="${board.boardNo}">
			</form>
			<script type="text/javascript">
				function deletePost() {
					if (confirm("정말로 삭제 하겠습니까?")) {
						document.getElementById("deleteBoardForm").submit();
				    }
				}
				function updatePost() {
					if (confirm("글을 수정 하시겠습니까?")) {
						document.getElementById("noticeUpdateForm").submit();
				    }
				}
			</script>					
		</td>
	</tr>
	</c:if>
		</table>
		
		
		
<!--  댓글 시작 -->		
<div class="card" id="comments">
  <div class="card-body">
    <!-- 댓글 작성 창 -->
    <a href="#comment"></a>
    <form>
      <div class="form-group">
        <label>댓글 작성</label>
        <textarea class="form-control" id="comment" rows="3"></textarea>
      </div>
      <input type="hidden" name="no" id="no" value="${board.boardNo}">
      <button type="button" class="btn btn-primary" id="writeComment-btn">등록</button>
    </form>
 
  <!-- 댓글 목록 -->
 <ul class="list-unstyled" id="insertNewComment">
  <c:forEach items="${commentList}" var="comment">
    <li class="media mt-4 commentLi">
    <img src="images/profile.jpg" class="mr-3" alt="avatar">
      <div class="media-body">
        <h5 class="mt-0 mb-1">${comment.member.nick}</h5>
        <p>${comment.content}</p>
      </div>
    <p>${comment.commentDate}</p> &nbsp;&nbsp;
    <c:if test="${mvo.email == comment.member.email}">
     <button type="button" class="">수정</button>&nbsp;
     <button type="button" class="deleteCommentBtn" data-no="${comment.commentNo}">삭제</button>&nbsp;
     </c:if>
    </li>
  </c:forEach>
</ul>
</div>
</div>		
		
		
		
		
</div>

 
<script>
$(function() {
	   
	   $("#comment").keypress(function(event) {
		   if (event.which === 13) { // 엔터 키 코드 확인
		      event.preventDefault(); // 기본 동작 방지 (폼 제출 등)
		      $("#writeComment-btn").click(); // 댓글 등록 버튼 클릭
		   }
		});
	   
   $("#writeComment-btn").click(function() {
      let comment = $("#comment").val();
      let no = $("#no").val();
      if(comment.trim()==""){
     	 alert("댓글을 입력해주세요.");
     	 $("#comment").focus();
     	 return false;
      }
      
 
      //<button type="button" class="btn btn-success">수정</button>&nbsp;
      // <button type="button" class="deleteCommentBtn">삭제</button>
      
      $.ajax({
         type: "post",
         url: "${pageContext.request.contextPath}/WriteCommentAjax.do",
         data: {comment: comment, no: no},
         dataType: "json",
         success:function(result){
            if(result.jsonResult == "ok"){
         	  let newComment="";
               newComment += "<li class='media mt-4'><img src='images/profile.jpg' class='mr-3' alt='avatar'><div class='media-body'>"+
                "<h5 class='mt-0 mb-1'>"+result.jsonComment.member.nick+"</h5><p>"+result.jsonComment.content+"</p></div><p>"+
                result.jsonComment.commentDate+"</p>&nbsp;&nbsp; <button type='button' class=''>"+"수정"+"</button>&nbsp;"+
                "<button type='button' class='deleteCommentBtn'>"+"삭제"+"</button>&nbsp;<input type='hidden' class='review-comment-no' value="+result.jsonComment.commentNo+"></li>";
              	$("#insertNewComment").append(newComment);
               	$("#comment").val("");
               
               	
            
            }
         } //succ
      });//ajax
   });//click
	                    
   $(".commentLi").on("click", ".deleteCommentBtn", function() {
 	  let commentList = $(this);
 	  let delCommentToNo = $(this).data("no");
 	  let del = confirm("삭제하시겠습니까");
 	  if (!del) {
 	    return false;
 	  }

 	  $.ajax({
 	    type: "post",
 	    url: "${pageContext.request.contextPath}/DeleteCommentAjax.do",
 	    data: { delCommentToNo: delCommentToNo },
 	    dataType: "json",
 	    success: function(result) {
 	      if (result.jsonResult == "ok") {
 	        // 삭제 성공 시 처리할 내용
 	        //delCommentToNo.closest("li").remove(); // 삭제된 댓글의 li 요소를 제거
 	    	commentList.parent().remove();
 	    	  
 	      }
 	    }
 	  }); //ajax
 	}); //click
});//function
</script>  
    <!-- footer section -->
  <c:import url="../footer.jsp"/>
  <!-- footer section -->
</body>
</html>