<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/resources/css/qna.css" rel="stylesheet">
<div class="qnapage">
	<div class="content" style="position:relative;">
		<div style="border-bottom:3px solid #ccc; height:40px;"></div>
		<div class="qlist">
		</div>
		<button class="btn btn-default" id="questionwrite">質問登録</button>
	</div>
	<div style="height:120px;"></div>
</div>
<script>
	function getlist() {
		const pro_code = '${vo.pro_code}';
		$.getJSON('/qna/'+pro_code, function(data) {
			var list = data.qlist;
			var qna_html = "";
			for(i=0; i<list.length; i++) {
				var content = list[i].contents;
				var admin = "";
				var anrdate = "";
				if(list[i].anrdate != null) {
					admin= "admin";
					anrdate = list[i].anrdate;
				}
				qna_html += '<div class="qbox" style="position:relative; height:80px;">'
			+ '<span class="qnabno">'+list[i].bno+'.</span>'
			+ '<div class="question"><span style="font-weight:800;">Q. </span>'+list[i].contents+'</div>'
			+ '<div class="writeinfo">'
			+	list[i].id+'<br>'+list[i].rdate+'<br>'
			+ '</div>'
		+ '</div>'		
		+ '<div style="border:1px solid #ccc;"></div>'
		+ '<div class="abox" style="position:relative; height:100px;">'
		+	'<div class="answer"><span style="font-weight:800;">A. </span>'+list[i].answer+'</div>'
		+	'<div class="writeinfo">'
		+		'<span id="id">'+admin+'</span><br>'
		+		'<span id="regdate">'+anrdate+'</span><br>'
		+	'<button class="btn_ans btn-default" style="cursor:pointer; width:80px;" data-pro_code="'+list[i].pro_code+'" data-bno="'+list[i].bno+'">返答登録</button>'
		+	'</div>'
		+'</div>'		
		+'<div style="border:1px solid #ccc;"></div>'
			}
			$(".qlist").html(qna_html);
		})
	}
	
	$(function() {
		$("#save").hide();
		$("#saveReply").hide();
		$("#questionwrite").on("click",function() {
			$("#save").show();
			$("#saveReply").hide();
			$(".modal-title").html("質問を書いてください。");
			$(".modal").modal("show");
		})
		
		$("#save").on("click",function() {
			var contents = $("#q_contents").val();
			var q_pro_code = '${vo.pro_code}';
			var id = "닉네임";
			if(contents == ''){
				alert("内容を入力してください。");
				return;
			}
			$.ajax({
				type:"post",
				url:"/qwrite",
				data:JSON.stringify({"pro_code":q_pro_code,"contents":contents,"id":id}),
				contentType:'application/json',
				success:function(data){
					if(data == "ok"){
						alert("질문 저장 완료");
						$("#q_contents").val('');
						$(".modal").modal("hide");
						getlist();
					}
				},error:function() {
					alert("통신 실패");
				}
				
			})
		})
		var contents= "";
		var q_pro_code ="";
		var bno = "";
		$(".qlist").on("click", ".btn_ans", function() {
			$("#saveReply").show();
			$("#save").hide();
			bno = $(this).data("bno");
			$(".modal-title").html(bno+". 응답해주세요.");
			$(".modal").modal("show");
		})
		
		$("#saveReply").on("click", function() {
			answer = $("#q_contents").val();
			q_pro_code = $(".btn_ans").data("pro_code");
			if(answer == ""){
				alert("内容を入力してください。");
				return;
			}
			$.ajax({
				type:'post',
				url:'/awrite',
				data:JSON.stringify({"pro_code":q_pro_code,"answer":answer,"bno":bno}),
				contentType:'application/json',
				success:function(data) {
					if(data == "ok"){
						alert("답변이 등록되었습니다.");
						$("#q_contents").val('');
						$(".modal").modal("hide");
						getlist();
					}
				},error:function() {
					alert("통신 실패");
				}
			})
		})
	})
	getlist();
</script>
<div class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"></h4>
      </div>
      <div class="modal-question" style="height:100px;">
      	<textarea id="q_contents" style="resize:none; border:none; width:97%; height:80px; margin:10px 8px; outline:none;" placeholder="ご入力ください。"></textarea>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">キャンセル</button>
        <button type="button" class="btn btn-default" id="save">登録</button>
        <button type="button" class="btn btn-default" id="saveReply">登録</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->