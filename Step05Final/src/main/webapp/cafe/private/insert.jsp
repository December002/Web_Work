<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//폼 전송되는 title, content 읽어내기
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	//글 작성자 얻어내기
	String writer=(String)session.getAttribute("id");
	//CafeDto 에 담기
	CafeDto dto=new CafeDto();
	dto.setContent(content);
	dto.setTitle(title);
	dto.setWriter(writer);
	//DB 에 저장하기
	boolean isSuccess=CafeDao.getInstance().insert(dto);
	//응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/cafe/private/insert.jsp</title>
</head>
<body>
	<div class="container">
      <%if(isSuccess){ %>
         <p>
            새글을 저장했습니다.
            <a href="${pageContext.request.contextPath }/cafe/list.jsp">확인</a>
         </p>
      <%}else{ %>
         <p>
            글 저장 실패
            <a href="insertform.jsp">다시 작성하러 가기</a>
         </p>
      <%} %>
   </div>
</body>
</html>