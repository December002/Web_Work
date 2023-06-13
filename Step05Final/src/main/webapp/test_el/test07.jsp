<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test_el/test07.jsp</title>
</head>
<body>
	<p>saveId 라는 키값으로 저장된 값 : ${cookie.savedId.value }</p>
	<p>saveId 라는 키값으로 저장된 값이 있는지 여부 : ${not empty cookie.savedId }</p>
</body>
</html>