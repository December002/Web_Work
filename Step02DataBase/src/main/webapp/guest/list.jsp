<%@page import="test.guest.dto.GuestDto"%>
<%@page import="java.util.List"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 전체 방명록 글을 얻어와서
	GuestDto dto=new GuestDto();
	GuestDao dao=GuestDao.getInstance();
	List<GuestDto> list=dao.getList();
	//2. 응답한다
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/guest/list.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="guest" name="current"/>
	</jsp:include>
	<h1>방명록 리스트 입니다.</h1>
		<a href="insertform.jsp">방명록 작성</a>
		<div>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>번호</th>
						<th>작성자</th>
						<th>활동</th>
						<th>날짜</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
			<tbody>
				<%for(GuestDto tmp:list){ %>
					<tr>
						<td><%=tmp.getNum()%></td>
						<td><%=tmp.getWriter() %></td>
						<td>
							<textarea rows="5" readonly><%=tmp.getContent() %></textarea>
						</td>
						<td><%=tmp.getRegdate() %></td>
						<td><a href="updateform.jsp?num=<%= tmp.getNum()%>">수정</a></td>
						<td>
							<form action="delete.jsp" method="post">
							<input type="hidden" name="num" value="<%=tmp.getNum() %>" />
								<input type="text" name="pwd" placeholder="비밀번호..." />
								<button type="submit">삭제</button>
							</form>
						</td>
					</tr>
				<%} %>
			</tbody>
		</table>
	</div>
</body>
</html>