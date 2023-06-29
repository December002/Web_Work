<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test/jquery/hello.jsp</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
</head>
<body>
	<div class="container">
		<input type="text" id="inputMsg" placeholder="문자열 입력..." />
		<button id="sendBtn">전송</button>
		<p id="result"></p>
	</div>
	
	<div>div1</div>
	<div class="my-class">div2</div>
	<div class="my-class">div3</div>
	<div id="one">div4</div>
	<script>
		// 위의 input 요소에 문자열 입력하고 전송버튼을 누르면 입력한 문자열을 p 요소의 innerText 에
		// 출력되도록 프로그래밍 해 보세요	
		/*
		document.querySelector("#sendBtn").addEventListener("click", ()=>{
			const msg=document.querySelector("#inputMsg").value
			document.querySelector("#result").innerText=msg; 
		});
		*/
		//$() => 여기에는 [배열]의 참조값이 리턴되는데 그 배열은 jquery 의 기능이 추가된 배열이다.
		//[배열] => 선택자에 부합하는 모든 문서객체의 참조값이 순서대로 들어 있다.
		$("#sendBtn").on("click", ()=>{
			const msg=$("#inputMsg").val();
			$("#result").text(msg);
		});
	</script>
</body>
</html>