<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/users/private/profile_usersform.jsp</title>
</head>
<body>
	<form action="upload.jsp" method="post" enctype="multipart/form-data">
		<label for="image">이미지</label>
		<input type="file" name="image" id="image" accept=".jpg, .jpeg, .png, .gif, .JPG, .JPEG"/>
		<button type="submit">업로드</button>
	</form>
</body>
</html>