<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="/resources/css/usermanage.css" rel="stylesheet">

<div class="managebox"> 
	<span class="userid">${user.name } 様</span>
	<div class="userbox">
		<div class="userdelete">
			<img src="/resources/images/userdelete.png" style="width:300px; height:300px;" id="btn_delete">
		</div>
	</div>
</div>
<!-- Modal -->
      <form name="deleteuser">
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
      	<p>削除するIDとパスワードを入力してください。
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        </p>
      </div>
      <div class="modal-body">
      <div class="form-group">
        <label for="">ID</label><input type="text" placeholder="ID" name="id" style="width:200px;"><br>
        <label for="">パスワード</label><input type="text" placeholder="パスワード" name="pw" style="width:200px;">
      </div>
      </div>
      <div style="position:relative; text-align:center; margin:20px 0;">
      	<button type="button" class="btn btn-default" id="delete" style="width:100px; height:50px;">削除</button>
      </div>
    </div>
  </div>
</div>
      </form>
<script>
	$(function() {
		$("#btn_delete").on("click",function() {
			$(".modal").modal("show");
		})
		
		$("#delete").on("click",function() {
			var form = document.deleteuser;
			if(form.id.value==""){
				alert("IDを入力してください。");
			} else if(form.pw.value==""){
				alert("パスワードを入力してください。");
			} else {
				form.method='post';
				form.action='/deleteuser';
				form.submit();
				alert("削除しました。");
				$(".modal").modal("hide");
				
			}
		})
	})
</script>