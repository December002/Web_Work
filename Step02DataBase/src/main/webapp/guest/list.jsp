<%@page import="test.guest.dto.GuestDto"%>
<%@page import="java.util.List"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	GuestDto dto=new GuestDto();
	GuestDao dao=GuestDao.getInstance();
	List<GuestDto> list=dao.getList();
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/guest/list.jsp</title>
</head>
<body>
	<div>
		<h1>방명록 리스트 입니다.</h1>
		<a href="insertform.jsp">방명록 작성</a>
		<a href="deletform.jsp">방명록 삭제</a>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>활동</th>
					<th>날짜</th>
					<th>삭제</th>
					<th>수정</th>
				</tr>
			</thead>
			<tbody>
				<%for(GuestDto tmp:list){ %>
					<tr>
						<td><%=tmp.getNum()%></td>
						<td><%=tmp.getWriter() %></td>
						<td><%=tmp.getContent() %></td>
						<td><%=tmp.getRegdate() %></td>
						<td>
							<form action="delete.jsp?num=<%=tmp.getNum()%>&pwd=<%=tmp.getPwd() %>" >
							<input type="password" id="pwd" name="pwd"  />
							
							
							<button type="submit">삭제</button>
								
							</form>
						</td>
						<td>
							<a href="updateform.jsp">수정</a>
						</td>
					</tr>
				<%} %>
			</tbody>
		</table>
	</div>
</body>
</html>