<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <title>공 지 사 항</title>
  <link rel="icon" href="images/favicon1.png">
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
  <link rel="icon" href="images/favicon1.png">
<title>공 지 사 항</title>
</head>
<body class="sub_page">
  <div class="hero_area">
    <div class="bg-box">
    </div>
    <c:import url="../header.jsp"/>
  </div>
<div class="container pt-3">
<hr><br><br>
<h1 align="center"><strong>Notice Board</strong></h1>
<hr style="border-top: 3px solid gray"> 
<br>
		<table class="table table-boarderd table-hover boardlist">
			<thead class="thead-light" align="center">
				<tr style="background-color: #ccffee">
					<th>번호</th>
					<th class="title">제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>수정일</th>
					<th>조회</th>
					<th>타입</th>
			</tr>
				</thead>
				<tbody align="center">
				<c:forEach items="${list}" var="board">
					<tr>
						<td>${board.boardNo}</td>
						<td>
					<c:choose>
						<c:when test="${sessionScope.mvo==null}">
						${board.title}
						</c:when>
						<c:otherwise>
						<a href="${pageContext.request.contextPath}/NoticeDetail.do?no=${board.boardNo}">${board.title}</a>
						</c:otherwise>
					</c:choose>					
					</td>
					<td>${board.member.nick}</td>
					<td>${board.registerDate}</td>
					<td>${board.editDate}</td>
					<td>${board.hits}</td>
					<td>${board.boardType}</td>
			</tr>
				</c:forEach>
				</tbody>
			</table>
				<c:if test="${sessionScope.mvo != null}">
				     <form action="${pageContext.request.contextPath}/NoticeWriteBoardForm.do" method="post">
				     <button type="submit" class="btn btn-primary pull-right"><i class="fa fa-edit fa-fw"></i>글쓰기</button> 
				     </form>
				</c:if>
			<ul class="pagination justify-content-center">	
				<c:if test="${pagination.previousPageGroup}">
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/NoticeBoardList.do?pageNo=${pagination.startPageOfPageGroup - 1}">이전</a></li>
				</c:if>
					<c:forEach begin="${pagination.startPageOfPageGroup}" end="${pagination.endPageOfPageGroup}" var="page">
						<c:choose>
							<c:when test="${page == pagination.nowPage}"> 
								<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/NoticeBoardList.do?pageNo=${page}">${page}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/NoticeBoardList.do?pageNo=${page}">${page}</a></li>
							</c:otherwise>
						</c:choose> 
					</c:forEach>
				<c:if test="${pagination.nextPageGroup}">		
			  		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/NoticeBoardList.do?pageNo=${pagination.endPageOfPageGroup + 1}">다음</a></li>
			  	</c:if>     
			</ul>
</div>
<br><br><br><br><br>
  <!-- footer section -->
  <c:import url="../footer.jsp"/>
  <!-- footer section -->
</body>
</html>