<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file = "../header.jsp"%>

<link href="/resources/css/noticeview.css" rel="stylesheet">
<div class="container">
		<div class="board_view">
			<h2>${view.title }</h2>
			<p class="info"><span class="username">ADMIN</span> | <span class="date"><fmt:formatDate value="${view.rdate}" pattern="yyyy-MM-dd"/></span></p>
			<div class="content">${view.contents }</div>
			<div class="prev_next">
				<a href="/noticeview?bno=${prevo.bno }" class="btn_prev"><i class="fa fa-angle-left"></i>
				<span class="prev_wrap">
					<strong>이전글</strong><span></span>
				</span>
				</a>
				<div class="btn_3wrap">
					<a href="/event">目録</a> <a href="/noticemodify?bno=${view.bno }">修正</a> <a href="/noticedelete?bno=${view.bno }" onClick="return confirm('削除しますか。')">削除</a>
				</div>
				<a href="/noticeview?bno=${nextvo.bno }" class="btn_next">
				<span class="next_wrap">
					<strong>다음글</strong><span></span>
				</span>
				<i class="fa fa-angle-right"></i></a>
			</div>
		</div>
	</div>
<%@ include file = "../footer.jsp"%>
