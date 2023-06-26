<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form method="post" action="UpdateShop.shop">
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