<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link href="css/style.css" rel="stylesheet" />
<link href="css/responsive.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/jquery.nice-select.js"></script>
<link href="${pageContext.request.contextPath}/css/write-form.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/nice-select.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<style type="text/css">
 body {
    background: #f5f6f7;
    padding-bottom: 100px; /* Adjust as needed */
}
</style>
<link rel="icon" href="images/favicon1.png">
<title>식당게시판 글작성</title>
</head>
<body>
<br>
<fieldset>
	<div class="container pt-3 col-md-7 grid-margin stretch-card">
	<div class="d-flex justify-content-end">
	<a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/images/homecon2.png"></a>&nbsp;&nbsp;&nbsp;
	<a href="${pageContext.request.contextPath}/UpdateMemberForm.do"><img src="${pageContext.request.contextPath}/images/user1.png"></a>&nbsp;&nbsp;&nbsp;
    <a href="${pageContext.request.contextPath}/BookmarkList.do"><img src="${pageContext.request.contextPath}/images/bookmark1.png"></a>&nbsp;&nbsp;&nbsp;
    <a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/images/searchcon2.png"></a>
	</div><br>
              <div class="card">
                <div class="card-body">
                  <h1 class="card-title"><span style='font-size:100px;'>&#128221;</span>식당게시판 글쓰기</h1>
                  <hr style="border-top: 3px solid gray"> 
                  <div class="alert alert-warning" role="alert">
                    아래의 입력란을 채워주세요.
                  </div><br>
                  <form class="forms-sample" method="post" action="${pageContext.request.contextPath}/WriteShop.do">
                  <input type="hidden" name="email" value="${sessionScope.mvo.email }">
                    <div class="form-group row">
                      <label for="title" class="col-sm-3 col-form-label"><strong>&#128204;식당 이름</strong></label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="shopName" name="shopName" placeholder="이곳에 식당명을 입력해주세요." required="required">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="nick" class="col-sm-3 col-form-label"><strong>&#128587;식당 분류</strong></label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" name="shopType" placeholder="이곳에 식당 분류를 입력해주세요." required="required">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="nick" class="col-sm-3 col-form-label"><strong>&#128587;식당 주소</strong></label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" name="shopAddress" placeholder="이곳에 식당 주소를 입력해주세요." required="required">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="exampleInputEmail2" class="col-sm-3 col-form-label"><strong>&#128203;식당정보</strong></label>
                      <div class="col-sm-9">
					  <textarea id="summernote" rows="10" class="form-control" name="shopImg" placeholder="본문내용" required="required" readonly="readonly"></textarea>
							<script>
							  $('#summernote').summernote({
								placeholder: '이곳에 사진을 넣어주세요.',
								tabsize: 2,
								height: 0,
								textbox : false,
								    toolbar : [['insert',['picture']]]
							  });
							 $(function() {
								$(".note-editable").prop("contenteditable",false);
							})
						    </script>
                      </div>
                    </div>
					<div class="text-center">
			  			<button type="button" onclick="addShop()" class="btn btn-primary">완료</button>
						<button type="button" onclick="location.href='${pageContext.request.contextPath}/index.jsp'" class="btn btn-outline-secondary">취소</button>			
					</div>
                  </form>
                </div>
              </div>
            </div>
</fieldset>

<script type="text/javascript">
	function addShop() {
	    if(confirm("게시물을 업로드 하시겠습니까?")){
	        document.forms[0].submit();
	    }
	}

	$(document).ready(function() {
	    $('select').niceSelect();
	    //$('.nice-select .list').niceScroll();
	  });
</script>
</body>
</html>