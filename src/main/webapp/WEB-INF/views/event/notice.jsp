<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<link href="/resources/css/notice.css" rel="stylesheet">

		<div class="board_list">
			<table class="bord_table" summary="이표는 번호,제목,글쓴이,날자,조회수로 구성되어 있습니다">
				<caption class="sr-only">공지사항 리스트</caption>
				<colgroup>
					<col width="100px">
					<col width="1000px">
					<col width="200px">
					<col width="180px">
				</colgroup>
				<thead>
					<tr class= "content">
						<th>番号</th>
						<th>タイトル</th>
						<th>筆者</th>
						<th>作成日</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="notice" items="${list}">
						<tr>
							<td class="num">${notice.bno }</td>
							<td class="title"><a href="/noticeview?bno=${notice.bno }" style="float:left; font-size:16px;">${notice.title }</a></td>
							<td class="writer">ADMIN</td>
							<td class="date"><fmt:formatDate value="${notice.rdate}" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		<div class="paging">
			<a href=""><i class="fa  fa-angle-double-left"></i></a>
			<a href=""><i class="fa fa-angle-left"></i></a>
			<c:forEach var="num" begin="${pagemaker.startPage}" end="${pagemaker.endPage}">
			<a href="/event?pageNum=${num}&amount=${pagemaker.cri.amount}" class="${pagemaker.cri.pageNum == num?'active':''}">${num }</a>
			</c:forEach>
			<a href=""><i class="fa fa-angle-right"></i></a>
			<a href=""><i class="fa  fa-angle-double-right"></i></a>
		</div>
			<div style="position:relative; left:90%; margin:20px 0;">
				<c:choose>
				<c:when test="${user.role eq 'admin' }">
				<button onclick="location='/noticewrite';" class="btn1">挙げる</button>
				</c:when>
				</c:choose>
			</div>
		</div>
