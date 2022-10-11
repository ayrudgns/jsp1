<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록</title>
<style type="text/css">

td:nth-child(1) {
	text-align: center;
	font-weight: bold;
}

td:nth-child(2) {
	text-align: left;
}

</style>
</head>

<body>
<%@ include file="header.jsp" %>
	<section>
	<h3>홈쇼핑 회원 등록</h3>
	<form action="4save.jsp" method="post">
		<table>
			<tr>
			<td style="width: 40%;">회원번호 (자동발생)</td>
			<td><input type="number" name="custno" style="width: 50%"></td>
			</tr>
			<tr>
			<td>회원성명</td>
			<td><input name="custname" style="width: 50%"></td>
			</tr>
			<tr>
			<td>회원전화</td>
			<td><input name="phone" style="width: 70%"></td>
			</tr>
			<tr>
			<td>회원주소</td>
			<td><input name="address"></td>
			</tr>
			<tr>
			<td>가입일자</td>
			<td><input type="date" name="joindate" style="width: 50%"></td>
			</tr>
			<tr>
			<td>고객등급 [A:VIP, B:일반, C:직원]</td>
			<td><input name="grade" style="width: 50%"></td>
			</tr>
			<tr>
			<td>도시코드</td>
			<td><input name="city" style="width: 50%"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
				<button>등록</button>
				<button type="button" onclick="location.href='5memberList.jsp'">조회</button>				
				</td>
			</tr>			
		</table>
	
	</form>
		</section>
<%@ include file="footer.jsp" %>
</body>
</html>