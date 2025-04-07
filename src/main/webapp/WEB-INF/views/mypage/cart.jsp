<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link href="/resources/css/cart.css" rel="stylesheet">
<div class="cartpage">
	<div style="margin:10px 0;">
		<div style="padding-left:0 20px;">
			<input type="checkbox" id="entire" name="agree" style="width:20px; height:20px; position:relative; top:6px;"><label for="entire"><span style="font-size:18px; font-weight:800; position:relative; top:2px; padding:0 10px;">全体選択</span></label>
			<img src="/resources/images/trash.png" id="delete" style="width:20px; hegiht:20px;"><span style="font-size:18px; font-weight:800; position:relative; top:2px; padding:0 10px;">選択商品削除</span>
		</div>
	</div>
		<div class="mid">
			<table style="width:100%;">
				<thead>
					<tr>
						<th class="head">商品情報</th>
						<th class="head">注文数量</th>
						<th class="head">注文金額</th>
						<th class="head">送料</th>
					</tr>
				</thead>
				<c:set var="total_price" value="0"></c:set>
				<c:set var="checkIndex" value="0"></c:set>
				<c:forEach var="clist" items="${clist}">
				<c:set var="checkIndex" value="${checkIndex+1}"></c:set>
				<tbody>
					<tr style="border-bottom:2px solid #ccc;">
						<td style="width:500px;">
							<div class="product">
								<input type="checkbox" id="product${checkIndex}" data-pro_code="${clist.pro_code}" name="agree" style="width:20px; height:20px; position:relative; top:8px; margin-right:20px;">
								<img src="/photo/${clist.mvo.menuAttachVo.uploadpath }/${clist.mvo.menuAttachVo.uuid}_${clist.mvo.menuAttachVo.uploadfile}" style="width:100px; height:130px;">
								<span style="margin:0 20px;">${clist.mvo.pro_name}</span>
							</div>
						</td>
						<td class="info">${clist.amount }個</td>
						<td class="info">
						<span class="tot_price"><fmt:formatNumber type="number" pattern="#,###" value="${clist.tot_price}" />
						</span>￥
						</td>
						<td class="info">無料</td>
						<c:set var="total_price" value="${total_price + clist.tot_price}"></c:set>
					</tr>
				</tbody>
				</c:forEach>
			</table>
		</div>
		<div class="bottom">
			<p>全注文金額 <span style="color:#FF4343"></span>個</p>
			<p><span id="total_price"><fmt:formatNumber type="number" pattern="#,###" value="${total_price}" /> </span>
			￥ + 無料 = <fmt:formatNumber type="number" pattern="#,###" value="${total_price}" /> ￥</p>
		</div>
		<div style="text-align:center; padding:30px 0;">
			<button class="btn btn-default" id="buy">購入する</button>
		</div>
</div>
<script>
	$(function() {
		var chkList = $("input[name=agree]");
		//name이 agree인 모든 속성을 가지고 와라
		$("#entire").on("click", function() {
			//아이디 이름이 chkCtrl 선택자를 클릭했을 때
			if ($(this).is(":checked")) {
				//현재 자신선택자가 체크상태이면 
				chkList.prop("checked", true);
				//chkList 체크상태를 모두 true
			} else {
				chkList.prop("checked", false);
			}
		})
		$("#delete").on("click",function() {
			var i = 1;
				if($("#product"+1).is(":checked",true)){
				var pro_code = $("#product"+i).data("pro_code");
				$.ajax({
					type:"delete",
					url:"/deleteCart/"+pro_code,
					success:function(data) {
						alert("カートから削除しました。");
						location.reload();
					},error:function() {
						alert("통신실패");
					}
				})
			}
			
		})
		
		$("#buy").on("click",function() {
			if(${clist[0].pro_code!=null}){
				location.href='/purchase?id=${user.id}';
			}else{
				alert("商品がありません。");
				return;
			}
		})
	})
</script>
