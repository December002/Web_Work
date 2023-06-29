<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/promise/test01.jsp</title>
</head>
<body>
	<h3>콜백 지옥이란 무엇인가?</h3>
	<script>
		//가상의 주어진 작업을 처리 하는 함수  (주어진 작업을 처리하는데 random 한 시간이 걸린다고 가정하자)
		function work(job, callback){
			//0~5000 사이의 랜덤한 숫자 얻어내기
			let ranTime=Math.random()*5000
			 
			setTimeout(()=>{
				console.log(job+"을(를) 처리(수행) 했습니다.")
				callback();//전달받은 함수를 호출해준다.
			}, ranTime)
		}
		
		//냉장고 문을 여는 작업을 하고 해당 작업이 끝나면 내가 전달한 함수를 호출해 주세요.
		work("냉장고 문을 연다", function(){
			work("코끼리를 냉장고에 넣는다", function(){
				work("냉장고 문을 닫는다", function(){
					
				});
			});
		});
		
		
		let p1 = new Promise(function(resolve){
			/*
				함수의 인자로 전달되는 resolve 는 함수이다.
				resolve 는 작업을 완료 했을때 호출 해야하는 함수
				resolve 함수가 호출되면 .then() 안에 있는 함수가 자동 호출된다.
				
			*/
			resolve();
		});
		
		p1.then(function(){
			console.log("then 안에 있는 함수가 호출되었습니다.")
		});
		
	</script>
</body>
</html>