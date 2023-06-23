<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html lang="lo">
    <head>
        <meta charset="UTF-8">
        <title>정보 수정</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath }/join/join.css">
    </head>
    <body>


        <!-- wrapper -->
        <div id="wrapper">

            <!-- content-->
            <div id="content">
        <form action = "${pageContext.request.contextPath }/Update.do" method="post">
        <!-- header -->
        <div id="header">
            <img src="${pageContext.request.contextPath }/images/logo.png" >
        </div>
                <!-- 이메일 -->
                <div>
                    <h3 class="join_title">
                        <label for="id">이메일</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" id="id" name="email" class="int" required="required" value="${sessionScope.mvo.email }" readonly="readonly">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- 이름 -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" id="name" name="name" class="int" maxlength="20" placeholder="이름을 입력해주세요."required="required" value="${sessionScope.mvo.name }">
                    </span>
                    <span class="error_next_box"></span>
                </div>
                
               <!-- 닉네임 -->
                <div>
                    <h3 class="join_title"><label for="nick">닉네임</label></h3>
                    <span class="box int_nick">
                        <input type="text" id="nick" name="nick" class="int" maxlength="20" placeholder="닉네임을 입력해주세요."required="required" value="${sessionScope.mvo.nick }">
                    </span>
                    <span class="error_next_box"></span>
                </div>
                
                <!-- 휴대전화 -->
                <div>
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="tel" id="mobile" name="phone_num" class="int" maxlength="16" placeholder="전화번호를 입력해 주세요."required="required" value="${sessionScope.mvo.tel }">
                    </span>
                    <span class="error_next_box"></span>    
                </div>
                

                <!-- 수정하기 -->
				<div class="btn_area">
                    <input type="submit" id="btnJoin" value="수정하기">                 
                </div>
                </form>
                <form action="${pageContext.request.contextPath }/DeleteMember.do" method="post">
            	<script src="${pageContext.request.contextPath }/join/join.js"></script>
					<div class="btndel_area">
						<input type="hidden" name="email" id="email" value="${sessionScope.mvo.email }">
	                    <input type="submit" id="btnDelete" value="탈퇴하기">
	                </div>
     			</form>
                </div> 
            <!-- content-->
        </div> 
				
    			<!-- 탈퇴하기 -->
    			
            
</body>
</html>