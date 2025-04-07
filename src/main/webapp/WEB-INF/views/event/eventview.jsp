<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<%@ include file="../header.jsp"%>
<link href="/resources/css/eventview.css" rel="stylesheet">
<div class="container">
	<h2>パピーレッド <br> イベント＆ニュース</h2>
		<div class="title">
			${view.title }
		</div>
		<div style="text-align:center;">
			<c:forEach var="imglist" items="${view.eventAttachList }">
				<img alt="" src="/photo/${imglist.uploadpath}/${imglist.uuid}_${imglist.uploadfile}" class="img">
			</c:forEach>
		</div>
			<button onclick="location='/event'" class="btn1">目録へ</button>
			<button onclick="location='/eventdelete?bno=${view.bno}'" class="btn2">削除</button>
</div>
<%@ include file="../footer.jsp"%>
