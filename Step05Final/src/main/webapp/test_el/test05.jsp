<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test_el/test05.jsp</title>
</head>
<body>
	<h1>param.파라미터명 형식으로 추출할 수 있다.</h1>
	<p>전달된 파라미터 : <strong>${param.msg }</strong></p>
	<p>전달된 파라미터 : <strong><%=request.getParameter("msg") %></strong></p>
</body>
</html>