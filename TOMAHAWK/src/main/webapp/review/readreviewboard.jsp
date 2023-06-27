<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>

<style type="text/css">
.reply{
	width: 100%;
	border: 0.5px solid #cccccc20; 
	border-spacing: none;
	font-size: 16px;
	font-weight: 300;
}
.reply tr:first-child{
	text-align: center;
} 
.reply tr {
  border-bottom: 0.5px solid #cccccc20; 
  line-height: 20px;
}
.reply tr > td{
	padding: 10px;
}
.reply tr > td:first-child {
 width: 75%;
}
.reply tr > td:nth-child(2) {
 width: 15%;
 text-align: center;
}
.reply tr > td:nth-child(3) {
  width:10%;
  text-align: center;
}
.board-contents{
	border: 1px solid #EFF5FF;
}
.board-contents tr > td{
	padding-bottom: 5px;
}
</style>
</head>
<body>

	<div class="container-wapper" style="margin-bottom: 100px;" align="center">
		<div class="container"></div>
			<section class="notice">

				<!-- 게시글 -->
				<div class="container" style="margin-bottom: 20px;">
					<table class="board-contents" style="width: 100%;">
					<c:if test="${not empty board}">
						<tr style="font-size: 24px;">
							<td colspan="8" style="padding-left: 20px; font-weight: 600; padding-top: 30px; color: #2d65f2;">${board.title}</td>
						</tr>
							
						<tr style="color: #767676; font-size: 14px;  border-bottom: 1px solid #EFF5FF;">
							<td style="width: 5%; ">유형</td>
							<td style="width: 5%;">${board.boardType}</td>
							<td style="width: 5%;"></td>
							<td style="width: 30%;"></td>
							<td style="width: 5%; ">작성자</td>
							<td style="width: 15%;">${board.member.nick}</td>
							<td style="width: 5%; ">조회수</td>
							<td style="width: 5%;">${board.hits}</td>
							<td style="width: 7%; ">작성일자</td>
							<td style="width: 8%;">${board.registerDate}</td>
							<c:if test="${not empty board.editDate}">
							<td style="width: 7%">수정일자</td>
							<td style="width: 7%">${board.editDate}</td>
						    </c:if>
							<c:if test="${board.member.nick == mvo.nick}">
							<td><a href="javascript:updateReview()">수정</a> </td>
							<form action="${pageContext.request.contextPath}/UpdateReviewBoardForm.do?no=${board.boardNo}" method="post" id="updateReview"></form>
							<td><a href="javascript:deleteReview()">삭제</a></td>
							<form action="${pageContext.request.contextPath}/DeleteReviewBoard.do?no=${board.boardNo}" method="post" id="deleteReview"></form>
							</c:if>
						</tr>
						<tr>
							<td colspan="8" style="padding: 50px;">
							${board.content}
							</td>
						</tr>
						</c:if>	
					</table>
					<button type="button" class="btn btn-success" id="reviewList" onclick="reviewList()">목록</button>
				</div>
		</section>
	</div>
	<%-- 
				<!-- 댓글등록 -->
				<div id="board-search">
					<div class="container">
						<div class="search-window" style="width: 100%; margin-bottom: 0px;">
							<form action="">
								<div class="search-wrap" style="width: 100%; max-width: 990px;">
									<input id="search" type="search" name=""
										placeholder="내용을 입력해주세요" value="" style="width: 100%;">
									<button type="submit" class="btn btn-dark">등록</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- 댓글목록 -->
				<div class="container">

				<div  class="reply-container"><!-- ajax영역 -->
					<table class="reply">
						<tr>	
							<td>내용</td>
							<td>작성자</td>
							<td>작성일자</td>	
						</tr>
						<tr>	
							<td>유익한내용이네요</td>
							<td>김코딩</td>
							<td>2023.03.30</td>	
						</tr>
					</table>
				</div>



				</div>
			</section>
		</div>
	</div>
	
	--%> 
	
<script>
	function updateReview(){
		document.getElementById('updateReview').submit();
	}
	
	function deleteReview(){
		if(confirm('삭제하시겠습니까?')){
			document.getElementById('deleteReview').submit();
		}
	}

	function reviewList(){
		location.href="${pageContext.request.contextPath}/ReviewBoardList.do";
	}


</script>	
	
	
</body>
</html>