<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="done">
	<p>決済が完了しました。</p>
	<p>ご注文ありがとうございます。</p>
	<button class="btn btn-default" onclick="location='/main'">メインへ</button>
</div>
<style>
	.done {
		border:2px solid #ccc; 
		border-radius:10px; 
		padding:110px 0; 
		width:43%; 
		margin:90px auto;
	}
	.done p {
		font-weight:700;
		font-size:18px;
		text-align:center;
	}
	.done .btn {
		position:relative;
		left:50%;
		transform: translate(-50%, 0);
		margin:10px 0;
	}
</style>
<%@ include file="../footer.jsp" %>