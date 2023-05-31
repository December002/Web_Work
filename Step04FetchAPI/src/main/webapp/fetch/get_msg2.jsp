<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="applicattion/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//DB 에서 읽어온 더보기 메세지 목록이라고 가정하자
	List<String> list=new ArrayList<>();
	list.add("어쩌구");
	list.add("저쩌구");
	list.add("이러쿵");
%>
[
<%for(int i=0; i<list.size(); i++){%>
	"<%=list.get(i) %>" <%if(i != list.size()-1){%>, <%} %>
<%}%>
]