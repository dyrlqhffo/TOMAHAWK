<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>공시자항 수정</title>
</head>
<body>
<div class="container pt-3">
<h1>공지사항 수정</h1>
		
<form method="post" action="${pageContext.request.contextPath}/NoticeUpdate.do">
	<input type="hidden" name="boardNo" value="${board.boardNo}">

	<fieldset>
        <ul id="shipping">
          <li>
            <label for="title">글제목</label>
            <input type="text" name="title" value="${board.title}" required="required">
          </li>
          
          <li>
            <label for="nick">작성자</label>
            <input type="text" name="nick" value="${mvo.nick}" readonly="readonly">
          </li>
          <li>
            <label for="content">본문내용</label>
			<textarea id="summernote" rows="10" class="form-control" name="content" placeholder="본문내용" required="required">${board.content}</textarea>
					<script>
					  $('#summernote').summernote({
						placeholder: '내용을 이곳에 작성해주세요.',
						tabsize: 2,
						height: 100
						
					  });
				    </script> 
          </li>     
        </ul>  
      </fieldset>
		<div class="text-center">
				<button type="submit" class="btn btn-success">확인</button>
			<button type="reset" class="btn btn-back">취소</button>
		</div>
</form>
</div>
</body>
</html>