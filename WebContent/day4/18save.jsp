<%@page import="vo.CustomVo"%>
<%@page import="dao.CustomDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록 확인</title>
</head>

<body>
<!-- 회원 등록 결과 저장 및 확인 -->
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
		if (cdao.selectById(id) != null) {
			throw new Exception("동일한 회원 ID가 존재합니다.");
		}
		int cnt = cdao.insert(new CustomVo(id, name, email, age, null));
		if(cnt == 1) {
			msg = "회원 등록 완료!!";
		} else {
			msg = "회원 등록 실패!!";
			target = "history.back();";
		}
	} catch (Exception e) {
		msg = "오류 : " + e.getMessage();
		target = "history.back();";
	}
	out.print("<script>");
	out.print("alert('"+ msg +"');");	
	// out.print("location.href = '17customJoin.jsp';");
	out.print(target);		// 뒤로 가기
	// redirect와 뒤로가기 선택지가 있음! 뒤로가기는 입력값이 남아 있어 확인할 수 있다.
	// 오류가 있는 경우, 뒤로가기가 낫다!
	out.print("</script>");
	
%>

</body>
</html>