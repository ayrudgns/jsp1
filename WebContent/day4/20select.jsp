<%@page import="vo.CustomVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 조회 결과 출력</title>
</head>

<body>
	<%@ include file="day4_header.jsp" %>
	
	<!-- 테이블 목록 출력 -->
	<h3>회원 목록 조회 결과</h3>
	<h4>회원 ID를 클릭하여 정보를 수정합니다.</h4>
	<table>
		<tr>
			<th>회원 ID</th>
			<th>회원 NAME</th>
			<th>회원 EMAIL</th>
			<th>회원 AGE</th>
			<th>회원 REG_DATE</th>
		</tr>
		<%
			@SuppressWarnings("unchecked")
			List<CustomVo> clist = (List<CustomVo>)request.getAttribute("clist");
			for(CustomVo vo : clist) {
		%>
		<tr style="text-align: center;">
		<%-- 	<td><a href="21customUpdate.jsp" target="_blank"><%= vo.getCustom_id() %></a></td> --%>
			<td><a href="21customUpdate.jsp?id=<%= vo.getCustom_id() %>&name=<%= vo.getName() %>" target="_blank">
				<%= vo.getCustom_id() %></a></td>
			<td><%= vo.getName() %></td>
			<td><%= vo.getEmail() %></td>
			<td><%= vo.getAge() %></td>
			<td><%= vo.getReg_date() %></td>
		</tr>	
		<%
			}
		%>	
	</table>

</body>
</html>