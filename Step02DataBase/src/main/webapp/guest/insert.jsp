<%@page import="test.guest.dao.GuestDao"%>
<%@page import="test.guest.dto.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 폼전송이 되는 방명록 작성자, 글내용을 읽어온다.
	request.setCharacterEncoding("utf-8");
	String writer=request.getParameter("writer");
	String content=request.getParameter("content");
	String pwd=request.getParameter("pwd");
	//2. DB에 저장한다.
	GuestDto dto=new GuestDto();
	dto.setWriter(writer);
	dto.setContent(content);
	dto.setPwd(pwd);
	GuestDao dao=GuestDao.getInstance();
	boolean isSuccess=dao.insert(dto);
	//3. 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/guest/insert.jsp</title>
</head>
<body>
	<!-- 이 주석은 웹브라우저에게 출력되지만 웹브라우저가 무시하는 주석 -->
	<%-- 이 주석은 jsp 페이지가 무시하는 주석 (웹브라우저에 출력되지 않는다) --%>
	<%-- javascript 응답하기 --%>
	
	<script>
		<%if(isSuccess){%>
			//알림창 띄우기
			alert("글을 성공적으로 등록 했습니다");
			//java script 로 페이지 이동
			location.href="${pageContext.request.contextPath }/guest/list.jsp";
		<%}else{ %>
			alert("등록실패!");
			location.href="${pageContext.request.contextPath }/guest/insertform.jsp";
		<%} %>
	</script>
</body>
</html>