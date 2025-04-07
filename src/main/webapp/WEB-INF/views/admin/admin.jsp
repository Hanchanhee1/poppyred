<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link href="/resources/css/admin.css" rel="stylesheet">
<div class="container">
	<div class="well">
	<div class="savemenu">
		<a href="/" class="btn btn-default pull-right">メインページへ</a>
		<h2>メニュー登録</h2>
		<form name="admin" enctype="multipart/form-data"
			class="form-horizontal">
			<div class="form-group preview">
				<div class="col-sm-offset-2 col-sm-10">
					<div id="imagePreview" class="image-placeholder">
						<p
							style="width: 250px; height: 320px; line-height: 320px; text-align: center; border: 1px solid #ddd; background-color: #f7f7f7;">サンプル</p>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="pro_code" class="col-sm-2 control-label">pro_code</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="pro_code"
						name="pro_code">
				</div>
			</div>
			<div class="form-group">
				<label for="pro_name" class="col-sm-2 control-label">pro_name</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="pro_name"
						name="pro_name">
				</div>
			</div>
			<div class="form-group">
				<label for="pro_price" class="col-sm-2 control-label">pro_price</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="pro_price"
						name="pro_price">
				</div>
			</div>
			<div class="form-group">
				<label for="image" class="col-sm-2 control-label">img</label>
				<div class="col-sm-10">
					<input type="file" class="form-control" id="image"
						name="uploadfile">
				</div>
			</div>
			<div class="form-group">
				<label for="pro_contents" class="col-sm-2 control-label">pro_contents</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="pro_contents"
						name="pro_contents">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="button" class="input">登録</button>
				</div>
			</div>
		</form>
		</div>
		<div class="savelist">
			<div class="well">
				<c:forEach var="list" items="${list}">
						<img
							src="/photo/${list.menuAttachVo.uploadpath }/${list.menuAttachVo.uuid}_${list.menuAttachVo.uploadfile}"
							style="width: 180px; height: 180px;" alt="">

						<div class="list">
							<p>pro_code: ${list.pro_code}</p>
							<p>pro_name: ${list.pro_name}</p>
							<p>pro_price: ${list.pro_price}</p>
							<p>pro_contents: ${list.pro_contents}</p>
						</div>
				</c:forEach>
			</div>
		</div>

	</div>
</div>
</body>

<script>
	$(".input").click(function() {
		alert("登録しました。")
		var form = document.admin;
		form.method = 'post';
		form.action = '/uploadmenu';
		form.submit();
	})

	document
			.getElementById('image')
			.addEventListener(
					'change',
					function(event) {
						var output = document.getElementById('imagePreview');
						if (event.target.files && event.target.files[0]) {
							var reader = new FileReader();
							reader.onload = function(e) {
								output.innerHTML = '<img src="' + e.target.result + '" class="img-responsive" style="max-width: 250px; height: 320px;">';
							};
							reader.readAsDataURL(event.target.files[0]);
						} else {
							output.innerHTML = '<p style="width: 250px; height: 320px; line-height: 320px; text-align: center; border: 1px solid #ddd; background-color: #f7f7f7;">미리보기</p>';
						}
					});
</script>
<%@ include file="../footer.jsp"%>