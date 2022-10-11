<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day2</title>
</head>

<body>
	<h3>요청 URL의 입력 파라미터 가져오기</h3>
	<hr>
	<p>
		쿼리 스트링 : 요청 URL?파라미터 이름1=값1&amp;파라미터 이름2=값2&amp; ... 에서 ? 뒤 입력 파라미터들이 연결된 문자열<br>
			- 서버가 처리할 입력 파라미터 값들은 request 객체에 저장되어 전달된다.<br>
			- 파라미터를 가져오는 메소드는 .getParameter("파라미터 이름")<br>
		(예시) http://localhost:8082/jsp1/day2/4parameter.jsp?data1=나나&amp;data2=123&amp;data3=hong
	</p>
	
	<ul>
		<li>data1 파라미터 : <%= request.getParameter("data1") %></li>
		<li>data2 파라미터 : <%= request.getParameter("data2") %></li>
		<li>data3 파라미터 : <%= request.getParameter("data3") %></li>
	</ul>
	
	<p>(예시) http://localhost:8082/jsp1/day2/4parameter.jsp?name=나나&amp;age=23&amp;country=korea</p>
	
	<ul>
		<li>name : <%= request.getParameter("name") %></li>
		<li>age : <%= request.getParameter("age") %></li>
		<li>country : <%= request.getParameter("country") %></li>
		<!-- url에 없는 입력 파라미터 가져오기 : null 출력됨 -->
		<li>address : <%= request.getParameter("address") %></li>
	</ul>

<!-- 특수문자 코드 : &nbsp; &lt; &gt; &amp; &quot; &copy; 외워서 사용합시다! -->

	<p><a href="Index.jsp">인덱스로 이동</a></p>

</body>
</html>