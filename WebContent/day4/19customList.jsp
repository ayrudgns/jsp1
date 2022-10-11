<%@page import="vo.CustomVo"%>
<%@page import="java.util.List"%>
<%@page import="dao.CustomDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 회원 목록 조회 -->

<%
	CustomDao dao = CustomDao.getInstance();
	List<CustomVo> clist = dao.getList();

	request.setAttribute("clist", clist);
	pageContext.forward("20select.jsp");

%>