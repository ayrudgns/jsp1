<%@page import="hrd.vo.MoneyVo"%>
<%@page import="java.util.List"%>
<%@page import="hrd.dao.MoneyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 	MoneyDao dao = MoneyDao.getInstance();
 	List<MoneyVo> mnlist = dao.getList();
 	
 	request.setAttribute("mnlist", mnlist);
 	pageContext.forward("8moneyselect.jsp");
 %>
