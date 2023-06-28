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
<title>자유게시판 상세조회</title>
</head>
<body class="sub_page">
<div class="hero_area">
    <div class="bg-box">
      <img src="images/hero-bg.jpg" alt="">
    </div>
   <%@ include file ="../header.jsp"%>
</div>
<div class="container pt-3">
<hr><br><br>
<h1>자유게시판 상세조회</h1>
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
				<td colspan="5">
					<pre><font size="4">${board.content}</font></pre>
				</td>
			</tr>
		</tbody>
		<c:if test="${sessionScope.mvo.email == requestScope.board.member.email}">
		<tr>
		<td colspan="5" class="text-center">								
			<button type="button" class="btn btn-outline-primary" onclick="updatePost()">수정</button>	
			<button type="button" class="btn btn-outline-danger" onclick="deletePost()">삭제</button>			
			<form method="post" action="${pageContext.request.contextPath}/DeleteBoard.free" id="deleteBoardForm">
				<input type="hidden" name="boardNo" value="${board.boardNo}">
			</form>
			<form method="post" action="${pageContext.request.contextPath}/UpdateBoardForm.free" id="updateBoardForm">
				<input type="hidden" name="boardNo" value="${board.boardNo}">
			</form>
			<script type="text/javascript">
				function deletePost() {
					if (confirm("정말로 삭제 하시겠습니까?")) {
						document.getElementById("deleteBoardForm").submit();
				    }
				}
				function updatePost() {
					if (confirm("글을 수정 하시겠습니까?")) {
						document.getElementById("updateBoardForm").submit();
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