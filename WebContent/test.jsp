<!-- jsp : java server(java 클래스) page, jsp 파일 설정의 내용 -->
<!-- 서버에서 실행할 코드는 java로 작성된다는 설정 내용이다. -->
<!-- 기존의 html에 java 코드를 더한다! -->

<%@page import="day1.vo.MyUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- window 메뉴 => preferences => web 항목에서 기본 인코딩 변경하기 -->
<!-- 주석은 ctrl + shift + / -->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	// 자바 코드를 작성 (스크립트 릿) => 톰캣 서버가 컴파일한다.
	String[] names = {"사나", "나연", "다현", "모모", "쯔위"};
	MyUser user = new MyUser("세리박", 34, true);
%>
<h3>첫번째 JSP</h3>
<hr>
<ul>
	<!-- 자바 변수값을 출력하기 위해서는 새로운 기호(표현식 기호) 를 써야 한다. -->
	<!-- 세미콜론을 넣으면 안된다! -->
	<li>리스트 1 : <%= names[0] %></li>
	<li>리스트 2 : <%= names[1] %></li>
	<li>리스트 3 : <%= names[2] %></li>
	<li>리스트 4 : <%= names[3] %></li>
</ul>
<ul>
	<li>리스트 1 : <%= user.getName() %></li>		
	<li>리스트 2 : <%= user.getAge() %></li>
	<li>리스트 3 : <%= user.isEtc() %></li>
</ul>
</body>
</html>