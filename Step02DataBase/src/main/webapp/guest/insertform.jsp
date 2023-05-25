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
		<h1>방명록 작성 폼</h1>
		<form action="insert.jsp" method="post">
			<div>
				<label for="writer">작성자</label>
				<input type="text" id="writer" name="writer" />
			</div>
			<div>
				<label for="content">하고싶은말</label>
				<textarea name="content" id="content" cols="30" rows="10"></textarea>
			</div>
			<div>
				<label for="pwd">비밀번호 생성</label>
				<input type="password" id="pwd" name="pwd" />	
			</div>
			<button type="submit">등록</button>
		</form>
	</div>
</body>
</html>