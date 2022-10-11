<%@page import="hrd.vo.MoneyVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원매출조회</title>
</head>
<body>
<%@ include file="header.jsp" %>
	<section>
	<h3>회원 매출 조회</h3>
	<table>
	<tr>
		<th>회원번호</th>
		<th>회원성명</th>
		<th>고객등급</th>
		<th>매출</th>
	</tr>
<% 
	@SuppressWarnings("unchecked")
	List<MoneyVo> mnlist = (List<MoneyVo>)request.getAttribute("mnlist");
	for(MoneyVo vo : mnlist) {
%>	
	<tr>
		<td><%= vo.getCustno() %></td>
		<td><%= vo.getCustname() %></td>
		<td><%= vo.getGrade() %></td>
		<td><%= vo.getPricesum() %></td>
	</tr>
<%
	}
%>	
	</table>
	</section>	
<%@ include file="footer.jsp" %>
</body>
</html>