<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day2</title>
</head>

<body>
	<h3>사용자 입력 form으로 입력 파라미터 보내기</h3>
	<hr>
	<!-- form의 action 속성은 파라미터를 전달 받을 url -->
	<form action="4parameter.jsp">			<!-- 4parameter.jsp에서 파라미터 입력값을 처리 -->
		<!-- input의 name 속성값이 파라미터 이름이다. -->
		<input type="text" name="data1" placeholder="data1 입력">
		<input type="text" name="data2" placeholder="data2 입력">
		<input type="text" name="data3" placeholder="data3 입력">	
		<button>제출</button>
	</form>	
	<hr>
	<form action="4parameter.jsp">
		<input type="text" name="name" placeholder="이름을 입력하세요.">
		<input type="text" name="age" placeholder="나이을 입력하세요.">
		<input type="text" name="country" placeholder="국가를 입력하세요.">
		<button>제출</button>
	</form>
	
	<p><a href="Index.jsp">인덱스로 이동</a></p>
	
	
</body>
</html>