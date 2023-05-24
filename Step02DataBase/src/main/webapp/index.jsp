<%@page import="test.util.DbcpBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//DB 연동 가능한지 테스트
	//new DbcpBean();//객체 생성했을때 예외가 발생하지 않고 "Connection 얻어오기 성공!" 이 콘솔창에 출력되면 된다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
	<div class="container">
		<h1>인덱스 페이지 입니다.</h1>
		<ul>
			<li><a href="member/list.jsp">회원목록 보기</a></li>
		    <li><a href="todo/list.jsp">할일 목록보기</a></li>
		</ul>
	</div>
</body>
</html>