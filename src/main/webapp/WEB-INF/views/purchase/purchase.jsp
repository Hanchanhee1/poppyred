<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../header.jsp"%>
<link href="/resources/css/purchase.css" rel="stylesheet">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>


<div class="container">
	<div class="purpage" style="margin:60px 0;">
		<div class="row">
			<div class="col-md-6">
				<div class="top">
					<h3 style="font-weight:800;">注文・決済</h3>
					<div class="address">
						<label for="address" style="font-weight:700;">お届け先</label>
						<div class="inputaddress" style="display:inline-block;">
					<button type="button" class="btn btn-default shipping-btn" data-toggle="modal" data-target="#myModal">
					<img src="/resources/images/address.png" style="width:20px; height:20px;"><span style="font-weight:700;">
						<span aria-hidden="true"></span> お届とどけ先 入力</span>
					</button>
						</div>
					</div>
				</div>
				<div class="mid">
					<h4 style="font-weight:700;">注文者情報</h4>
					<div class="userinfo">
						<label>お名前</label><span style="margin-left:12%;" id="username">${user.name}</span><br>
						<label>ID</label><span style="margin-left:17%;" id="userid">${user.id }</span><br>
						<label>e-mail</label><span style="margin-left:12%;" id="userid">${user.email }</span>
					</div>
				</div>
				<div class="bottom">
					<div style="padding-bottom:5px; border-bottom:2px solid #ccc;">
						<h4 style="font-weight:700;">注文商品</h4>全<span id="total_quantity"></span>個
					</div>
					<div class="list">
						<c:forEach var="plist" items="${plist }" varStatus="status">
						<c:set var="total_quantity" value="${total_quantity + plist.amount }"></c:set>
						<c:set var="total_price" value="${total_price + plist.tot_price }"></c:set>
						<table style="width:100%;">
							<tr>
								<td style="width:23%;">
									<img src="/photo/${plist.mvo.menuAttachVo.uploadpath }/${plist.mvo.menuAttachVo.uuid}_${plist.mvo.menuAttachVo.uploadfile}" style="width:100px; height:130px;">
								</td>
								<td style="width:37%;">${plist.mvo.pro_name }</td>
								<td style="width:20%;">${plist.amount }個</td>
								<td style="width:20%;"><span style="font-weight:700; font-size:18px;"><fmt:formatNumber type="number" pattern="#,###" value="${plist.tot_price}" /></span>￥
							</tr>
						</table>
						</c:forEach>
						<c:set var="pro_name" value="${plist[0].mvo.pro_name }"></c:set>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="box">
					<table style="width:100%;">
						<tr>
							<td style="width:70%; height:40px;">商品金額</td>
							<td><span class="total_price" style="font-weight:700; font-size:18px;"><fmt:formatNumber type="number" pattern="#,###" value="${total_price}" /></span>￥</td>
						</tr>
						<tr>
							<td style="height:40px;">送料</td>
							<td><span style="font-weight:700; font-size:18px;">無料</span></td>
						</tr>
					</table>
					<div class="total">
						<table>
							<tr>
								<td style="width:66%;">
									<span style="font-weight:800; font-size:18px;">最終決済金額</span>
								</td>
								<td>
									<span class="total_price" style="font-weight:800; font-size:22px;"><fmt:formatNumber type="number" pattern="#,###" value="${total_price}" /></span>￥
								</td>
							</tr>
						</table>
					</div>
					<div style="position:relative; right:60px;">
						<button class="btn btn-default" onclick="requestPay()">決済する</button>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">お届とどけ先 追加</h4>
				</div>

				<div class="modal-body">
					<form class="form-horizontal shipping-info" onsubmit="submitShippingInfo(event)">
						<div class="form-group">
							<label for="inputreceive" class="col-sm-2 control-label">受領人</label>
							<div class="col-sm-10">
								<input type="text" id="receive" class="form-control" style="width:20%">
							</div>
						</div>
						<div class="form-group">
							<label for="inputpostcode" class="col-sm-2 control-label">郵便番号</label>
							<div class="col-sm-10">
								<input type="text" id="sample6_postcode" class="form-control" placeholder="郵便番号" style="width:40%; display:unset;">
								<input type="button"  class="btn btn-default" onclick="sample6_execDaumPostcode()" value="郵便番号探し">
							</div>
						</div>
						<div class="form-group">
							<label for="inputaddress" class="col-sm-2 control-label">住所</label>
							<div class="col-sm-10">
								<input type="text" id="sample6_address" class="form-control" placeholder="住所" style="width:80%;">
								<input type="text" id="sample6_detailAddress" class="form-control" placeholder="詳細住所" style="width:60%; display:unset;">
								<input type="text" id="sample6_extraAddress" class="form-control" placeholder="参考項目" style="width:30%; display:unset;">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-default">登録</button>
								<button type="button" class="btn btn-default" onclick="cancelShippingInfo()">キャンセル</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
<script>
	
	$(function() {
		$("#total_quantity").html('<c:out value="${total_quantity }"></c:out>');
		$(".total_price").html('<fmt:formatNumber type="number" pattern="#,###" value="${total_price}" />');
	})

	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var addr = ''; 
						var extraAddr = ''; 
						if (data.userSelectedType === 'R') { 
							addr = data.roadAddress;
						} else { 
							addr = data.jibunAddress;
						}
						if (data.userSelectedType === 'R') {
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName
										: data.buildingName);
							}
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							document.getElementById("sample6_extraAddress").value = extraAddr;
						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
	
	var globalAddress = '';
    var globalPostcode = '';
	
	function submitShippingInfo(e) {
		e.preventDefault(); 
		var receiveName = document.getElementById('receive').value;
		var postCode = document.getElementById('sample6_postcode').value;
		var address = document.getElementById('sample6_address').value;
		var detailAddress = document.getElementById('sample6_detailAddress').value;
		var extraAddress = document.getElementById('sample6_extraAddress').value;
		var shippingInfoContainer = document.querySelector('.inputaddress');
		if (shippingInfoContainer) {
			shippingInfoContainer.innerHTML =
												receiveName + '<br>' +
												postCode + ', ' +
												address + ', ' +
												detailAddress + ' ' +
												extraAddress;
		}
		
		globalAddress = document.getElementById('sample6_address').value + ' ' + document.getElementById('sample6_detailAddress').value;
		globalPostcode = document.getElementById('sample6_postcode').value;

		var shippingBtn = document.querySelector('.shipping-btn');
		if (shippingBtn) {
			shippingBtn.style.display = 'none';
		}
		$('#myModal').modal('hide'); 
	}

	function cancelShippingInfo() {
		$('#myModal').modal('hide'); 
	}
	
	var totalAmount = ${total_price};
	var totalCount = ${total_quantity };
	var i = 0;
	
	
	IMP.init("imp47613671");
    function requestPay() {
	        var buyerAddr = globalAddress || '基本住所';
	        var buyerPostcode = globalPostcode || '基本郵便番号';
	        var buyerName = '${user.name}';//유저이름
	        var buyerId = '${user.id}';//유저아이디
	        
        IMP.request_pay({
            pg: 'html5_inicis',
            pay_method: "card",
            merchant_uid: i,   // 주문번호
            name: 'パピーレッド',
            amount: ${total_price},
			buyer_email: '${user.email}',
			buyer_name: buyerName,
			buyer_addr: buyerAddr
			
        }, function (rsp) { // callback
        	if(rsp.success){
	        	var orderdata = {
	        	userid : '${user.id}',
	        	receiver : buyerName,
	        	all_price : ${total_price},
	        	all_amount : ${total_quantity},
	        	delivery : "決済完了",
	        	address : buyerAddr,
	        	pro_name : '<c:out value="${pro_name }"></c:out>'
	        	};
	        
	            $.ajax({
	                type: 'POST',
	                url: '/purchase',
					data:JSON.stringify(orderdata),
					contentType:'application/json',
					success: function(response) {
						if (response != null) {
							i++;
							 location.href = "/done";
						} else {
							alert("決済中にエラーが発生しました。 もう一度お試しください。");
						}
					},
					error: function(status, error) {
					}
	            });
        		
        	} else {
        		alert("실패");
        		
        	}
        	
        });
    }
	
</script>
<%@ include file="../footer.jsp"%>