<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="test.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
MemberDto dto1=new MemberDto(1, "김구라", "노량진");
MemberDto dto2=new MemberDto(2, "해골", "행신동");
MemberDto dto3=new MemberDto(3, "원숭이", "상도동");

List<MemberDto> list=new ArrayList<>();
list.add(dto1);
list.add(dto2);
list.add(dto3);
%>
<html>
<head>
<meta charset="UTF-8">
<title>/member/list.jsp</title>
</head>
<body>
<table>
	<thead>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>주소</th>
		</tr>
	</thead>
	<tbody>
		<%for(int i=0; i<list.size(); i++){ 
			MemberDto tmp=list.get(i);%>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getName() %></td>
				<td><%=tmp.getAddr() %></td>
			</tr>
		<%} %>
	</tbody>
</table>
</body>
</html>