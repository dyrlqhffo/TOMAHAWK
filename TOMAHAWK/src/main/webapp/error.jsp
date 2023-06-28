<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style>
  html, body {
    margin: 0;
    padding: 0;
    height: 100%;
  }

  .image-container {
    display: flex;
    align-items: center;
    justify-content: center;
    height: calc(100% - 150px); /* 이미지 아래에 있는 글씨까지의 높이를 제외한 부분 */
  }

  .image-container img {
    max-width: 100%;
    max-height: 100%;
    object-fit: contain; /* 이미지 비율을 유지하면서 전체 화면에 맞추기 */
  }

  .error-message {
    text-align: center;
    margin-bottom: 30px;
  }

  .error-message p {
    margin: 0;
  }
</style>
</head>
<body>
<div class="error-message">
    <h1>404 - 페이지를 찾을 수 없습니다</h1>
  <p>죄송합니다. 요청하신 페이지를 찾을 수 없습니다.</p>
  <p>잠시후 홈으로 돌아갑니다.</p>
  <meta http-equiv="refresh" content="3;url=${pageContext.request.contextPath}/index.jsp">
</div>
<div class="image-container">
<img src="${pageContext.request.contextPath}/images/wow.gif" alt="Image">
</div>
</body>
</html>