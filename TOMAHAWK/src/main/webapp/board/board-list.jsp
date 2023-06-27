<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    
		<table class="table table-boarderd table-hover boardlist">
			<thead>
				<tr style="background-color: #ccffee">
					<th>번호</th>
					<th class="title">제목</th>
					<th>작성자</th>
					<th>내용</th>
					<th>작성일</th>
					<th>수정일</th>
					<th>조회</th>
					<th>타입</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="board">
				<tr>
					<td>${board.boardNo}</td>
					<td>
					<c:choose>
						<c:when test="${sessionScope.mvo==null}">
						${board.title}
						</c:when>
						<c:otherwise>
						<a href="${pageContext.request.contextPath}/NoticeDetail.do?no=${board.boardNo}">${board.title}</a>
						</c:otherwise>
					</c:choose>					
					</td>
					<td>${board.member.nick}</td>
					<td>${board.content}</td>
					<td>${board.registerDate}</td>
					<td>${board.editDate}</td>
					<td>${board.hits}</td>
					<td>${board.boardType}</td>
				</tr>
			</c:forEach>	
			</tbody>
		</table>
<!--
      pagination 
-->
<ul class="pagination justify-content-center" style="margin:20px 0">	
	<c:if test="${pagination.previousPageGroup}">
	<li class="page-item"><a class="page-link" href="NoticeBoardList.do?pageNo=${pagination.startPageOfPageGroup-1}">Previous</a></li>
	</c:if>
	<c:forEach begin="${pagination.startPageOfPageGroup}" 
	end="${pagination.endPageOfPageGroup}" var="page">
	<c:choose>
		<c:when test="${pagination.nowPage==page}">
		<li class="page-item active"><a class="page-link" href="NoticeBoardList.do?pageNo=${page}">${page}</a></li>
		</c:when>
		<c:otherwise>
		<li class="page-item"><a class="page-link" href="NoticeBoardList.do?pageNo=${page}">${page}</a></li>	
		</c:otherwise>
	</c:choose>	
	</c:forEach>		
	<c:if test="${pagination.nextPageGroup}">
  	<li class="page-item"><a class="page-link" href="NoticeBoardList.do?pageNo=${pagination.endPageOfPageGroup+1}">Next</a></li>   
  	</c:if>  
</ul>

















