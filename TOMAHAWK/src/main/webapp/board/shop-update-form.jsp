<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>식당글쓰기</title>
</head>
<body class="sub_page">

<div class="hero_area">
    <div class="bg-box">
      <!-- <img src="images/hero-bg.jpg" alt=""> -->
    </div>
	<c:import url="../header.jsp"/>
</div>
<div class="container pt-3">
<form method="post" action="UpdateShop.do">
		<table class="table">
			<tr>
				<td>
				<input type="hidden" name="no" value="${shop.shopNo }">
				<input type="text" name="shopName" placeholder="식당이름"required="required" value="${shop.shopName }">
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="shopType" placeholder="식당분류" required="required" value="${shop.shopType }">
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="shopAddress" placeholder="식당주소" required="required" value="${shop.shopAddress }">
				</td>
			</tr>
		</table>
		<div class="text-center">
			<button type="submit" class="btn btn-success">수정</button>
			<button type="reset" class="btn btn-success">취소</button>
		</div>
	</form>
	</div>
	</body>
	</html>