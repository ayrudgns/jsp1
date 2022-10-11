<%@page import="vo.CustomVo"%>
<%@page import="dao.CustomDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 확인</title>
</head>

<body>
<!-- 회원정보 수정 확인 -->
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("custom_id");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	int age = Integer.parseInt(request.getParameter("age"));
	CustomDao cdao = CustomDao.getInstance();
	String msg = "";
	String target = "";

	try {
		if (cdao.selectById(id) == null) {
			throw new Exception("존재하지 않는 회원 ID 입니다.");
		}
	
		int cnt = cdao.update(new CustomVo(id, name, email, age, null));
		
		if(cnt == 1) {
			msg = "회원정보 수정 완료!!";
		} else {
			msg = "회원정보 수정 실패!!";
			target = "history.back();";
		}
	} catch (Exception e) {
		msg = "오류 : " + e.getMessage();
		target = "history.back();";
	}
	out.print("<script>");
	out.print("alert('"+ msg +"');");	
	out.print("location.href = '19customList.jsp';");
	// out.print(target);			// 뒤로가기!
	out.print("</script>");

%>


</body>
</html>