<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link href="/resources/css/pwfind.css" rel="stylesheet">

<div class="container"
	style="text-align: center; margin-top: 8%; margin-bottom: 13%;">
	<h2 style="margin-bottom: 80px;">パスワード探し</h2>
	<div class="member_boxL">
		<div class="login_form">
				<div class="fl_clear">
					<!-- <img src="/resources/images/login1.png"> -->
					<input type="text" id="id" placeholder="ID"
						style="margin-bottom: 2.5%; width: 35%; height: 55px; border-radius: 10px; background-repeat: no-repeat; background-position: 9px center; padding-left: 45px; border: 2px solid #c1c1c1; box-shadow: 5px 5px 5px #EBEBEB;">
				</div>
		<div class="question">
			<div class="joinname">
				質問<br>
			</div>
				<select id="question" class="select">
	               <option value="null">質問選択</option>
	               <option value="1">一番親しい友達の名前は。</option>
	               <option value="2">初めてしてみたゲームは。</option>
	               <option value="3">一番記憶に残る場所は。</option>
	               <option value="4">一番楽しかった瞬間は。</option>
	               <option value="5">一番行ってみたい場所は。</option>
				</select>
			<div class="joinname">
				返答<br>
			</div>
			<input type="text" id="answer" class="write">
		</div>
	<input type="button" value="確認" class="box" onclick="javascript: fn_pwfind()"
		style="margin-bottom: 2.5%; width: 35%; height: 55px; border-radius: 10px; background-color: #fff; border: 2px solid #c1c1c1; box-shadow: 5px 5px 5px #EBEBEB;">
	 </div>
	</div>
</div>

<script>
	var id="";
	var question=0;
	var answer="";
	function fn_pwfind() {
		id = $("#id").val();
		question = $("#question").val();
		answer = $("#answer").val();
		$.ajax({
			type:'post',
			url:'/pwfind',
			data:JSON.stringify({"id":id,"question":question,"answer":answer}),
			contentType:'application/json',
			success:function(data) {
				if(data != ""){
					alert("該当するパスワードは"+data+"です。");
				}else{
					alert("該当するパスワードがありません。");
				}
			},error:function() {
	alert(id+" "+question+" "+answer);
				alert('통신실패');
			}
		})
	}
</script>
<%@ include file="../footer.jsp"%>