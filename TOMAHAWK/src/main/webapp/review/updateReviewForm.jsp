<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/summernote/summernote-lite.js"></script>
  <script src="${pageContext.request.contextPath}/js/summernote/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/summernote/summernote-lite.css">
  <link rel="icon" href="images/favicon1.png">
<title>Insert title here</title>
</head>
<body>
<div class="container pt-3">
<a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/images/HOME.png"></a>
<a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/images/bookmark.png"></a>
<a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/images/SEARCH.png"></a><hr><br><br>
<h1>리뷰 게시판 글 수정하기</h1>
<hr style="border-top: 3px solid gray"> 
<br>

<form method="post" action="${pageContext.request.contextPath}/UpdateReviewBoard.do" id="updateReviewBoard-form">
	<input type="hidden" name="no" value="${board.boardNo}">
	
	<fieldset>
        <ul id="shipping">
          <li>
            <label for="title">글제목</label>
            <input type="text" name="title" id="title" value="${board.title}" required="required">
          </li>
          <br>
          <li>
            <label for="nick">작성자</label>
            <input type="text" name="nick" value="${mvo.nick}" readonly="readonly">
          </li>
          <br>
          <li>
            <label for="boardType"></label>
            <select class="boardType" id="type" value="${board.boardType}" name="boardType">
            	<option value="null" selected disabled>-게시판 분류-</option>
		        <option value="free">자유게시판</option>
		        <option value="review">리뷰게시판</option>
		        <option value="shop">식당게시판</option>
		        <c:if test="${sessionScope.mvo.admin==2}">
		        	<option value="notice">공지사항</option>
		        </c:if>
		    </select>
          </li>
          <br>
          <br>
          <li>
            <label for="content">본문내용</label>
			<textarea id="summernote" rows="10" class="form-control" name="content" placeholder="본문내용" required="required">${board.content}</textarea>
					<script>
					  $('#summernote').summernote({
						placeholder: '내용을 이곳에 작성해주세요.',
						tabsize: 2,
						height: 500
					  });
				    </script> 
          </li>     
        </ul>  
      </fieldset>
	</form>
		<div class="text-center">
  			<button type="button" onclick="updateReviewBoard()" id="upd-btn" class="btn btn-primary">수정하기</button>
			<button type="button" onclick="javascript:history.back()'" class="btn btn-outline-secondary">취소하기</button>			
		</div>
	</div>
	
<script>
    $(document).ready(function() {
        $('select').niceSelect();
        // $('.nice-select .list').niceScroll();
    });

    $(function() {
        $("#upd-btn").click(function(event) {
            let title = $("#title").val();
            let content = $('#summernote').summernote('code').val(); // Get the value of the Summernote editor
            let type = $("#type").val();

            if(title.trim() ==""){
                alert("제목을 입력해주세요.");
                $("#title").focus();
                return;
            } else if(content.trim() == ""){
                alert("내용을 입력해주세요.");
                $("#content").focus();
                return;
            } else if(type == "null"){
                alert("게시판 분류를 선택해주세요.");
                return;
            }
            if(confirm("게시물을 수정 하시겠습니까?")){
                event.preventDefault();
                $("#updateReviewBoard-form").submit();
            }
        });
    });
</script>
</body>
</html>