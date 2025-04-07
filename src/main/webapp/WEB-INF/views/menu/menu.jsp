<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link href="/resources/css/menu.css" rel="stylesheet">

<div class="menu_header">
	<div class="container-fluid">
		<div class="title">
			<a href="/menu">Menu</a>
		</div>
		<div class="menu_tab">
			<div class="select_menu">
			  <!-- Nav tabs -->
			  <ul class="nav nav-tabs" role="tablist" id="detail_nav">
			    <li role="presentation" class="active"><a href="#all" id="all1" aria-controls="all" role="tab" data-toggle="tab" style="color:#ccc; padding:0 50px;">All</a></li>
			    <li role="presentation"><a href="#drink" id="drink1" aria-controls="drink" role="tab" data-toggle="tab" style="color:#ccc; padding:0 50px;">Drink</a></li>
			    <li role="presentation"><a href="#desert" id="desert1" aria-controls="desert" role="tab" data-toggle="tab" style="color:#ccc; padding:0 50px;">Desert</a></li>
			    <li role="presentation"><a href="#goods" id="goods1" aria-controls="goods" role="tab" data-toggle="tab" style="color:#ccc; padding:0 50px;">Goods</a></li>
			  </ul>
			</div>
		</div>
	</div>
</div>
<div class="menu_content">
	<div class="container">
		<!-- Tab panes -->
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="all">
				<c:forEach var="all" items="${list }">
				<!--  -->
				<div class="menu_container">
					<div class="menu_box">
						<img src="/photo/${all.menuAttachVo.uploadpath }/${all.menuAttachVo.uuid}_${all.menuAttachVo.uploadfile}" style="width:294px; height:294px;">
							<div class="menu_price">
								<p id="name">${all.pro_name}</p>
								<p id="price">${all.pro_price }￥</p>
							</div>
						<div class="menu_bottom">
							<button type=button class="detail" data-pro_code="${all.pro_code}">詳しく見る</button>
						</div>
					</div>
				</div>
				<!--  -->
				</c:forEach>
			</div>
			<div role="tabpanel" class="tab-pane" id="drink">
				<c:forEach var="drlist" items="${drlist }">
				<!--  -->
				<div class="menu_container">
					<div class="menu_box">
						<img src="/photo/${drlist.menuAttachVo.uploadpath }/${drlist.menuAttachVo.uuid}_${drlist.menuAttachVo.uploadfile}" style="width:294px; height:294px;">
							<div class="menu_price">
								<p id="name">${drlist.pro_name}</p>
								<p id="price">${drlist.pro_price }￥</p>
							</div>
						<div class="menu_bottom">
							<button type=button class="detail" data-pro_code="${drlist.pro_code}">詳しく見る</button>
						</div>
					</div>
				</div>
				<!--  -->
				</c:forEach>
			</div>
			<div role="tabpanel" class="tab-pane" id="desert">
				<c:forEach var="delist" items="${delist }">
				<!--  -->
				<div class="menu_container">
					<div class="menu_box">
						<img src="/photo/${delist.menuAttachVo.uploadpath }/${delist.menuAttachVo.uuid}_${delist.menuAttachVo.uploadfile}" style="width:294px; height:294px;">
							<div class="menu_price">
								<p id="name">${delist.pro_name}</p>
								<p id="price">${delist.pro_price }￥</p>
							</div>
						<div class="menu_bottom">
							<button type=button class="detail" data-pro_code="${delist.pro_code}">詳しく見る</button>
						</div>
					</div>
				</div>
				<!--  -->
				</c:forEach>
			</div>
			<div role="tabpanel" class="tab-pane" id="goods">
				<c:forEach var="glist" items="${glist }">
				<!--  -->
				<div class="menu_container">
					<div class="menu_box">
						<img src="/photo/${glist.menuAttachVo.uploadpath }/${glist.menuAttachVo.uuid}_${glist.menuAttachVo.uploadfile}" style="width:294px; height:294px;">
							<div class="menu_price">
								<p id="name">${glist.pro_name}</p>
								<p id="price">${glist.pro_price }￥</p>
							</div>
						<div class="menu_bottom">
							<button type=button class="detail" data-pro_code="${glist.pro_code}">詳しく見る</button>
						</div>
					</div>
				</div>
				<!--  -->
				</c:forEach>
			</div>
		</div>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
      <div class="form-group">
        <img id="modal_img" style="width:294px; height:294px; position:relative; left:24%;">
        <div id="modal_name" style="text-align:center; font-size:22px; font-weight:800; padding:10px 0;"></div>
        <div id="modal_price" style="color:pink; font-size:18px; text-align:center;"></div>
        <div id="modal_contents" style="padding:10px 0;"></div>
      </div>
      </div>
    </div>
  </div>
</div>
<script>
	$(function() {
		var photo_html = "";
		var name_html = "";
		var price_html = "";
		var contents_html = "";
		$(".detail").on("click",function() {
			const pro_code = $(this).data("pro_code");
			$.getJSON('/menu/detail/'+pro_code, function(data) {
				var vo = data;
				name_html = vo.pro_name;
				price_html = vo.pro_price;
				contents_html = vo.pro_contents;
				$("#modal_img").attr("src","/photo/"+vo.menuAttachVo.uploadpath+"/"+vo.menuAttachVo.uuid+"_"+vo.menuAttachVo.uploadfile);
				$("#modal_name").html(name_html);
				$("#modal_price").html(price_html);
				$("#modal_contents").html(contents_html);
				$(".modal").modal("show");
			})
		})
	})
</script>
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
