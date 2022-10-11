<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day4_custom</title>
</head>
<body>
<%@ include file="header.jsp" %>
<h3>회원 등록</h3>
<form action="18save.jsp" method="post">
	<input name="customid" placeholder="회원ID를 입력하세요." required>
	<input name="name" placeholder="회원이름을 입력하세요." required>
	<input type="email"   name="email" placeholder="이메일을 입력하세요." required>
	<input type="number"   name="age" placeholder="나이를 입력하세요." required>
	<button>등록</button>  	<button type="reset">다시쓰기</button>
</form>
</body>
</html>