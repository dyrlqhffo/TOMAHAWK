<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title> TomaHawk </title>
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
  <link href="css/font-awesome.min.css" rel="stylesheet" />
  <link href="css/style.css" rel="stylesheet" />
  <link href="css/responsive.css" rel="stylesheet" />
  <script src="js/jquery-3.4.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="js/bootstrap.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
  <script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
  <script src="js/custom.js"></script>
</head>

<body class="sub_page">

  <div class="hero_area">
    <div class="bg-box">
      <img src="images/hero-bg.jpg" alt="">
    </div>
    <!-- header section strats -->
    <c:import url="header.jsp"/>
    <!-- end header section -->
  </div>

  <!-- food section -->

  <section class="food_section layout_padding">
    <div class="container">
      <div class="heading_container heading_center">
        <h2>
         Board
        </h2>
      </div>
     
<form method="post" action="${pageContext.request.contextPath}/FreeBoardList.do" id="freeBoardList">

	      <ul class="filters_menu">
	        <li class="active" data-filter="*">All</li>
	        <li data-filter=".free" id="freeBoardList">자유게시판</li>
	        <li data-filter=".review">식당 리뷰 게시판</li>
	        <li data-filter=".pasta">식당 게시판</li>
	        <li data-filter=".notice">공지사항</li>
	      </ul>

      <div class="filters-content">
        <div class="row grid">
        <c:forEach items="${list}" var="board">
          <div class="col-sm-6 col-lg-4 all ${board.boardType}">
            <div class="box">
              <div>
                <div class="img-box">
                  <img src="images/f1.png" alt="">
                </div>
                <div class="detail-box">
                  <h5>
                    <a href="#">${board.title}</a>
                  </h5>
                  <c:choose>
	                  <c:when test="${fn:length(board.content) >21}">
	                  	<p>${fn:substring(board.content,0,20) }...</p>
	                  </c:when>
	                  <c:otherwise>
	                  	<p>${board.content}</p>
	                  </c:otherwise>
	              </c:choose>
                   <pre style="color : white;">${board.member.nick}${board.registerDate}</pre>
                   <pre style="color : white;">${board.hits}</pre>
                </div>
              </div>
            </div>
          </div>
          </c:forEach>
        </div>
     </div>
     </form>
     <br>
     
     <!--  <form action="WriteBoardForm.do" method="post">-->
     <!--  <button type="button" onclick="location.href=WriteBoardForm.do" class="btn btn-primary" >글쓰기</button> -->
     <!-- <button class="btn btn-primary" type="button" onclick="location.href=WriteBoardForm.do">글쓰기</button> </form> -->
    
     <form action="WriteBoardForm.do" method="post">
     <button type="button" class="btn btn-primary">글쓰기</button> 
     </form>
    
    <ul class="pagination justify-content-center" style="margin:20px 0">
	<c:if test="${pagination.previousPageGroup}">
	<li class="page-item"><a class="page-link" href="BoardList.do?pageNo=${pagination.startPageOfPageGroup-1}">이전</a></li>
	</c:if>
	<c:forEach begin="${pagination.startPageOfPageGroup}" end="${pagination.endPageOfPageGroup}" var="page">
		<c:choose>
			<c:when test="${page==pagination.nowPage}">
				<li class="page-item active"><a class="page-link" href="BoardList.do?pageNo=${page}">${page}</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link" href="BoardList.do?pageNo=${page}">${page}</a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${pagination.nextPageGroup}">
  	<li class="page-item"><a class="page-link" href="BoardList.do?pageNo=${pagination.endPageOfPageGroup+1}">다음</a></li>
  	</c:if>
</ul>
</div>
  <!-- end food section -->

  <!-- footer section -->
  <c:import url="footer.jsp"/>
  <!-- footer section -->
</section>
  <script src="js/jquery-3.4.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
  </script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
  </script>
  <script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
  <script src="js/custom.js"></script>
</body>
</html>