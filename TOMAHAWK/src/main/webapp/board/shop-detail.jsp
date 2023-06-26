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
		<tr><td>작성식당 : ${shop.member.nick}</td></tr>
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