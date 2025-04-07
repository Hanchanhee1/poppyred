<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link href="/resources/css/shop.css" rel="stylesheet">

<div class="shoppage">
<div class="shop_header">
	<div class="container-fluid">
		<div class="title">
			<a href="/shop">Shop</a>
		</div>
		<div class="shop_tab">
			<div class="select_menu">
			  <!-- Nav tabs -->
			  <ul class="nav nav-tabs" role="tablist" id="detail_nav">
			    <li role="presentation" class="active"><a href="#all" id="all1" aria-controls="all" role="tab" data-toggle="tab" style="color:#ccc; padding:0 50px;">All</a></li>
			    <li role="presentation" ><a href="#drink" id="drink1" aria-controls="drink" role="tab" data-toggle="tab" style="color:#ccc; padding:0 50px;">Drink</a></li>
			    <li role="presentation"><a href="#desert" id="desert1" aria-controls="desert" role="tab" data-toggle="tab" style="color:#ccc; padding:0 50px;">Desert</a></li>
			    <li role="presentation"><a href="#goods" id="goods1" aria-controls="goods" role="tab" data-toggle="tab" style="color:#ccc; padding:0 50px;">Goods</a></li>
			  </ul>
			</div>
		</div>
	</div>
</div>
<div class="shop_content">
	<div class="container">
		<!-- Tab panes -->
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="all">
				<c:forEach var="all" items="${list }">
				<!--  -->
				<div class="shop_container">
					<div class="shop_box">
						<a href="/shop/shopdetail?pro_code=${all.pro_code}"><img src="/photo/${all.menuAttachVo.uploadpath }/${all.menuAttachVo.uuid}_${all.menuAttachVo.uploadfile}" style="width:294px; height:294px;"></a>
							<div class="shop_price">
								<p id="name">${all.pro_name}</p>
								<p id="price"><fmt:formatNumber type="number" pattern="#,###" value="${all.pro_price }" />￥</p>
							</div>
					</div>
				</div>
				<!--  -->
				</c:forEach>
			</div>
			<div role="tabpanel" class="tab-pane" id="drink">
				<c:forEach var="drlist" items="${drlist }">
				<!--  -->
				<div class="shop_container">
					<div class="shop_box">
						<a href="/shop/shopdetail?pro_code=${drlist.pro_code}"><img src="/photo/${drlist.menuAttachVo.uploadpath }/${drlist.menuAttachVo.uuid}_${drlist.menuAttachVo.uploadfile}" style="width:294px; height:294px;"></a>
							<div class="shop_price">
								<p id="name">${drlist.pro_name}</p>
								<p id="price"><fmt:formatNumber type="number" pattern="#,###" value="${drlist.pro_price }" />￥</p>
							</div>
					</div>
				</div>
				<!--  -->
				</c:forEach>
			</div>
			<div role="tabpanel" class="tab-pane" id="desert">
				<c:forEach var="delist" items="${delist }">
				<!--  -->
				<div class="shop_container">
					<div class="shop_box">
						<a href="/shop/shopdetail?pro_code=${delist.pro_code}"><img src="/photo/${delist.menuAttachVo.uploadpath }/${delist.menuAttachVo.uuid}_${delist.menuAttachVo.uploadfile}" style="width:294px; height:294px;"></a>
							<div class="shop_price">
								<p id="name">${delist.pro_name}</p>
								<p id="price"><fmt:formatNumber type="number" pattern="#,###" value="${delist.pro_price }" />￥</p>
							</div>
					</div>
				</div>
				<!--  -->
				</c:forEach>
			</div>
			<div role="tabpanel" class="tab-pane" id="goods">
				<c:forEach var="glist" items="${glist }">
				<!--  -->
				<div class="shop_container">
					<div class="shop_box">
						<a href="/shop/shopdetail?pro_code=${glist.pro_code}"><img src="/photo/${glist.menuAttachVo.uploadpath }/${glist.menuAttachVo.uuid}_${glist.menuAttachVo.uploadfile}" style="width:294px; height:294px;"></a>
							<div class="shop_price">
								<p id="name">${glist.pro_name}</p>
								<p id="price"><fmt:formatNumber type="number" pattern="#,###" value="${glist.pro_price }" />￥</p>
							</div>
					</div>
				</div>
				<!--  -->
				</c:forEach>
			</div>
		</div>
	</div>
</div>
</div>
<script>
	$(function() {
		
		$("#all1").css("color","#000");
		$("#all1").attr("disabled","true")
		
		$("#all1").on("click",function() {
			$(this).css("color","#000");
			$("#drink1").css("color","#ccc");
			$("#desert1").css("color","#ccc");
			$("#goods1").css("color","#ccc");
			$(this).attr("disabled","true");
			$("#drink1").removeAttr("disabled");
			$("#desert1").removeAttr("disabled");
			$("#goods1").removeAttr("disabled");
		})
		$("#drink1").on("click",function() {
			$("#all1").css("color","#ccc");
			$(this).css("color","#000");
			$("#desert1").css("color","#ccc");
			$("#goods1").css("color","#ccc");
			$(this).attr("disabled","true");
			$("#all1").removeAttr("disabled");
			$("#desert1").removeAttr("disabled");
			$("#goods1").removeAttr("disabled");
		})
		$("#desert1").on("click",function() {
			$("#all1").css("color","#ccc");
			$("#drink1").css("color","#ccc");
			$(this).css("color","#000");
			$("#goods1").css("color","#ccc");
			$(this).attr("disabled","true");
			$("#all1").removeAttr("disabled");
			$("#drink1").removeAttr("disabled");
			$("#goods1").removeAttr("disabled");
		})
		$("#goods1").on("click",function() {
			$("#all1").css("color","#ccc");
			$("#drink1").css("color","#ccc");
			$("#desert1").css("color","#ccc");
			$(this).css("color","#000");
			$(this).attr("disabled","true");
			$("#all1").removeAttr("disabled");
			$("#drink1").removeAttr("disabled");
			$("#desert1").removeAttr("disabled");
		})
	})
</script>
<%@ include file="../footer.jsp"%>
