<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
   <div class="container" id="app">
      <h3>회원 가입 폼 입니다.</h3>
      <form action="signup.jsp" method="post" id="signupForm">
         <div>
            <label class="control-label" for="id">아이디</label>
            <input @input="onIdInput" 
               v-bind:class="{'is-valid':isIdValid, 'is-invalid':!isIdValid && isIdDirty}" class="form-control" type="text" name="id" id="id"/>
            <small class="form-text text-muted">영문자 소문자로 시작하고 5글자~10글자 이내로 입력하세요</small>
            <div class="valid-feedback">사용 가능한 아이디 입니다.</div>
            <div class="invalid-feedback">사용할 수 없는 아이디 입니다.</div>
         </div>
         
         <div>
            <label class="control-label" for="pwd">비밀번호</label>
            <input class="form-control" type="password" name="pwd" id="pwd"
               v-bind:class="{'is-valid':isPwdValid, 'is-invalid':!isPwdValid && isPwdDirty}"
               @input="onPwdInput"
               v-model="pwd"/>
            <small class="form-text text-muted">특수 문자를 하나 이상 조합하세요.</small>
            <div class="invalid-feedback">비밀 번호를 확인 하세요</div>
         </div>
         <div>
            <label class="control-label" for="pwd2">비밀번호 확인</label>
            <input class="form-control" type="password" name="pwd2" id="pwd2"
               @input="onPwdInput"
               v-model="pwd2"/>
         </div>
         
         <div>
            <label class="control-label" for="email">이메일</label>
            <input class="form-control" type="text" name="email" id="email"
               v-bind:class="{'is-valid':isEmailValid, 'is-invalid':!isEmailValid && isEmailDirty}"
               @input="onEmailInput"/>
            <div class="invalid-feedback">이메일 형식에 맞게 입력하세요.</div>
         </div>
         <button v-bind:disabled="!isIdValid || !isEmailValid || !isPwdValid" class="btn btn-outline-primary" type="submit">가입</button>
         <button v-bind:disabled="!(isIdValid && isEmailValid && isPwdValid)" class="btn btn-outline-primary" type="submit">가입</button>
      </form>
   </div>
   <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
   <script>
      new Vue({
         el:"#app",
         data:{
            isIdValid:false,
            isIdDirty:false,
            isEmailValid:false,
            isEmailDirty:false,
            isPwdValid:false,
            isPwdDirty:false,
            pwd:"",
            pwd2:""
         },
         methods:{
            onIdInput(e){
               //아이디 입력란에 한번이라도 입력하면 isIdDirty 값을 true 로 바꿔준다.
               this.isIdDirty=true;
               //입력한 아이디 읽어오기
               const inputId=e.target.value;
               //정규표현식
               const reg=/^[a-z].{4,9}$/;
               //정규표현식 통과 여부를 모델에 반영하기
               this.isIdValid=reg.test(inputId);
            },
            onEmailInput(e){
               this.isEmailDirty=true;
               const inputEmail=e.target.value;
               const reg=/@/;
               this.isEmailValid=reg.test(inputEmail);
            },
            onPwdInput(){
               this.isPwdDirty=true;
               //특수문자가 포함되었는지 여부를 검증할 정규 표현식
               const reg=/[\W]/;
               //정규표현식도 통과하고 비밀번호 입력란과 확인란도 같은지 확인해서 비밀번호 유효성 여부에 반영
               this.isPwdValid = reg.test(this.pwd) && (this.pwd == this.pwd2);
            }
         }
      });
   </script>
</body>
</html>












