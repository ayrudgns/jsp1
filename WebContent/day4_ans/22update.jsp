<%@page import="vo.CustomVo"%>
<%@page import="dao.CustomDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String customid = request.getParameter("customid");
		String email = request.getParameter("email");
		String temp = request.getParameter("age");
		
		int age=0; String message="";
		CustomDao dao = CustomDao.getInstance();
		String target="";
		try{
						
			age = Integer.parseInt(temp);
			int cnt = dao.update(new CustomVo(customid,null,email,age,null));
			if (cnt==1) {
				message = "회원 정보 수정이 완료되었습니다.";
				target = "location.href = '21customUpdate.jsp?id="+customid +"';";
			}
			else{
				message ="회원정보 수정에 문제가 있습니다. 입력값을 확인하세요.";
				target = "history.back();";
			}
		}catch(Exception e) {		//SQL insert 문 외에 다른 Exception 모두 처리 
			message = "오류 :" + e.getMessage();		//NumberFormatException 을 비롯해서 모든 Exception 을 처리합니다.
			target = "history.back();";
		}
		
		out.print("<script>");
		out.print("alert('"+ message + "');");		
		out.print(target);		//location.href = '17customJoin.jsp' ; 대신에 사용. 브라우저에서 뒤로가기 기능
		out.print("</script>");




%>