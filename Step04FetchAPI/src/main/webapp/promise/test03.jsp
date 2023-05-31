<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/promise/test03.jsp</title>
</head>
<body>
	<h1>Promise 테스트</h1>
	<script>
		new Promise(function(resolve, reject){
			resolve();
			//reject();
			console.log("resolve 호출됨")
		}).then(function(){
			console.log("then()안에 있는 함수 호출됨")
		}).catch(function(){
			console.log("catch() 안에 있는 함수 호출됨")
		});
	</script>
</body>
</html>