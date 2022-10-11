<%@page import="hrd.vo.MemberVo"%>
<%@page import="hrd.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");	
	int custno = Integer.parseInt(request.getParameter("custno"));
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String joindate = request.getParameter("joindate");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	
	String msg = "";
	String target = "";
	
	MemberDao dao = MemberDao.getInstance();
	
	try {

		int cnt = dao.update(new MemberVo(custno, custname, phone, 
							address, joindate, grade, city));
		
		if(cnt == 1) {
			msg = "회원정보 수정 완료!";
			target = "location.href='5memberList.jsp'";
		} else {
			msg = "회원 정보 수정 실패! 입력값 확인 필요";
			target = "history.back()";
		}	
	} catch (Exception e) {
			msg = "오류 :" + e.getMessage();			
			target = "history.back();";
	}
		
		out.print("<script>");
		out.print("alert('"+ msg + "');");		
		out.print(target);
		out.print("</script>");
%>