<%@page import="dao.CustomDao"%>
<%@page import="vo.CustomVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day4_custom</title>
</head>
<body>
<%
	CustomDao dao = CustomDao.getInstance();
	CustomVo vo = dao.selectById(request.getParameter("id"));
	if(vo != null ) {
%>
<%@ include file="header.jsp" %>
<h3>회원 정보 수정</h3>
<p>회원 이메일과 나이 항목 수정 가능합니다.</p>
<form action="22update.jsp" method="post">
	<input name="customid" value="<%= vo.getCustom_id()   %>" readonly>
	<input name="name" value="<%= vo.getName()  %>" readonly>
	<input name="email" value="<%= vo.getEmail()   %>" type="email" >
	<input name="age" value="<%= vo.getAge()   %>"  type="number">  
	<!-- history.back() 테스트 위해 required 는 잠시 뺐습니다. 나이를 비워놓고 테스트해보세요. -->
	<button>수정</button>  	<!-- submit -->
	<button type="reset">다시쓰기</button>  <!-- 초기값으로 되돌리기 -->
</form>
<%
	}else {
		out.print("<script>");
		out.print("alert('잘못된 아이디입니다.');");
		out.print("history.back();");
		out.print("</script>");
	}
%>
</body>
</html>