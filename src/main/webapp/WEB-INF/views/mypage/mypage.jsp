<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link href="/resources/css/mypage.css" rel="stylesheet">

<div class="mypage">
<div class="mypage_header">
	<div class="container-fluid">
		<div class="title">
			<a href="/mypage">Mypage</a>
		</div>
		<div class="mypage_tab">
			<div class="select_mypage">
			  <!-- Nav tabs -->
			  <ul class="nav nav-tabs" role="tablist" id="detail_nav">
			    <li role="presentation"><a href="#usermanage" id="usermanage1" aria-controls="usermanage" role="tab" data-toggle="tab" style="color:#ccc; padding:0 50px;">会員管理</a></li>
			    <li role="presentation" class="active"><a href="#carttab" id="cart1" aria-controls="carttab" role="tab" data-toggle="tab" style="color:#ccc; padding:0 50px;">カート</a></li>
			    <li role="presentation"><a href="#sendview" id="sendview1" aria-controls="sendview" role="tab" data-toggle="tab" style="color:#ccc; padding:0 50px;">注文・配送</a></li>
			  </ul>
			</div>
		</div>
	</div>
</div>
<div class="mypage_content">
	<div class="container">
		<!-- Tab panes -->
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane" id="usermanage">
				<%@ include file="../mypage/usermanage.jsp" %>
			</div>
			<div role="tabpanel" class="tab-pane active" id="carttab">
				<%@ include file="../mypage/cart.jsp" %>
			</div>
			<div role="tabpanel" class="tab-pane" id="sendview">
				<%@ include file="../mypage/send.jsp" %>
			</div>
		</div>
	</div>
</div>
</div>
<script>
	$(function() {
		$("#cart1").css("color","#000");
		$("#cart1").attr("disabled","true")
		
		$("#usermanage1").on("click",function() {
			$(this).css("color","#000");
			$("#cart1").css("color","#ccc");
			$("#sendview1").css("color","#ccc");
			$(this).attr("disabled","true");
			$("#cart1").removeAttr("disabled");
			$("#sendview1").removeAttr("disabled");
		})
		$("#cart1").on("click",function() {
			$("#usermanage1").css("color","#ccc");
			$(this).css("color","#000");
			$("#sendview1").css("color","#ccc");
			$(this).attr("disabled","true");
			$("#usermanage1").removeAttr("disabled");
			$("#sendview1").removeAttr("disabled");
		})
		$("#sendview1").on("click",function() {
			$("#usermanage1").css("color","#ccc");
			$("#cart1").css("color","#ccc");
			$(this).css("color","#000");
			$(this).attr("disabled","true");
			$("#usermanage1").removeAttr("disabled");
			$("#cart1").removeAttr("disabled");
		})
	})
</script>
<%@ include file="../footer.jsp"%>
