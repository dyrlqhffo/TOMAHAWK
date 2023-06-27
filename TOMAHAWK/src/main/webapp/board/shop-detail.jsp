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
  <script src="js/jquery-3.4.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="js/bootstrap.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
  <script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
  <script src="js/custom.js"></script>
<title>title</title>
</head>
<body class="sub_page">
<div class="hero_area">
    <div class="bg-box">
      <!-- <img src="images/hero-bg.jpg" alt=""> -->
    </div>
	<%@ include file ="../header.jsp"%>
</div>
<div class="container pt-3">
<table class="table">
		<tr><td>식당이름 : ${shop.shopName}</td></tr>
		<tr><td>식당분류 : ${shop.shopType}</td></tr>
		<tr><td>식당주소 : ${shop.shopAddress}</td></tr>
		 <c:if test="${sessionScope.mvo.email == requestScope.shop.member.email }"> 
		<tr>
		<td colspan="5" class="text-center">								
			<button type="button" class="btn btn-success" onclick="deleteShop()">삭제</button>			
			<button type="button" class="btn btn-success" onclick="updateShop()">수정</button>	
			<form method="post" action="${pageContext.request.contextPath}/DeleteShop.shop" id="deleteShopForm">
				<input type="hidden" name="shopNo" value="${shop.shopNo}">
			</form>
			<form method="post" action="${pageContext.request.contextPath}/updateShopForm.shop" id="updateShopForm">
				<input type="hidden" name="shopNo" value="${shop.shopNo}">
			</form>
			<script type="text/javascript">
				function deleteShop() {
					if (confirm("삭제 하겠습니까?")) {
						document.getElementById("deleteShopForm").submit();
				    }
				}
				function updateShop() {
					if (confirm("수정 하겠습니까?")) {
						document.getElementById("updateShopForm").submit();
				    }
				}
			</script>					
		</td>
	</tr>
	</c:if>
</table>
<div class="comment-txt">
		<textarea id="commentContent" name="commentContent" placeholder="여러분의 소중한 댓글을 입력해주세요." rows="5" cols="50"></textarea>
</div>
<div class="comment-button">
평점 : <select style="width:50px;">
			<option>5</option>
			<option>4</option>
			<option>3</option>
			<option>2</option>
			<option>1</option>
		</select>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button id="cmtCnt-btn">댓글달기</button>
</div>
<script type="text/javascript">

</script>
</div>
</body>
</html>