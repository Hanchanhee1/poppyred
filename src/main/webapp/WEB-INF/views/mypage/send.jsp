<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link href="/resources/css/send.css" rel="stylesheet">
<div class="sendpage" style="margin-top:58px; margin-bottom:250px;">
		<div class="mid">
			<table style="width:100%;">
				<thead>
					<tr>
						<th class="head">注文日</th>
						<th class="head">商品情報</th>
						<th class="head">注文数量</th>
						<th class="head">注文金額</th>
						<th class="head">受領人</th>
					</tr>
				</thead>
				<c:forEach var="olist" items="${olist }">
				<tbody>
					<tr style="border-bottom:2px solid #ccc;">
						<td>${olist.rdate }</td>
						<td class="info">${olist.pro_name }</td>
						<td class="info">
						${olist.all_amount }個
						</td>
						<td class="info">${olist.all_price }￥</td>
						<td class="info">${user.id }</td>
					</tr>
				</tbody>
				</c:forEach>
			</table>
		</div>
</div>
