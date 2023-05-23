<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	/*
		이페이지에서 요청이 될때 <a herf="delete.jsp?num=x"></a> 형식의 링크를 눌러서
		GET 방식 요청이 되는 것이다.
		따라서 GET 방식 요청 파라미터로 삭제할 회원의 번호가 전달이 된다.
		해당 파라미터를 추출해서 DB 에서 삭제 하면 된다.
	*/

	//1. 삭제할 회원의 번호를 얻어내서
	int num=Integer.parseInt(request.getParameter("num"));
	//2. DB 에서 삭제하고
	boolean isSuccess=MemberDao.getInstance().delete(num);
	//3. 응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/member/delete.jsp</title>
</head>
<body>
	<div class="container">
		<h1>알림</h1>
		<%if(isSuccess){ %>
			<p>
				<strong><%=num %></strong> 번 회원의 정보를 삭제했습니다.
				<a href="list.jsp">목록보기</a>
			</p>
		<%}else{%>
			<p>
				삭제실패!
				<a href="list.jsp">목록보기</a>
			</p>
		<%} %>
	</div>
</body>
</html>