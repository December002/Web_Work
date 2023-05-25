<%@page import="test.util.DbcpBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //DB 연동 가능한지 테스트
   //new DbcpBean(); //객체 생성했을때 예외가 발생하지 않고 "Connection 얻어오기 성공!" 이 콘솔창에 출력되면된다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<%--/include/navbar.jsp 페이지에게 이부분만 응답하도록 한다
		include 되는 jsp 페이지에 파라미터를 전달할수도 있다.
	--%>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="index" name="current"/>
	</jsp:include>
	
   <div class="container">
      <h1>인덱스 페이지 입니다.</h1>
      <ul>
         <li><a href="${pageContext.request.contextPath }/member/list.jsp">회원 목록보기</a></li>
         <li><a href="${pageContext.request.contextPath }/guest/list.jsp">방명록 목록보기</a></li>
      </ul>
   </div>
</body>
</html>
