<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link href="/resources/css/login.css" rel="stylesheet">

<div class="container"
   style="text-align: center; margin-top: 8%; margin-bottom: 13%;">
   <h2 style="margin-bottom:80px;">Login</h2>
   <div class="member_boxL">
   <form name="login">
      <div class="login_form">
            <div class="fl_clear">
               <input type="text" name = "id" id="id" placeholder="ID" value =""
                  style="margin-bottom: 2.5%; width: 35%; height: 55px; border-radius: 10px; background-image: url(/resources/images/1.png); background-repeat: no-repeat; background-position: 9px center; padding-left: 45px; border: 2px solid #c1c1c1; box-shadow: 5px 5px 5px #EBEBEB;">
            </div>
            <div class="fl_clear">
               <input type="password" name = "pw" id="pw" placeholder="パスワード"
                  style="margin-bottom: 2.5%; width: 35%; height: 55px; border-radius: 10px; background-image: url(/resources/images/2.png); background-repeat: no-repeat; background-position: 9px center; padding-left: 45px; border: 2px solid #c1c1c1; box-shadow: 5px 5px 5px #EBEBEB;">
            </div>
            <a href="javascript: fn_login()" class="login_button" id="btn-login"; 
               style="margin: 15px 0; width: 35%; height: 55px; border-radius: 10px; background-repeat: no-repeat; background-position: 9px center; padding-top: 15px; border: 2px solid #c1c1c1; box-shadow: 5px 5px 5px #EBEBEB; padding:10px 30px;"> ログイン </a>
      </div>
   </form>

      <div class="others" style="width:21%; margin:40px auto;">
         <div class="pwfind" style="float: left;"><a href="/pwfind">パスワード探し</a></div>
         <div class='v-line'
            style="float: left; border-left: thin solid #E1E1E1; height: 20px;"></div>
         <div class="join" style="float: left;"><a href="/join">会員登録へ</a></div>
      </div>
   </div>
</div>
<script>
   $(function() { 
      $(".location .dropdown > a").on("click", function(e) {
         e.preventDefault();
         if ($(this).next().is(":visible")) {
            $(".location .dropdown > a").next().hide();
         }else {
            $(".lacation .dropdown > a").next().hide();
            $(this).next().show();
         }
      });
   });
	
   var msg = "";
   function fn_login() {
       if(!$("#id").val()) {
           alert("아이디를 입력하세요");
           $("#id").focus();
           return false;
       }
       else if(!$("#pw").val()) {
           alert("패스워드를 입력하세요");
           $("#pw").focus();
           return false; 
       } else {
   			var form = document.login; //문서 중에서 name이 login
			form.method = 'post'; //method 속성을 추가해라.
			form.action = '/login'; //action 속성을 추가해라
			form.submit(); //입력받은 값을 action 속성으로 전송해라
       }
		msg = "${msg}";
		if (msg) {
		    alert(msg);
		   }
       
   }
</script>

<%@ include file="../footer.jsp"%>