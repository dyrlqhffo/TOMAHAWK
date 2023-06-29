<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="">
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
<div class="container">

    <form action="${pageContext.request.contextPath}/UpdateReviewBoard.do" id="updateReviewBoard" method="post">
        <div class="form-group">
            <label for="title">Title</label>
            <input type="text" class="form-control" placeholder="Enter title" id="title" name="title" value= "${board.title}" style="width:70%">
           	<input type="hidden" name="no" value="${board.boardNo}">
            <select  name="type" id="type" value="${board.boardType}"> 
            	<option value="what">- 선택 - </option>
            	<option value="shop">식당 게시판</option>
            	<option value="review">후기 게시판</option>
            	<option value="free">자유 게시판</option>
            	<option value="notice">공지사항 게시판</option>
            </select>
            
        </div>


        <div class="form-group">
            <label for="comment">Comment:</label>
            <textarea class="form-control summernote" rows="5" id="content" name="content">${board.content}</textarea>
        </div>
    <button id="btn-save" class="btn btn-success" onclick="updateReviewBoard()">저장</button>
    <button id="btn-save" class="btn btn-dark" onclick="javascript:history.back()">취소</button>
    </form>
</div>

<script>
	$(function() {
		$(".summernote").summernote({
			height: 500,		//에디터 높이
			minHeight: null,   //최소 높이
			maxHeight: null,   //최대 높이
			focus: true,  	   //에디터 로딩후 포커스를 맞출지 여부
			lang: "ko-KR", //한글 설정
			placeholder: '타인에게 피해를 주지 않는 선에서 자유로운 글을 작성해주세요.'  //placeholder설정
			
		})
	$('.note-view').remove();
	$('.note-fontname').remove();
	$('.note-color').remove();

	})
	function updateReviewBoard(){
		document.getElementById('updateReviewBoard').submit();
	}	
	
	
</script>
</body>
</html>