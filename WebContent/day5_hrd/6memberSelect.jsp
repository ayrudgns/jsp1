<%@page import="hrd.vo.MemberVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록 조회 / 수정</title>
<style type="text/css">
td {
	text-align: center;
}
</style>
</head>


<body>
<%@ include file="header.jsp" %>
	<section>
	<h3>회원목록 조회 / 수정</h3>
	<table>
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>가입일자</th>
			<th>고객등급</th>
			<th>거주지역</th>
		</tr>
	<% 
		@SuppressWarnings("unchecked")
		List<MemberVo> mlist = (List<MemberVo>)request.getAttribute("mlist");
		for(MemberVo vo : mlist) {
	%>	
		<tr>
			<td><a href="9memberUpdate.jsp?custno=<%= vo.getCustno() %>"><%= vo.getCustno() %></a></td>
			<td><%= vo.getCustname() %></td>
			<td><%= vo.getPhone() %></td>
			<td><%= vo.getAddress() %></td>
			<td><%= vo.getJoindate() %></td>
			<td><%= vo.getGrade() %></td>
			<td><%= vo.getCity() %></td>
		</tr>
	<%
		}
	%>	
	</table>
	</section>
	
<%@ include file="footer.jsp" %>
</body>
</html>