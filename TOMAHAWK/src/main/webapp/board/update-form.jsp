<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/jquery.nice-select.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/nice-select.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<link rel="icon" href="images/favicon1.png">
<title>자유게시판 글 수정</title>
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
                  <h1 class="card-title"><span style='font-size:100px;'>&#128221;</span>자유게시판 글 수정하기</h1>
                  <hr style="border-top: 3px solid gray"> 
                  <div class="alert alert-warning" role="alert">
                    아래의 입력란을 채워주세요.
                  </div><br>
                  <form class="forms-sample" id="updateBoardForm" method="post" action="${pageContext.request.contextPath}/UpdateBoard.do">
                  	<input type="hidden" name="boardNo" value="${board.boardNo}">
                    <div class="form-group row">
                      <label for="title" class="col-sm-3 col-form-label"><strong>&#128204;글 제목</strong></label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="title" name="title" value="${board.title}" required="required">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="nick" class="col-sm-3 col-form-label"><strong>&#128587;작성자</strong></label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" name="nick" value="${mvo.nick}" readonly="readonly">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="exampleInputEmail2" class="col-sm-3 col-form-label"><strong>&#128194;게시판 분류</strong></label>
                      <div class="col-sm-9">
                        <select class="boardType" id="boardType" name="boardType">
			            	<option value="" selected disabled>-게시판 분류-</option>
					        <option value="free">자유게시판</option>
					        <option value="review">리뷰게시판</option>
					        <option value="shop">식당게시판</option>
					        <c:if test="${sessionScope.mvo.admin==2}">
					        	<option value="notice">공지사항</option>
					        </c:if>
					    </select>
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="exampleInputEmail2" class="col-sm-3 col-form-label"><strong>&#128203;본문내용</strong></label>
                      <div class="col-sm-9">
					  <textarea id="summernote" rows="10" class="form-control" name="content" placeholder="본문내용" required="required">${board.content}</textarea>
							<script>
							  $('#summernote').summernote({
								placeholder: '내용을 이곳에 작성해주세요.',
								tabsize: 2,
								height: 500
							  });
						    </script>
                      </div>
                    </div>
					<div class="text-center">
			  			<button type="button" onclick="updateBoard(event)" class="btn btn-primary">수정하기</button>
						<button type="submit" onclick="location.href='free-board-list.jsp'" class="btn btn-outline-secondary">취소하기</button>				
					</div>
                  </form>
                </div>
              </div>
            </div>
</fieldset>
<script type="text/javascript">

function updateBoard(event) {
    event.preventDefault();
    
    var boardType = document.getElementById("boardType").value;
    if(boardType == "") {
        swal({
            title: "게시판 분류!",
            text: "게시판 분류를 선택해주세요!",
            icon: "warning",
        });
        return;
    }
    
    swal({
        title: "게시글 수정!",
        text: "정말로 수정하시겠습니까?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    })
    .then((willUpdate) => {
        if (willUpdate) {
            document.forms[0].submit();
            swal("글이 성공적으로 수정되었습니다!", {
                icon: "success",
            });
        } else {
            swal("수정이 취소되었습니다!");
        }
    });
}

	/* function updateBoard() {
	    if(confirm("게시물을 수정 하시겠습니까?")){
	        document.forms[0].submit();
	    }
	} */
	
	$(document).ready(function() {
	    $('select').niceSelect();
	    //$('.nice-select .list').niceScroll();
	  });
</script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>
</html>