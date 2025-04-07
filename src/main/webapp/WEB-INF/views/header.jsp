<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>パピーレッド</title>
<link rel="icon" href="./favicon.ico">
<!-- Latest compiled and minified CSS -->
<!-- Latest compiled and minified CSS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/js/bootstrap.min.js"></script>
<script src="/resources/js/bootstrap.js"></script>
<link href="/resources/css/bootstrap.css" rel="stylesheet">
<link href="/resources/css/main.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@2.0/nanumsquare.css">
<!-- Latest compiled and minified JavaScript -->

</head>
<body>
	<div class="header">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-3" style="left:6%;">
					<span id="logo"><a href="/"><img src="/resources/images/logo.png" style="width:160px; height:80px;"></a></span>
				</div>
				<div class="col-md-6" style="margin:40px 0;">
					<span class="brand" id="bar"><a href="/intro">Brand</a></span>
					<span class="menu" id="bar"><a href="/menu">Menu</a></span>
					<span class="shop" id="bar"><a href="/shop">Shop</a></span>
					<span class="event" id="bar"><a href="/event">Event</a></span>
					<span class="help" id="bar"><a href="/helplist">Help</a></span>
				</div>
				<div class="col-md-3" style="margin:40px 0;">
				<c:choose>
					<c:when test="${empty user }">
					<c:out value="${user.id }"></c:out>
					<!-- 로그인 전 -->
					<span class="user" id="login"><a href="/login">Login</a></span>
					<span class="user" id="register"><a href="/join">Join</a></span>
					</c:when>
					<c:when test="${not empty user }">
					<c:if test="${user.role eq 'admin' }">
					<!-- 로그인 후 -->
					<span class="user" id="mypage">admin</span>
					<span class="user" id="mypage"><a href="/mypage?id=${user.id }">Mypage</a></span>
					<span class="user" id="register"><a href="/logout">Logout</a></span><br>
					<!-- 관리자 -->
					<span class="user" id="admin"><a href="/admin">管理者ページへ</a></span>
					</c:if>
					<c:if test="${user.role ne 'admin' }">
					<span class="user" id="mypage">${user.name }　様</span>
					<span class="user" id="mypage"><a href="/mypage?id=${user.id }">Mypage</a></span>
					<span class="user" id="register"><a href="/logout">Logout</a></span>
					</c:if>
					</c:when>
				</c:choose>
				</div>
			</div>
		</div>
	</div>
<div class="scroll_top">
	<a href="javascript:fn_top();"><img src="/resources/images/vector.png" style="width:60px; height:80px;"></a>
</div>
<script>
	function fn_top() {
		window.scrollTo({
			top:0
		})
	}
</script>