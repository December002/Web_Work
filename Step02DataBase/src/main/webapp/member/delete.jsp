<%@page import="test.member.dao.MemberDao"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	/*
		이페이지에서 요청이 될때 <a herf="delete.jsp?num=x"></a> 형식의 링크를 눌러서
		GET 방식 요청이 되는 것이다.
		따라서 GET 방식 요청 파라미터로 삭제할 회원의 번호가 전달이 된다.
		해당 파라미터를 추출해서 DB 에서 삭제 하면 된다.
	*/

	//1. 삭제할 회원의 번호를 얻어내서
	int num=Integer.parseInt(request.getParameter("num"));
	//2. DB 에서 삭제하고
	boolean isSuccess=MemberDao.getInstance().delete(num);
	/*
		[리 다이렉트 응답]
		- 클라이언트에게 특정 경로로 요청을 다시 하라고 응답하는 것이다.
		- 다시 요청할 경로를 전달하면 클라이언트가 해당경로로 요청을 다시하게 된다.
		- 따라서 순간적으로 페이지가 이동되게 된다.
		- HttpServletResponse 객체의 기능을 활용하면 된다.
		- 요청을 다시할 경로를 전달할때는 반드시 절대경로로 전달하는 것이 좋다
		- 새로운 경로로 요청을 다시 하라고 강요하는것도 응답이다.
	*/
	//context 경로 얻어내기 ( context 경로는 추후에 수정되거나 제거될 예정이기 때문에 메소드로 얻어낸다)
	String cPath=request.getContextPath();
	//리 다이렉트 응답하기
	response.sendRedirect(cPath+"/member/list.jsp");
%>
