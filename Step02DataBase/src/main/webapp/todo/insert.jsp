<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String needs=request.getParameter("needs");
	
	TodoDto dto=new TodoDto();
	dto.setNeeds(needs);
	
	TodoDao dao=TodoDao.getInstance();
	boolean isSuccess=dao.insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1>알림</h1>
		<%if(isSuccess){ %>
			<p>
				<strong><%=needs %></strong> 할일이 추가 되었습니다!
				<a href="list.jsp">확인</a>
			</p>
		<%}else{ %>
			<p>
				회원정보 저장 실패!
				<a href="insertform.jsp">다시 작성</a>
			</p>
		<%} %>
	</div>
</body>
</html>