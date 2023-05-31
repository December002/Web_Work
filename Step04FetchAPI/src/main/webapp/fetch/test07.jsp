<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/fetch/test07.jsp</title>
</head>
<body>
   <h1>폼에 입력한 내용을 페이지 전환없이 전송하기</h1>
   <form action="login.jsp" method="post" id="myForm">
      <input type="text" name="id" placeholder="아이디 입력..."/>
      <input type="password" name="pwd" placeholder="비밀번호 입력..."/>
      <button type="submit">로그인</button>
   </form>
   <h1>폼에 입력한 내용을 페이지 전환없이 전송하기(gura_util.js 활용)</h1>
   <form action="login.jsp" method="post" id="myForm2">
      <input type="text" name="id" placeholder="아이디 입력..."/>
      <input type="password" name="pwd" placeholder="비밀번호 입력..."/>
      <button type="submit">로그인</button>
   </form>
   <!-- 외부 javascript 로딩 -->
   <script src="${pageContext.request.contextPath }/js/gura_util.js"></script>
   <script>
   
      document.querySelector("#myForm2").addEventListener("submit", (e)=>{
         e.preventDefault();
         //gura_util.js 안에 있는 ajaxFormPromise() 함수 활용하기
         ajaxFormPromise(e.target) //함수 호출하면서 폼의 참조값 전달
         .then(res=>res.json())
         .then((data)=>{
            console.log(data);
         });
      });
   
   
      /*
          폼안에 있는 submit 버튼을 누르면 폼 요소에는 "submit" 이벤트가 발생한다.
          따라서 "submit" 이벤트가 발생했을때 원하는 동작이 있다면 
          .addEventListener("submit", ()=>{}) 을 활용하면 된다.
      */
      document.querySelector("#myForm").addEventListener("submit", (e)=>{
         //event 객체 안에 있는 preventDefault() 함수를 호출하면 폼 제출 막기
         e.preventDefault();
         //fetch 함수를 이용해서 페이지 전환 없이 입력한 내용을 읽어와서 직접 제출하기
         
         //입력한 내용을 query 문자열로 읽어오기
         const data=new FormData(e.target);
         const queryString=new URLSearchParams(data).toString();
         //fetch() 함수를 이용해서 post 로 전송하기
         fetch("login.jsp",{
            method:"POST",
            headers:{"Content-Type":"application/x-www-form-urlencoded; charset=utf-8"},
            body:queryString
         })
         .then(res=>res.json())
         .then((data)=>{
            console.log(data);
         });
      });
   </script>
</body>
</html>

