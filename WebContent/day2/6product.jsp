<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Input</title>
</head>
<!-- form의 action 속성에 7save.jsp 주기 -->
<body>
	<%@ include file="header.jsp" %>
	
	
	<hr style="height: 5px; background-color: green;">

	<h3>상품 정보 입력하기</h3>
	<form action="7save.jsp" method="post">
	<!-- 중요! method="post" : 입력 파라미터를 url과 함께 전송하지 않고 request body에 저장한다. -->
	<!-- 지금처럼 insert, update에는 method를 post로 해야 한다! -->
	
	<!-- 중요! 기본값은 method="get" (조회) : 이 경우에는 입력 파라미터가 url에 전송되며, UTF-8로 기본 인코딩된다. -->
		<input type="text" name="pcode" placeholder="상품 코드 입력">
		<input type="text" name="category" placeholder="카테고리 입력">
		<input type="text" name="pname" placeholder="상품명 입력">
		<input type="number" name="price" placeholder="상품 가격 입력">
		<button>제출</button>	
	</form>
</body>
</html>