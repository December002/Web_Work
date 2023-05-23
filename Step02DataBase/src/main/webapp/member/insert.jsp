<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. post 방식으로 전송되는 회원의 이름, 주소를 추출한다.
	request.setCharacterEncoding("utf-8");
	String name=request.getParameter("name");
	String addr=request.getParameter("addr");
	//추가할 회원 정보를 MemberDto 객체에 담는다.
	MemberDto dto=new MemberDto();
	dto.setName(name);
	dto.setAddr(addr);
	
	//2. DB 에 저장한다.
	MemberDao dao=MemberDao.getInstance();
	boolean isSuccess=dao.insert(dto);
	
	//3. 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/member/insert.jsp</title>
</head>
<body>
	<div class="container">
		<h1>알림</h1>
		<%if(isSuccess){ %>
			<p>
				<strong><%=name %></strong> 님의 정보가 저장되었습니다.
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