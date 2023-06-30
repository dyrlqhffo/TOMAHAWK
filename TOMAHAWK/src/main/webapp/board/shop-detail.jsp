<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- <link rel="stylesheet" type="text/css" href="css/bootstrap.css" /> -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
  <link href="css/font-awesome.min.css" rel="stylesheet" />
  <link href="css/style.css" rel="stylesheet" />
  <link href="css/responsive.css" rel="stylesheet" />
  <script src="js/jquery-3.4.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <!-- <script src="js/bootstrap.js"></script> -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
  <script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
  <script src="js/custom.js"></script>
  <link rel="icon" href="images/favicon1.png">
<title>title</title>
</head>
<body class="sub_page">
<div class="hero_area">
    <div class="bg-box">
      <!-- <img src="images/hero-bg.jpg" alt=""> -->
    </div>
	<c:import url="../header.jsp"/>
</div>
<div class="container pt-3">
<input type="hidden" id="email" name="email" value="${mvo.email }">
<input type="hidden" name="shopNo" id="shopNo" value="${shop.shopNo}">
<table class="table">
		<tr>
			<td>식당이름 : ${shop.shopName}</td>
			<td>
				<input type="hidden" name="shopNo" value="${shop.shopNo}">
				<button type="button" class="btn btn-success" id="BookClick"><span id = "book"></span></button>
			</td>
		</tr>
		<tr><td>식당분류 : ${shop.shopType}</td></tr>
		<tr><td>식당주소 : ${shop.shopAddress}</td></tr>
		
		 <c:if test="${sessionScope.mvo.email == requestScope.shop.member.email }"> 
		<tr>
		<td colspan="5" class="text-center">						
			<button type="button" class="btn btn-success" onclick="deleteShop()">삭제</button>			
			<button type="button" class="btn btn-success" onclick="updateShop()">수정</button>
			<input type="hidden" id="email" name="email" value="${mvo.email }">
			<input type="hidden" name="shopNo" id="shopNo" value="${shop.shopNo}">
			
			<form method="post" action="${pageContext.request.contextPath}/DeleteShop.do" id="deleteShopForm">
				<input type="hidden" name="shopNo" id="shopNo" value="${shop.shopNo}">
			</form>
			<form method="post" action="${pageContext.request.contextPath}/updateShopForm.do" id="updateShopForm">
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
<div>
</div>
<script type="text/javascript">
$(function () {
	let email = document.getElementById("email");
	let shopNo = document.getElementById("shopNo");
	$("#BookClick").click(function() {
		$.ajax({
			type:"get",
			url : "${pageContext.request.contextPath}/CheckBookmark.do",
			data: "email="+email.value+"&shopNo="+shopNo.value,
			async : false,
			success:function(result){
				if(result == "ok"){
					$.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/SetBookmark.do",
						data : "shopNo="+shopNo.value,
						success : function(result1) {
							alert("북마크가 설정되었습니다.");
							$("#book").text("북마크 해제");
							$("#BookClick").attr("class","btn btn-danger");
						}
					})
				}else if(result == "fail"){
					$.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/DeleteBookmark.do",
						data : "shopNo="+shopNo.value,
						success : function(result2) {
							alert("북마크가 해제되었습니다.");
							$("#book").text("북마크 설정");
							$("#BookClick").attr("class","btn btn-success");
						}
					})
				}
			}
		})
	})
$("#book").load("${pageContext.request.contextPath}/CheckBookmark.do?email="+email.value+"&shopNo="+shopNo.value , function (data){
	if(data=="ok"){
		$("#book").text("북마크 설정");
	}else if(data=="fail"){
		$("#book").text("북마크 해제");
		$("#BookClick").attr("class","btn btn-danger");
	}
})
});
</script>
</div>
</body>
</html>