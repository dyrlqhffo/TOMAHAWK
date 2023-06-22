<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/join/join.css">
<title>Insert title here</title>
</head>
<body>

<c:import url="../header.jsp"></c:import>

<c:if test="${mvo != null}">
 <form action = "${pageContext.request.contextPath}/UpdateMember.do" method="post">
        
        <!-- wrapper -->
        <div id="wrapper">

            <!-- content-->
            <div id="content">
			
                <!-- 아이디 -->
                <div>
                    <h3 class="join_title">
                        <label for="id">이메일</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" id="id" name="email" class="int" maxlength="30" value="${mvo.email}" readonly required>
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- 비밀번호 -->
                <div>
                    <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="password" id="pswd1" name="password" value="${mvo.password}" class="int" maxlength="20" required>
                        <span id="alertTxt">X</span>
                        <img src="${pageContext.request.contextPath}/images/m_icon_pass.png" id="pswd1_img1" class="pswdImg">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- 비밀번호 재확인 -->
                <div>
                    <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
                    <span class="box int_pass_check">
                        <input type="password" id="pswd2" class="int" maxlength="20" value="${mvo.password}" placeholder="동일한 비밀번호를 입력해주세요."required>
                        <img src="${pageContext.request.contextPath}/images/m_icon_check_disable.png" id="pswd2_img1" class="pswdImg">
                    </span>
                    <span class="error_next_box"></span>
                </div>


                
                <!-- 이름 -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" id="name" name="name" class="int" value="${mvo.name}" readonly maxlength="20" required>
                    </span>
                    <span class="error_next_box"></span>
                </div>
               
                <!-- 주소 -->
                <div>
                    <h3 class="join_title"><label for="nickname">닉네임</label></h3>
                    <span class="box int_nickname">
                        <input type="text" id="nickname" name="nickname" value="${mvo.nick}" class="int" maxlength="10" required>
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- 휴대전화 -->
                <div>
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="tel" id="mobile" name="phone_num" value="${mvo.tel}" class="int" maxlength="16" required>
                    </span>
                    <span class="error_next_box"></span>    
                </div>
                

                <!-- 가입하기 -->
				<div class="btn_area">
                    <input type="submit" id="btnJoin" value="수정하기">                 
                </div>

            </div> 
            <!-- content-->

        </div> 
        <!-- wrapper -->
</form>

</c:if>

<script src="${pageContext.request.contextPath}/join/join.js"></script>
</body>
</html>