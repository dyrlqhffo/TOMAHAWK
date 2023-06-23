<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>title</title>
</head>
<body>
<div class="container pt-3">
<table class="table">
		<tr>
			<td>제목 ${board.title}</td>
			<td>작성자 ${board.member.nick}</td>
			<td>조회수 ${board.hits}</td>
			<td>${board.registerDate}</td>	
		</tr>
		<tr>
			<%-- 
			  pre tag : db에 저장된 글형식 그대로 표현( 줄바꿈 등이 표현됨 ) 
				         pre tag 라인인 행변경없이 한라인으로 표현해야 함   
			 --%>
			<td colspan="5">
				<pre><font size="4">${board.content}</font></pre>
			</td>
		</tr>
		<c:if test="${sessionScope.mvo.email==requestScope.board.member.email }">
		<tr>
		<td colspan="5" class="text-center">								
			<button type="button" class="btn btn-success" onclick="deletePost()">삭제</button>			
			<button type="button" class="btn btn-success" onclick="updatePost()">수정</button>	
			<form method="post" action="${pageContext.request.contextPath}/DeletePost.do" id="deletePostForm">
				<input type="hidden" name="no" value="${email.no}">
			</form>
			<form method="post" action="${pageContext.request.contextPath}/updatePostForm.do" id="updatePostForm">
				<input type="hidden" name="no" value="${email.no}">
			</form>
			<script type="text/javascript">
				function deletePost() {
					if (confirm("삭제 하겠습니까?")) {
						document.getElementById("deletePostForm").submit();
				    }
				}
				function updatePost() {
					if (confirm("수정 하겠습니까?")) {
						document.getElementById("updatePostForm").submit();
				    }
				}
			</script>					
		</td>
	</tr>
	
	</c:if>
		</table>
</div>
</body>
</html>