<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link href="/resources/css/join.css" rel="stylesheet">
<title>회원가입</title>

<div class="container"
   style="text-align: center; margin-top: 8%; margin-bottom: 13%;">
   <h2>会員登録</h2>
   <form name="join">
      <div class="joinname">
         ID<br>
      </div>
      <input type="text" name="id" id="userId" class="idwrite"> 
      <input type="button" value="重複チェック" id="btn_Idcheck" class="scrCheck"
      style="display: inline-block; width: 100px;">
         <p id="idmsg" style="color:#f00; margin-left:-300px;"></p>

      <div class="joinname">
         e-mail<br>
      </div>
      <input type="text" name="email" id="userEmail" class="email"> 
      <input type="button" value="転送" id="btn-mail" class="scrCheck"
      style="display: inline-block; width: 50px;">
      <p id="emailmsg" style="color:#f00; margin-left:-300px;"></p>
      
      <div class="joinname" id="scrtNo">
         認証番号<br>
      </div>
      <input type="text" name="userEmailBno" class="email" id="writeEmail"> <input
         type="button" value="確認" class="scrCheck" id="scrCheck"
         style="display: inline-block; width: 50px;">

      <div class="joinname">
         パスワード<br>
      </div>
      <input type="text" name="pw" id="userPw" placeholder="8~12文字, 特殊記号付け"
         class="write"
         style="background-image: url(/resources/images/login2.png); background-repeat: no-repeat; background-position: 95% center;">
      <p id="pwmsg" style="color:#f00; margin-left:-300px;"></p>

      <div class="joinname">
         お名前<br>
      </div>
      <input type="text" name="name" id="name" class="write" id="name">
      <p id="namemsg" style="color:#f00; margin-left:-300px;"></p>

         <div class="question">
            <div class="joinname">
               質問<br>
            </div>
            <select name="question" class="select">
               <option value="null">質問選択</option>
               <option value="1">一番親しい友達の名前は。</option>
               <option value="2">初めてしてみたゲームは。</option>
               <option value="3">一番記憶に残る場所は。</option>
               <option value="4">一番楽しかった瞬間は。</option>
               <option value="5">一番行ってみたい場所は。</option>
            </select>
         </div>

      <div class="joinname">
         返答<br>
      </div>
      <input type="text" name="answer" id="userAns" class="write"> 
      <p id="ansmsg" style="color:#f00; margin-left:-300px;"></p>
      <br>
      
   <button type="button" class="box"
      style="margin-bottom: 1.5%; margin-top: 2%; width: 38%; height: 55px; border-radius: 10px; background-color: #fff; border-color: #E1E1E1; box-shadow: 5px 5px 5px #EBEBEB;">会員登録</button>
   </form>
</div>


<script>
   
   $(function () {
      $("#username").focus();  
      $("#username").blur(function() {
         if($("#username").val()==""){//val=value j쿼리에서는 
            $("#idmsg").text("IDを入力してください。");//text 대신 태그를 같이 사용할수 있는 html("<span>이름을 입력하세요</span>")도 있다 
         }else{
            $("#idmsg").html("");//이미 공백이 있어서 발생하고 나서 값을 입력한다고 지워지지는 않으니까 공백 넣어줘야함 
         }
      })
      
      $("#userEmail").blur(function() {
         if(!$("#userEmail").val()){
            $("#emailmsg").text("e-mailを入力してください。");
         }else{
            $("#emailmsg").html("");
         }
      })
      
      $("#userPw").blur(function() {
         if(!$("#userPw").val()){ 
            $("#pwmsg").text("パスワードを入力してください。"); 
         }else{
            $("#pwmsg").html("");
         }
      })
      
      $("#name").blur(function() {
         if(!$("#name").val()){
            $("#namemsg").text("お名前を入力してください。");
         }else{
            $("#namemsg").html("");
         }
      })
      
      $("#userAns").blur(function() {
         if(!$("#userAns").val()){ 
            $("#ansmsg").text("返答を入力してください。");
         }else{
            $("#ansmsg").html("");
         }
      })
   $("#btn_Idcheck").on("click",function() {
	   if($("#userId").val()==""){
		   alert("IDを入力してください。");
	   } else {
		   var userid = $("#userId").val();
	    $.ajax({
            type:"post",//비동기식 데이터 전송 타입쓸떄 type에쓴다  post,get둘중 하나 사용 
            url:'/membercount',
            data:{username:userid},//키와 밸류 형태로 보내라 =>json형식 
            dataType:'json',
            success:function(data){//결과 값이잘 저장 되면  success호출되서 값이 data에 저장되는 방식 / 통신 ok
            	if(data >0){
            		alert("すでに使っているIDです。");
            		$("#userId").focus();
            		return;
            	}
            	if(confirm("使えるIDです。\nお使いになりますか。")){
            	}
            }, error:function(xhr, status, error){
               alert("통신에러");
            }
	       }) //아이디 확인
	   }
   })
      
   var code =""; //넘어온 임시 번호
   var incode =""; //입력받은 임시 번호
   var authcode = false; //인증검사
   
   $("#btn-mail").on("click", function() {
      var userEmail = $("#userEmail").val();
      $.ajax({
         type:'get',
         url:'/sendmail?email='+userEmail,
         success:function(data) {
            alert("認証番号を入力して確認ボタンを押してください。");
            code = data;
         $("#scrtNo").attr("disabled", false);
         $("#scrtNo").css("background", "#fff");
         
         $("#scrCheck").on("click", function() {
            incode = $("#writeEmail").val();
            if(incode == "") {
               alert("認証番号を入力してください。")
               return;   
            }
            if(code == incode) {
               authcode = true;
               alert("認証番号が一致します。")
            }else {
               
               alert("認証番号が一致しません。")
               authcode = false;
            }
         })
         }
      })
   }) //메일 인증
       
   
   $(".box").on("click", function() {
      if (authcode == true) {
			var form = document.join;
			form.method='post';
			form.action='/join';
			form.submit();
         	alert("会員登録が完了しました。\nもう一度ログインしてください。");
      }else {
         alert("メール認証をしてください。");
         return false;
      }
   }) //회원가입 버튼
   })
</script>

<%@ include file="../footer.jsp"%>