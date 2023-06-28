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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/join/join.css">
<title>비밀번호 수정</title>
</head>
<body>
<div class="container pt-3">
	<form method="post" action="${pageContext.request.contextPath }/UpdatePassword.do">
<!--                 현재 비밀번호
                <div>
                    <h3 class="join_title"><label for="nowpswd">현재 비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="password" id="nowpswd" name="nowPassword" class="int" maxlength="20" placeholder="비밀번호를 입력해주세요."required="required">
                        <span id="alertTxt">X</span>
                    </span>
                    <span class="error_next_box"></span>
                </div> -->
                
                <!-- 비밀번호 -->
                <input type="hidden" name="email" value="${ sessionScope.mvo.email}">
                <input type="hidden" name="name"value="${ sessionScope.mvo.name}">
                <input type="hidden" name="nick"value="${ sessionScope.mvo.nick}">
                <input type="hidden" name="phone_num"value="${ sessionScope.mvo.tel}">
                <div>
                    <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="password" id="pswd1" name="password" class="int" maxlength="20" placeholder="비밀번호를 입력해주세요." required="required">
                        <span id="alertTxt">X</span>
                        <img src="${pageContext.request.contextPath }/images/m_icon_pass.png" id="pswd1_img1" class="pswdImg">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- 비밀번호 재확인 -->
                <div>
                    <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
                    <span class="box int_pass_check">
                        <input type="password" id="pswd2" class="int" maxlength="20" placeholder="동일한 비밀번호를 입력해주세요." required="required">
                        <img src="${pageContext.request.contextPath }/images/m_icon_check_disable.png" id="pswd2_img1" class="pswdImg">
                    </span>
                    <span class="error_next_box"></span>
                </div>
                
                <div class="btn_area">
                    <input type="submit" id="btnJoin" value="수정하기" onclick="confirmUpdatePassword(event)"><br><br>                 
                    <input type="submit" id="btnCancel" value="취소하기" onclick="location.href='${pageContext.request.contextPath}/index.jsp'">                 
                </div>
             </form>
	</div>
<script src="updatePassword.js"></script>
<script src="join.js"></script>
</body>
</html>