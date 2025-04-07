<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="/resources/css/review.css" rel="stylesheet">
<div class="reviewpage">
	<div class="content">
		<div class="reviewbox">
			<div class="user">
				<span>${user.name}</span>様
			</div>
			<div class="writebox">
				<textarea placeholder="レビューを作成してください" id="comment" class="write" style="resize:none; width:70%; height:70px; outline: none; border-radius:5px; padding-left:10px; padding-top:10px;"></textarea>
				<button id="writecomment" class="btn btn-default">登録</button>
			</div>
		</div>
		<div style="border:2px solid #ccc;"></div>
		<!--  -->
		<div class="commentbox" style="position:relative; height:500px;">
		
		</div>
		<!--  -->
	</div>
	<div style="height:120px;"></div>	
</div>
<script>
$(function() {
	function getlist() {
	const pro_code = '${vo.pro_code}';
	$.getJSON('/shop/shopdetail/'+pro_code, function(data) {
			var list = data.list;
			var comment_html="";
			for(i=0; i< list.length; i++) {
				var content = list[i].contents;
				comment_html += '<div class="row">'
				+'<div class="col-md-8" style="padding:10px 0; text-align:left; position:relative; left:14%;">'+ content + '</div>'
				+'<div class="col-md-4" style="padding:10px 0;"> <span id="id">'+ list[i].id +'</span><br>'
				+'<span id= "regdate">'+list[i].rdate+'</span><br>'
				+'<span class="delete" style="cursor:pointer" data-com_no="'+list[i].bno+'">[삭제]</span>'
				+'</div>'
				+'<div style="border-bottom:1px solid #ccc;"></div>'
				+'</div>';
				}
				$(".commentbox").html(comment_html);
			})
		}
	
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(function() {
		$("#writecomment").on("click",function() {
			const com_pro_code = '${vo.pro_code}';
			const com_content = $("#comment").val();
			const com_id = '${user.id}';
			
			if(com_content == ''){
				alert("内容を入力してください。");
				return;
			}
			$.ajax({
				type:"post",
				url:'/rwrite',
				data:JSON.stringify({"pro_code":com_pro_code,"contents":com_content,"id":com_id}),
				contentType:'application/json',
				success:function(data) {
					if(data == "ok"){
						alert("댓글 저장 완료")
						$("#comment").val('');
						getlist();
					}
				},error:function() {
					alert(com_pro_code+" "+com_content+" "+com_id);
					alert('통신실패');
				}
			})
		}) //등록
	
		$(".commentbox").on("click", ".delete", function() {
			//.comment_box 요소 중 자식요소인 .delete 클릭했을 때
			var com_no = $(this).data("com_no");
			$.ajax({
				type:"delete",
				url:'/shop/'+com_no,
				success:function(data) {
					alert("성공");
					getlist();
				},error:function() {
					alert("통신실패");
				}
			})
		}) //삭제
	})
	getlist();
})
</script>