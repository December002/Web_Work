<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//요청 인코딩 설정(한글깨지지 않도록)
	request.setCharacterEncoding("utf-8");
	//요청 파라미터 추출
	String msg=request.getParameter("msg");
	//콘솔창에 출력하기 (이클립스 버그때문에 jsp 페이지에서는 콘솔창에 문자열이 출력 불가)
	//System.out.println("msg"+msg);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/send.jsp</title>
</head>
<body>
	<p>잘 받았어 클라이언트야</p>
	<p>전달 받은 메세지<strong><%=msg %></strong></p>
</body>
</html>	