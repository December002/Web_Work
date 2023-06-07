<%@page import="java.util.List"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	FileDto dto=new FileDto();
	FileDao dao=FileDao.getInstance();
	List<FileDto> list=dao.getList();
	//로그인된 아이디(로그인 되어있지 않으면 null 이다.)
	String id=(String)session.getAttribute("id");
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
		<br>
		<a href="${pageContext.request.contextPath }/file/private/upload_form2.jsp">ajax 업로드 하기</a>
		<h1>자료실 목록입니다.</h1>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>파일명</th>
					<th>등록일</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<%for(FileDto tmp:list) {%>
					<tr>
						<td><%=tmp.getNum() %></td>
						<td><%=tmp.getWriter() %></td>
						<td><%=tmp.getTitle() %></td>
						<td>
							<a href="download.jsp?num=<%=tmp.getNum() %>"><%=tmp.getOrgFileName()%></a>
						</td>
						<td><%=tmp.getRegdate() %></td>
						<!-- 글작성자와 로그인된 아이디와 같을때만 삭제링크 출력하기 -->
						<%if(tmp.getWriter().equals(id)){ %>
							<td>
								<a href="delete.jsp?num=<%=tmp.getNum()%>">삭제</a>
							</td>
						<%} %> 
					</tr>
					<%} %>
			</tbody>
		</table>
	</div>
</body>
</html>