<%@page import="java.util.List"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	FileDto dto=new FileDto();
	FileDao dao=FileDao.getInstance();
	List<FileDto> list=dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/file/list.jsp</title>
</head>
<body>
	<div class="container">
		<a href="${pageContext.request.contextPath }/file/private/upload_form.jsp">업로드 하기</a>
		<h1>자료실 목록입니다.</h1>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>파일명</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<%for(FileDto tmp:list) {%>
					<tr>
						<td><%=tmp.getNum() %></td>
						<td><%=tmp.getWriter() %></td>
						<td><%=tmp.getTitle() %></td>
						<td><%=tmp.getSaveFileName() %></td>
						<td><%=tmp.getRegdate() %></td>
					</tr>
					<%} %>
			</tbody>
		</table>
	</div>
</body>
</html>