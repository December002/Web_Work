<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//몇번 상품 몇개인지를 HttpServletRequest 객체를 이용해서 얻어낸 다음
	//아래의 html 요소에 출력해 보세요.
	
	//get 방식 전송은 한글이 깨지지 않기 때문에 아래의 한줄을 필요 없다.
	request.setCharacterEncoding("utf-8");
	/*
		전달되는 파라미터가 숫자인 경우에 실제 숫자로 바꿔야 하는 경우가 많다
		그런경우 Integer 클래스 혹은 Double 클래스의
		parseInt(), parseDouble() static 메소드를 활용하면 된다.
	*/
	int num=Integer.parseInt(request.getParameter("num"));
	int amount=Integer.parseInt(request.getParameter("amount"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/shop/buy.jsp</title>	
</head>
<body>
	<p>
		<strong><%=num %> </strong> 번 상품 <strong><%=amount %> </strong>개를 주문 했습니다.
	</p>
</body>
</html>