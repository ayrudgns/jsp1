<%@page import="hrd.vo.MemberVo"%>
<%@page import="java.util.List"%>
<%@page import="hrd.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDao dao = MemberDao.getInstance();
	List<MemberVo> mlist = dao.getList();
	
	request.setAttribute("mlist", mlist);
	pageContext.forward("6memberSelect.jsp");
%>