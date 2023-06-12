<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //자세히 보여줄 글의 번호를 읽어온다. 
   int num=Integer.parseInt(request.getParameter("num"));
   //DB 에서 해당글의 정보를 얻어와서
   CafeDto dto=CafeDao.getInstance().getData(num);
   //글 조회수도 1 증가 시킨다
   
   //응답한다.
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/detail.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
</head>
<body>
   <div class="container">
      <h3>글 상세 보기</h3>
      <table class="table table-bordered">
         <tr>
            <th>글번호</th>
            <td><%=dto.getNum() %></td>
         </tr>
         <tr>
            <th>작성자</th>
            <td><%=dto.getWriter() %></td>
         </tr>
         <tr>
            <th>제목</th>
            <td><%=dto.getTitle() %></td>
         </tr>
         <tr>
            <th>조회수</th>
            <td><%=dto.getViewCount() %></td>   
         </tr>
         <tr>
            <th>작성일</th>
            <td><%=dto.getRegdate() %></td>
         </tr>
         <tr>
            <td colspan="2">
               <div id="content">
               		<%=dto.getContent() %>
               </div>
            </td>
         </tr>
      </table>
      <%
         //로그인된 아이디가 있으면 읽어온다(null 일수도 있다)
         String id=(String)session.getAttribute("id");
      %>
      <%-- 만일 글 작성자가 로그인된 아이디와 같다면 수정, 삭제 링크를 제공한다. --%>
      <%if(dto.getWriter().equals(id)){ %>
         <a href="private/updateform.jsp?num=<%=dto.getNum()%>">수정</a>
         <a href="javascript:" onclick="deleteConfirm()">삭제</a>
         <script>
            function deleteConfirm(){
               const isDelete=confirm("이 글을 삭제 하겠습니까?");
               if(isDelete){
            	   //javascript 를 이용해서 페이지를 이동 시키기
                  location.href="private/delete.jsp?num=<%=dto.getNum()%>";
               }
            }
         </script>
      <%} %>      
   </div>
</body>
</html>
