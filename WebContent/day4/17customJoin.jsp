<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록 페이지</title>

</head>

<body>
<!-- 회원 등록 페이지 -->
	<%@ include file="day4_header.jsp" %>
	
	<h3>회원 등록</h3>
	<form action="18save.jsp" method="post">
	<h5>모든 정보는 필수 입력 사항입니다.</h5>
		<input name="custom_id" placeholder="id를 입력하세요." required="required">
		<input name="name" placeholder="이름을 입력하세요." required="required">
		<input name="email" placeholder="email을 입력하세요."  required="required">
		<input type="number" name="age" placeholder="나이를 입력하세요." required="required">
		<button>회원 등록</button>
		<button type="reset">다시 쓰기</button>
	</form>		

</body>
</html>