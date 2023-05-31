<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//GET 방식 요청 파라미터 읽어오기
	String msg=request.getParameter("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/fetch/send.jsp</title>
</head>
<body>
	<p>클라이언트가 보낸 문자열 : <strong><%=msg %></strong></p>
</body>
</html>