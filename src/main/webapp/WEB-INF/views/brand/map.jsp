<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="/resources/css/map.css" rel="stylesheet">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../header.jsp"%>
<title>매장 위치</title>
</head>
<body>
	<div class="content" style="margin-bottom: 70px;">
		<p style="margin-top: 30px; margin-bottom: 40px; font-size: 28px; font-weight: bold;">매장위치</p>
		<div class="map" id="inf">
			<p align="center">
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3163.793095414915!2d126.87631921564743!3d37.53637433361191!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9e9825bc27f7%3A0x6662bd7a5253af53!2z7Jqw7ISx7JeQ7Y6g7YOA7Jq0!5e0!3m2!1sko!2skr!4v1613310853103!5m2!1sko!2skr"
					width="100%" height="500" frameborder="0" style="border: 0; border-radius: 20px;"
					allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
			</p>
		</div>
	
	<div class="address">
		<h2 style="font-size: 30px; font-weight: bold;">퍼피레드 본점</h2>
		<div class="addresscontent">
			<p>주소 : 대전 뿡뿡구 뿡뿡동 뿡뿡이 빌라</p>
			<a>이메일 : wjdgkrud4108@naver.com</a>
		</div>
	</div>
	<button type="button" class="button">구글맵으로 보기</button>
	</div>
</body>
<footer><%@ include file="../footer.jsp"%></footer>
</html>
