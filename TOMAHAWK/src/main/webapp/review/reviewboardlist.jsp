<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>리뷰게시판</title>
</head>
<body>
<div class="page-wrapper" align="center">
    <div class="container-fluid">
        <div class="col-lg-12"><!--게시판 넓이 -->
            <div class="col-lg-12">
                <h1 class="page-header">리뷰게시판</h1>
            </div>
            <div class="row">
                  <div class="col-lg-12">
                  <form action="${pageContext.request.contextPath}/WriteReviewForm.do" id="writeReviewBoard">
                      <button type="button" class="btn btn-outline btn-primary pull-right" onclick="writeReview()">
                          <i class="fa fa-edit fa-fw"></i> 글쓰기
                      </button>
                  </form>
                  </div>
              </div>
            <div class="panel panel-default">
                <div class="panel-heading">리뷰게시판 </div>
                <div class="panel-body">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                                <th>조회수</th>
                            </tr>
                        </thead>
                        <tbody>
                         <c:forEach items="${list}" var="list">
                            <tr>
                                <td>
                                <a href="${pageContext.request.contextPath}/ReadReviewBoard.do?no=${list.boardNo}">${list.title}</a>
                                </td>
                                <td>${list.member.nick}</td>
                                <td>${list.registerDate}</td>
                                <td>${list.hits}</td>
                            </tr>
                         </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
	function writeReview(){
		document.getElementById('writeReviewBoard').submit();
	}

</script>


</body>
</html>