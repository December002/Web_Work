<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test_jquery/step01_event3.jsp</title>
</head>
<body>
	<h1>이벤트 처리</h1>
	<input type="text" id="inputMsg" placeholder="메세지 입력..." />
	<button id="sendBtn">전송</button>
	<p id="current"></p>
	<ul id="msgList">
	
	</ul>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
	<script>
		$("#inputMsg").on("keyup", function(e){
			console.log(e.keyCode);
			//만일 Enter 키를 눌렀다면
			if(e.keyCode==13){
				const msg=$("#inputMsg").val();
				$("<li>").text(msg).appendTo("#msgList");
				$("#inputMsg").val("").focus();
			}
			//현재까지 입력한 문자열을 읽어와서
			const msg=$(e.target).val();
			//p 요소에 출력
			$("#current").text(msg);
		});
	
		//전송 버튼을 눌렀을때 실행할 함수 등록
		$("#sendBtn").on("click", function(){
			//1. 입력한 문자열을 읽어와서
			const msg=$("#inputMsg").val();
			//2. li 요소를 만들어서 innerText 에 출력하고 id 가 msgList 인 요소에 추가하기
			$("<li>").text(msg).appendTo("#msgList");
		});
		/*
		const li=document.createElement("li");
		li.innertText="msg";
		document.querySelector("#msgList").append("li");
		*/
		//value 에 빈 문자열을 넣어주면 입력한 내용이 삭제되는 효과를 낸다
		$("#inputMsg").val("").focus();
	</script>
</body>
</html>