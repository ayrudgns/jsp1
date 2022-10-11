<%@page import="hrd.vo.MemberVo"%>
<%@page import="hrd.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>

<body>
<%@ include file="header.jsp" %>

<%
	MemberDao dao = MemberDao.getInstance();
	MemberVo vo = dao.selectByCustno(
			Integer.parseInt(request.getParameter("custno")));
	
	if(vo != null) {
%>
	<section>
	<h3>홈쇼핑 회원 정보 수정</h3>
	<form action="10update.jsp" method="post">
		<table>
			<tr>
			<td>회원번호</td>
			<td><input value="<%= vo.getCustno() %>" type="number" name="custno" readonly></td>
			</tr>
			<tr>
			<td>회원성명</td>
			<td><input value="<%= vo.getCustname() %>" name="custname"></td>
			</tr>
			<tr>
			<td>회원전화</td>
			<td><input value="<%= vo.getPhone() %>" name="phone"></td>
			</tr>
			<tr>
			<td>회원주소</td>
			<td><input value="<%= vo.getAddress() %>" name="address"></td>
			</tr>
			<tr>
			<td>가입일자</td>
			<td><input value="<%= vo.getJoindate() %>" name="joindate"></td>
			</tr>
			<tr>
			<td>고객등급 [A:VIP, B:일반, C:직원]</td>
			<td><input value="<%= vo.getGrade() %>" name="grade"></td>
			</tr>
			<tr>
			<td>도시코드</td>
			<td><input value="<%= vo.getCity()%>" name="city"></td>
			</tr>
			<tr>
				<td colspan="2">
				<button>수정</button>
				<button type="button" onclick="location.href='5memberList.jsp'">조회</button>				
				</td>
			</tr>			
		</table>
	
	</form>
<%
	} else {
		out.print("<script>");
		out.print("alert('없는 회원번호입니다.')");
		out.print("history.back();");
		out.print("</script>");
	}
%>
	</section>
<%@ include file="footer.jsp" %>
</body>
</html>