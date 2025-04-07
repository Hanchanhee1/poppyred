<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link href="/resources/css/noticewrite.css" rel="stylesheet">
	<div class="container" style="width:65%; margin:0 auto;">
		<div class="write_wrap">
			<h2 class="">공지사항 글쓰기</h2>
			<form name="notice" method="post" action="/noticeupdate" onsubmit="return check()">
			<input type="hidden" name="bno" value="${modify.bno }">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<table class="bord_table">
					<caption class="sr-only">공지사항 입력 표</caption>
					<colgroup>
						<col width="20%">
						<col width="*">
					</colgroup>
						<tr class="first">
							<th>제목</th>
							<td><input type="text" name="title" class="title" value="${modify.title }"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea name="contents" style="resize:none;">${modify.contents }</textarea></td>
						</tr>
					</tbody>
				</table>
				<div class="btn_wrap">
					<input type="submit" value="保存" class="btn1">&nbsp;&nbsp;
					<input type="reset" value="書き直し" class="btn1">&nbsp;&nbsp;
					<input type="button" value="目録" class="btn1"
						onClick="location.href='/event';">
				</div>
			</form>
		</div>
	</div>
<%@ include file="../footer.jsp"%>
