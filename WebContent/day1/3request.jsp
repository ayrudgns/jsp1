<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day2_맛보기</title>
</head>


<body>
<h3>request 객체</h3>
<p>request 객체로 얻을 수 있는 정보는 무엇인지 확인하기</p>
<hr>
<ul>
	<!-- http://localhost:8082/ 까지는 URL의 루트 -->
	<!-- UR은 Uniform Resource -->
	<li>요청 URL : <%= request.getRequestURL() %></li>
	<!-- L은 Locator의 약자 -->
	<!-- http://localhost:8082/jsp1/day1/3request.jsp -->
	
	<li>요청 URI : <%= request.getRequestURI() %></li>
	<!-- I는 Identifier의 약자 -->
	<!-- /jsp1/day1/3request.jsp -->
	
	<li>context(컨텍스트) : <%= request.getContextPath() %></li>
	<!-- /jsp1 -->
	
	<li><a href="1start.jsp">1start.jsp로 이동 1</a></li>
	<li><a href="http://localhost:8082/jsp1/day1/1start.jsp">1start.jsp로 이동 2</a></li>
				<!-- /day1 폴더는 컨텍스트의 하위 폴더 -->
				<!-- 폴더가 동일한 경우, http://localhost:8082/jsp1/day1/를 생략하고 href를 작성한다. -->
				
	<li><a href="../test.jsp">test.jsp로 가기 1 (상대)</a></li>	<!-- 상대경로 -->
	<li><a href="http://localhost:8082/jsp1/test.jsp">test.jsp로 가기 2 (절대)</a></li>	<!-- 절대경로 -->
	<!-- 소스가 많아지면 아래와 같이 쓰는 것이 편하다. -->
	<li><a href="<%= request.getContextPath() %>/test.jsp">test.jsp로 가기 3</a></li>	<!-- 절대경로를 사용하는 방법 -->
	
	
</ul>
</body>
</html>