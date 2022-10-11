<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="day1.vo.MyUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day1</title>
</head>
<body>
<%
	/* 자바 코드 작성 (스크립트 릿) -> 톰캣 서버가 컴파일한다. */
	String[] names = {"사나", "나연", "다현", "모모", "쯔위"};
	MyUser user = new MyUser("세리박", 34, true);
	List<String> list = new ArrayList<>();
	list.add("사나");
	list.add("나연");
	list.add("다현");
	list.add("모모");
	list.add("쯔위");
	
	List<MyUser> users = new ArrayList<>();
	users.add(user);
	users.add(new MyUser("손흥민", 25, false));
	users.add(new MyUser("김병현", 39, true));
	users.add(new MyUser("지성박", 33, false));		// 형식 : <li>이름 세글자(나이), 참 또는 거짓</li>
	
	
%>
	<h4>for문으로 만든 리스트 1</h4>
		<!-- for문으로 test.jsp 파일처럼 만들기 -->
	<ul>
		<%
			for(int i = 0; i < names.length; i++) {		// 해당 for문은 태그로 대체될 수 있다.
														// 다만 라이브러리를 추가로 사용해야 한다.
 		%>
		<li>name : <%= names[i] %>
		<%		
			}
		%>
	</ul>
	
	<h4>향상된 for문으로 만드는 ArrayList 리스트 2</h4>
	
	<ul>
		<%
			for(String a : list) { 
		%>
<%-- 		<li> name : <% list.get(i) %></li> --%>			<!-- 스크립트 릿의 주석은 <%--  --%> -->
			<li>name : <%= a %></li>
		<%
			}
		%>
	</ul>
	
	<h4>for문으로 만드는 users 리스트 3</h4>
	<ul>
		<%
			for(int i = 0; i < users.size(); i++) {
		%>
			<li><%= users.get(i).getName() %>(<%= users.get(i).getAge() %>), <%= users.get(i).isEtc() %></li>
		<%
			}
		%>
		
	</ul>
	
	<h4>향상된 for문으로 만드는 users 리스트 3</h4>
	<ul>
		<%
			for(MyUser mu : users) {
		%>
			<li><%= mu.getName() %>(<%= mu.getAge() %>), <%= mu.isEtc() %></li>
		<%
			}
		%>
	</ul>
</body>
</html>