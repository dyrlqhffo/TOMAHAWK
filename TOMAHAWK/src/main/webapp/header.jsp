<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<style type="text/css">@import url("${pageContext.request.contextPath }/login/login_style.css");</style>

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<style type="text/css">
	@font-face {
	    font-family: 'SUIT-Medium';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Medium.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
	}
	
	@font-face {
    font-family: 'SUIT-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Bold.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
	}  

	.navbar-brand{
		margin-left: 4%;
	}
	
	.navbar-expand-lg .navbar-collapse{
		justify-content: end;
		margin-right: 70px;
	}
	
	.bg{
		background-color: rgba(255, 255, 255, 0.75);
		box-shadow: 0 2px 5px 0 rgb(0 0 0 / 5%), 0 2px 10px 0 rgb(0 0 0 / 5%);
		-webkit-box-shadow: 0 2px 5px 0 rgb(0 0 0 / 5%), 0 2px 10px 0 rgb(0 0 0 / 5%);
	}
	
	.navbar-light .navbar-nav .nav-link{
		font-family: 'SUIT-Medium';
		font-size: 1.1rem;
		color: black;
		letter-spacing: 2px;
		border: none;
    	background-color: transparent;
	}
	
	.navbar-light .navbar-nav .active>.nav-link, .navbar-light .navbar-nav .nav-link.active, .navbar-light .navbar-nav .nav-link.show, .navbar-light .navbar-nav .show>.nav-lin,navbar-collapse{
		color: white;
	}
	.navbar-light .navbar-nav .active>.nav-link{
		color: black;
	}
	
	.nav-link{
		margin-left: 15px;
		letter-spacing: 2px;
		color:  #ffbe33;
	}
	
	.nav-link a{
		color: white;
	}
	
	.logo-text{
		font-size: 1.05rem;
		color: black;
		font-family: 'SUIT-Bold';
		letter-spacing: 2px;
	}
	
	.dropdown-item{
		font-family: 'SUIT-Medium';
		font-size: 1.1rem;
		color: #545454 !important;
		letter-spacing: 2px;
	}
	
	.dropdown-menu a:hover{
      text-decoration:none;
      font-weight:bold;
   }
   
   .modal{
		background-color: transparent;
	}
	
	/* dropdown */
	.dropdown-content{
		z-index: 1;
		display: none;
   		position: fixed;
	}
	
	.dropdown-content a {
		z-index: 1;
	    color: #545454;
	    padding: 12px 16px;
	    text-decoration: none;
	    display: block;
	    background-color: #f9f9f9;
	    font-family: 'SUIT-Medium';
	    min-width: 130px;
	    text-align: center;
	}
	
	.dropdown-content a:hover {
		background-color: #f1f1f1;
		text-decoration: none;
		font-weight:bold;
		color: #545454;
	}
	
	.show {display:block;}
	
	#lnb.fixed{
	position: fixed; left: 0; top: 0; width: 100%;
	}
</style>
<link rel="icon" href="images/favicon1.png">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg" id="lnb">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/">
	  		<img src="${pageContext.request.contextPath }/images/navLogo.png" style="filter: invert(0);">
	  		<span class="logo-text">TOMAHAWK</span>
	  	</a>
	  	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
	    	<span class="navbar-toggler-icon"></span>
	  	</button>
	  	<div class="collapse navbar-collapse" id="navbarNavDropdown">
	    	<ul class="navbar-nav">
	    		<!-- 사용자가 로그인 상태인 경우 -->
	      		<c:if test="${sessionScope.mvo != null }">
	      		<li class="nav-item active"> 
	        		<a class="nav-link" href="javascript:void(0)" onclick="javascript:sendBoard()"><strong>자유 게시판</strong><span class="sr-only">(current)</span></a>
	      		</li>
	      		<li class="nav-item active">
	        		<a class="nav-link" href="javascript:void(0)" onclick="javascript:sendShop()"><strong>식당 게시판</strong><span class="sr-only">(current)</span></a>
	      		</li>
	      		<li class="nav-item active">
	        		<a class="nav-link" href="javascript:void(0)" onclick="javascript:sendReview()"><strong>리뷰 게시판</strong><span class="sr-only">(current)</span></a>
	      		</li>
	      		<li class="nav-item active">
	        		 <a class="nav-link" href="javascript:void(0)" onclick="javascript:sendNotice()"><strong>공지사항</strong><span class="sr-only">(current)</span></a>
	      		</li>
	      		</c:if>
	      		
	      		<c:choose>
	      			<c:when test="${sessionScope.mvo != null}">
	      			<!-- 사용자가 로그인 상태인 경우 -->
						<li class="nav-item">
			        		<button onclick="myFunction()" class="nav-link dropdown-toggle" href="#"><strong>${sessionScope.mvo.nick}님</strong> </button>
			        		<div id="myDropdown" class="dropdown-content">
							    <a href="${pageContext.request.contextPath }/UpdateMemberForm.do">회원정보 조회/수정</a>
							    <a href="${pageContext.request.contextPath }/UpdatePasswordForm.do">비밀번호 수정</a>
							    <a href="${pageContext.request.contextPath }/BookmarkList.do">북마크</a>
							 </div>
			      		</li>
	      			</c:when>
	      			
	      			<c:otherwise>
	      			<!-- 사용자가 로그인 상태가 아닌 경우 -->
			      		<li class="nav-item">
							<!-- 로그인 모달창 -->
							<!-- Modal -->
							<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog modal-dialog-centered">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel"></h5>
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							          <span aria-hidden="true">&times;</span>
							        </button>
							      </div>
							      <!-- 로그인 -->
							      <div class="modal-body">
							        <div class="login_content">
										<div class="signIn">
											<div class="signIn_form">
											
												<!-- 로그인 윗부분 -->
												<div class="signForm_top">
													<div class="signIn_header">
														<img src="${pageContext.request.contextPath }/images/logo1.png">
													</div>
												</div>
												
												<!-- 로그인 입력 부분 -->
												<div class="signForm_middle">
													<form action="${pageContext.request.contextPath }/Login.do" method="post" id="loginForm">
														<p class="titleText">이메일</p>
														<div class="inputText">
															<input id="signForm_email" placeholder="이메일을 입력해 주세요." type="email" name="email">
															<p class="error-message_email"></p>
														</div>
														
														<p class="titleText">비밀번호</p>
														<div class="inputText">
															<input id="signForm_pw" placeholder="비밀번호를 입력해 주세요." type="password" autocomplete="current-password" name="password">
															<p class="error-message_pw"></p>
														</div>
														<input type="submit" autocomplete="off" style="display: none;">
													</form>
													
													<div class="signForm_submit">
														<button type="submit" id="signForm_login" class="login_button" form="loginForm">
															<span class="login_submit_text"><b>로그인</b></span>
														</button>
													</div>
												</div>
												<!-- 비밀번호 찾기, 회원가입 -->
												<p class="signForm_bottom">
													<span class="find-pw">
														<a href="${pageContext.request.contextPath }/login/find_pw.jsp">비밀번호 찾기</a>
													</span> 
													<span class="bottom_side">&#124</span>
													<span class="signUp-btn">
														<a href="${pageContext.request.contextPath }/join/join.jsp">회원가입</a>
													</span>
												</p>
											</div>
										</div>
									</div>
							      </div>
							    </div>
							  </div>
							</div>
					      </li>
		      		</c:otherwise>
	      		</c:choose>
	    	</ul>
	  	</div>
	  	<div class="user_option">
              <a href="${pageContext.request.contextPath}/UpdateMemberForm.do"><img src="${pageContext.request.contextPath}/images/user1.png"></a>
              <a href="${pageContext.request.contextPath}/BookmarkList.do"><img src="${pageContext.request.contextPath}/images/bookmark1.png"></a>
              <a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/images/searchcon2.png"></a>
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               
               <c:choose>
					<c:when test="${sessionScope.mvo != null }">
               		<!-- 사용자가 로그인 상태인 경우, 로그아웃 버튼 표시 -->
						<form action="Logout.do" method="post">
		                <button type="submit" class="nav-link order_online">로그아웃</button>
		                </form>
              		</c:when>
              		<c:otherwise>
               		<!-- 사용자가 로그인 상태가 아닌 경우, 로그인 버튼 표시 -->
              			<button type="button" class="nav-link order_online" data-toggle="modal" data-target="#exampleModal">로그인</button>
              		</c:otherwise>
              	</c:choose>
        </div>
	</nav>
	
	<script>
		// 이메일 형식 검사
		$(document).ready(function(){
		    let id = document.querySelector('#signForm_email');
		    let error = document.querySelector('.error-message_email');
		    id.addEventListener("focusout", checkId);
		    function checkId(){
		    	let idPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/
		        if(!idPattern.test(id.value)){	//정규표현식을 통과하지 못한다면
		        	error.innerHTML = "올바른 이메일 형식이 아닙니다. 다시 입력해 주세요.";
		        	error.style.display = "block";
		        } else{
		        	error.innerHTML = "";
		        }
	    	}
		});
		
		// 비밀번호 체크
		$(document).ready(function(){
		    let pw = document.querySelector('#signForm_pw');
		    let error = document.querySelector('.error-message_pw');
		    pw.addEventListener("focusout", checkPw);
		    function checkPw(){
		        if(pw.value == ""){	//정규표현식을 통과하지 못한다면
		        	error.innerHTML = "비밀번호를 입력해 주세요.";
		        	error.style.display = "block";
		        } else{
		        	error.innerHTML = "";
		        }
	    	}
		});
		
		// 로그인 후 드롭 네비바
		function myFunction() {
		    document.getElementById("myDropdown").classList.toggle("show");
		}

		window.onclick = function(event) {
		  if (!event.target.matches('.dropdown-toggle')) {
		    let dropdowns = document.getElementsByClassName("dropdown-content");
		    let i;
		    for (i = 0; i < dropdowns.length; i++) {
		      let openDropdown = dropdowns[i];
		      if (openDropdown.classList.contains('show')) {
		        openDropdown.classList.remove('show');
		      }
		    }
		  }
		}
		function sendBoard(){
		    let f = document.createElement('form');
		    f.setAttribute('method', 'post');
		    f.setAttribute('action', '${pageContext.request.contextPath}/FreeBoardList.do');
		    document.body.appendChild(f);
		    f.submit();
		}
		function sendShop(){
		    let f = document.createElement('form');
		    f.setAttribute('method', 'post');
		    f.setAttribute('action', '${pageContext.request.contextPath}/FindShopList.do');
		    document.body.appendChild(f);
		    f.submit();
		}
		function sendReview(){
			 let f = document.createElement('form');
			 f.setAttribute('method', 'post');
			 f.setAttribute('action', '${pageContext.request.contextPath}/ReviewBoardList.do');
			 document.body.appendChild(f);
			 f.submit();
		}
		
		function sendNotice(){
          let f = document.createElement('form');
          f.setAttribute('method', 'post');
          f.setAttribute('action', '${pageContext.request.contextPath}/NoticeBoardList.do');
          document.body.appendChild(f);
          f.submit();
      }
	</script>
	<!-- 부트스트랩 -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="http://code.jquery.com/jquery.min.js"></script>
</body>
</html>