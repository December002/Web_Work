<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test_jquery/Step02_example.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">S
</head>
<body>
	<div class="container">
	<h1>ajax 요청을 통해서 받아온 데이터 사용하기</h1>
		<p>페이지 전환없이 서버에 요청하는 것을 ajax 라고 생각하면 된다</p>
		<div>
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>작성자</th>
						<th>제목</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
		</div>
		<nav>
			<ul class="pagination">
				<li class="page-item">
					<a @click="getPage(obj.startPageNum-1)" class="page-link" href="javascript:">prev</a>
				</li>
				<li class="page-item" v-for="item in pages" v-bind:key="item">
					<a @click="getPage(item)" v-bind:class="{active:item == obj.pageNum}" class="page-link" href="javascript:">{{item}}</a>
				</li>
				<li v-if="obj.endPageNum < obj.totalPageNum" class="page-item">
					<a @click="getPage(obj.endPageNum+1)" class="page-link" href="javascript:">next</a>
				</li>
			</ul>
		</nav>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
	<script>
		//1. 페이지의 내용 요청하기
		$.ajax({
			url:"${pageContext.request.contextPath }/cafe/json_list2.jsp",
			method:"get",
			data:{pageNum:1},
			success:function(data){
				//글 목록
				const list=data.list;
				list.forEach(function(item){
					//item 에는 글 하나의 정보가 들어 있다.
					const td1=$("<td>").text(item.num);
					const td2=$("<td>").text(item.wrtier); 
					const td3=$("<td>").text(item.title);
					$("<tr>").append(td1).append(td2).append(td3).appendTo("tbody")
				});
				
				if(data.startPageNum != 1){
					const a=$("<a>").addClass("page-link").attr("href",`javascript:request(\${data.startPageNum})`).text("Prev");
					const li=$("<li>").addClass("page-item").append(a).appendTo(".pagination");
				}
				//반복문 돌면서 페이지 출력하기 
	            for(let i=data.startPageNum; i<=data.endPageNum; i++){
	               const a=$("<a>").addClass("page-link").attr("href","javascript:").text(i);                     
	               if(i == data.pageNum){
	            	   a.addClass("active");
	               }
	               const li=$("<li>").addClass("page-item").append(a).appendTo(".pagination");
	            }

				if(data.endPageNum < data.totalPageCount){
					const a=$("<a>").addClass("page-link").attr("href","javascript:").text("Next");
					const li=$("<li>").addClass("page-item").append(a).appendTo(".pagination");
				}
			}
		})
		
		function request(pageNum){
			
		}
	</script>
</body>
</html>