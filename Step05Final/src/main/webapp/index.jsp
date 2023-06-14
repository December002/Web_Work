<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>index.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<%-- webapp/include/navbar.jsp --%>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="index" name="current"/>
	</jsp:include>
	<div class="container">
		<!-- 세션 영역에 id 라는 키값으로 저장된 값이 비어 있지 않은지 여부(값이 존재하는지 여부)  -->
		<c:if test="${not empty id }">	
			<p>
				<a href="${pageContext.request.contextPath }/users/private/info.jsp"> ${id }</a> 님 로그인중...
				<a href="${pageContext.request.contextPath }/users/logout.jsp">로그아웃</a>
			</p>
		</c:if>
		<h1>인덱스 페이지 입니다</h1>
		<ul>
			<li><a href="${pageContext.request.contextPath }/users/signup_form.jsp">회원가입</a></li>
			<li><a href="${pageContext.request.contextPath }/users/loginform.jsp">로그인</a></li>
			<li><a href="${pageContext.request.contextPath }/private/game.jsp">놀러가기(로그인필요)</a></li>
			<li><a href="${pageContext.request.contextPath }/private/study.jsp">공부하기(로그인필요)</a></li>
			<li><a href="file/list.jsp">자료실</a></li>
			<li><a href="test/signup_form.jsp">form 테스트</a></li>
			<li><a href="cafe/list.jsp">게시글 목록</a></li>
		</ul>
	</div>
</body>
</html>