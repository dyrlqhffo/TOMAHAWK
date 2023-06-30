<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title> TomaHawk </title>
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
  <link href="css/font-awesome.min.css" rel="stylesheet" />
  <link href="css/style.css" rel="stylesheet" />
  <link href="css/searchbar.css" rel="stylesheet" />
  <link href="css/responsive.css" rel="stylesheet" />
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script src="js/jquery-3.4.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="js/bootstrap.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
  <script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
  <script src="js/custom.js"></script>
  <link rel="icon" href="images/favicon1.png">
</head>
<body>
<div class="hero_area">
    <div class="bg-box">
      <img src="images/bg1.jpg">
    </div>
<%@ include file ="header.jsp"%>
<br><br><br>

    <c:if test="${not empty message}">
      <script>
      swal('비로그인 상태!', "로그인 후 사용 가능합니다.",'warning')
      .then(function(){
      	location.href="index.jsp";                   
      })
      </script>
    </c:if>

<div class="container">
<div class="row">
    <div class="col-lg-12 card-margin">
        <div class="card search-form">
            <div class="card-body p-0">
                <form id="search-form" method="get" action="${pageContext.request.contextPath}/SearchBoard.do" onsubmit="return checkIfType()">
                    <div class="row">
                        <div class="col-12">
                            <div class="row no-gutters">
                                <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                                	<!-- [검색할 게시판의 종류를 선택하는 드롭다운 (select) 메뉴.] -->
									<select class="board-search" id="board-search" name="board-search">
                                        <option value="" selected disabled>-게시판 분류-</option>
                                        <option value="free">자유게시판</option>
                                        <option value="shop">식당게시판</option>
                                        <option value="review">리뷰게시판</option>
                                        <option value="notice">공지사항</option>
                                    </select>
                                </div>
                                <div class="col-lg-8 col-md-6 col-sm-12 p-0">
                                    <input type="text" placeholder="검색어를 입력해주세요..." class="board-search" id="search" name="search">
                                </div>
                                <div class="col-lg-1 col-md-3 col-sm-12 p-0">
                                    <button type="submit" class="btn btn-base">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</div>
<script>

//---[폼이 제출되기 전에 게시판 유형이 선택되었는지 확인하는 함수]---//
function checkIfType() {
    let boardSelection = document.getElementById('board-search').value;		// 드롭다운 메뉴에서 선택한 옵션의 값을 변수에 저장
    if (boardSelection === "") {		// 값이 빈 문자열인 경우, alert 함수로 경고 메시지를 표시
        swal('검색 오류!', "게시판 분류를 선택해주시기 바랍니다.",'warning')
            .then(function(){
                location.href="index.jsp";		// 경고 메시지가 표시되면 사용자가 이를 확인한 후, index.jsp로 되돌아가도록 경로 설정
        });
        return false;	// 게시판 분류가 선택되지 않았을 경우 폼의 제출을 막는 역할.
    }
    return true;			// 게시판 유형이 정상적으로 선택된 경우, 함수는 폼 제출을 진행하도록 허용.
}
</script>

    <section class="slider_section ">
      <div id="customCarousel1" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <div class="container ">
              <div class="row">
                <div class="col-md-7 col-lg-6 ">
                  <div class="detail-box">
                    <h1>
                      TOMAHAWK COMMUNITY
                    </h1>
                    <div style="border-radius:10px; background-color: rgba(255, 255, 255, 0.75); color:black; padding:10px;">
					  <p>
					  전세계의 맛집들을 직접 내돈내산을 한 유저들이 실시간 후기들을 보고
					  실패 할 수 없는 맛집을 경험하고 싶다면 우리 토마호크에 가입하세요.
					  </p>
					</div>
                    <div class="btn-box">
                      <a href="${pageContext.request.contextPath}/join/join.jsp" class="btn1">회원가입</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
 
      <div class="heading_container heading_center">
		<c:choose>
			<c:when test="${sessionScope.mvo == null}">
	  				<a href="${pageContext.request.contextPath}/index.jsp" onclick="notMemberAlert(event);"><img src="${pageContext.request.contextPath}/images/midBanner.png" align="middle"></a>
			</c:when>
			<c:otherwise>
	  				<a href="${pageContext.request.contextPath}/FindShopList.do"><img src="${pageContext.request.contextPath}/images/midBanner.png" align="middle"></a>
			</c:otherwise>
		</c:choose>
	</div>
  
  <!-- footer section -->
  <c:import url="footer.jsp"/>
  <!-- footer section -->
 <script type="text/javascript">
 function notMemberAlert(event) {
		event.preventDefault();
		swal('비로그인 상태!', "기능을 이용하려면 로그인해주시기 바랍니다.", 'warning')
			.then(function() {
				location.href = "index.jsp";
			});
	}
 </script>
</body>
</html>