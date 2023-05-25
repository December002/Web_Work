<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/guest/insertform.jsp</title>
</head>
<body>
	<div>
		<h1>방명록 추가 폼</h1>
		<form action="insert.jsp" method="post">
			<label for="writer">작성자</label>
			<input type="text" id="writer" name="writer" />
			<br>
			<label for="content">하고싶은말</label>
			<textarea name="content" id="content">
			
			</textarea>
			<br>
			<label for="psw">비밀번호 생성</label>
			<input type="password" id="psw" name="psw" />
			<br>	
			<button type="submit">방명록 추가</button>
		</form>
	</div>
</body>
</html>