<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	
	
<%@ include file="../header.jsp"%>
<link href="/resources/css/help.css" rel="stylesheet">

<div class="help">
<div class="help_header">
	<div class="container-fluid">
		<div class="title">
			<a href="/help">FAQ</a>
		</div>
	</div>
</div>
<div class="help_content" style="height:500px;">
	<div class="container">
		<div class="faqbox">
			<table style="width:100%;">
				<thead>
					<tr style="border-top:2px solid #ccc; border-bottom:2px solid #ccc;">
						<th style="width:15%;">番号</th>
						<th style="width:45%;">タイトル</th>
						<th style="width:10%;">作者</th>
						<th style="width:10%;">作成日</th>
					</tr>
				</thead>
				<c:forEach var="help" items="${helplist }">
				<tbody>
						<tr style="border-bottom:1px solid #ccc;">
							<td class="info">${help.bno }</td>
							<td style="font-weight:600;"><a href="/helpview?bno=${help.bno }">${help.title }</a></td>
							<td class="info">管理者</td>
							<td class="info"><fmt:formatDate value="${help.rdate}" pattern="yyyy-MM-dd"/></td>
						</tr>
				</tbody>
				</c:forEach>
			</table>
		</div>
			<div style="position:relative; left:90%; margin:20px 0;">
				<c:choose>
				<c:when test="${user.role eq 'admin' }">
				<button class="btn btn-default" onclick="location='/helpwirte';" class="btn1">挙げる</button>
				</c:when>
				</c:choose>
			</div>
	</div>
</div>
</div>
<%@ include file="../footer.jsp"%>
