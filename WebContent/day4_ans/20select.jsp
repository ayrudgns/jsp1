<%@page import="vo.CustomVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	td,th{
		border : 1px solid gray;
		padding : 10px;
	}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<h3>회원목록 및 정보수정</h3>
<table style="width:700px;">
	<tr>
		<th>고객아이디</th>
		<th>이름</th>
		<th>이메일</th>
		<th>나이</th>
		<th>등록 날짜</th>
	</tr>
	<%
		@SuppressWarnings("unchecked")
		List<CustomVo> list = (List<CustomVo>)request.getAttribute("list");
		for(CustomVo vo : list) {
	%>
		<tr>
<%-- 			<td><%= vo.getCustom_id() %></td> --%>
			<!-- 고객아이디를 클릭하면 새로운 url로 요청을 보냅니다. 이때 id 라는 파리미터로 custom_id 필드값을 전달합니다.  -->
			<td><a href="21customUpdate.jsp?id=<%= vo.getCustom_id() %>"><%= vo.getCustom_id() %></a></td>
			<td><%= vo.getName()%></td>
			<td><%= vo.getEmail()%></td>
			<td><%= vo.getAge()%></td>
			<td><%= vo.getReg_date()%></td>
		</tr>
	<%
		}
	%>
	
</table>
</body>
</html>