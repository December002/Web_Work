<%@page import="test.guest.dao.GuestDao"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	String pwd=request.getParameter("pwd");
	boolean isSuccess=GuestDao.getInstance().delete(num, pwd);
	
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/guest/list.jsp");
%>