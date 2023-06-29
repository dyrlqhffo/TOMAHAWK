<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="비밀번호 찾기" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<link href="find_pw.css" rel="stylesheet" />
<a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/images/homecon2.png"></a>&nbsp;&nbsp;&nbsp;
<div class="login_content">
	<div class="signIn_form">
		<div class="signForm_top">
			<div class="signIn_header">
				<img src="${pageContext.request.contextPath }/images/logo.png" alt="로고">
			</div>
		</div>

		<div class="signForm_middle">
			<form name="form" action="${pageContext.request.contextPath }/FindPwSendEmail.do" method="post" onsubmit="checkForm(event)">
				<h1 style="font-family: 'SUIT-Bold'">비밀번호 찾기</h1>
				<h4>가입하실 때 작성한 회원정보를 입력해 주세요.</h4>
				<div class="inputEmail">
					<input type="text" name="email" id="email" class="form-control"
						placeholder="이메일을 입력해 주세요." style="background-color: white">
					<div>
						<span class="error_next_box"></span>
					</div>
				</div>
				<div class="inputName">
					<input type="text" name="name" id ="name" class="form-control"
						placeholder="이름을 입력해 주세요." style="background-color: white">
					<div>
						<span class="error_next_box"></span>
					</div>
				</div>
				<input type="submit" value="임시 비밀번호 발송" id="button_for_email" style="color: #2C952C;">
			</form>
		</div>
	</div>
</div>
<script src="find_pw.js"></script>