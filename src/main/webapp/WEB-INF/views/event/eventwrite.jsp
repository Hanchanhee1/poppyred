<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<link href="/resources/css/eventwrite.css" rel="stylesheet">

	<div class="container">
		<div class="write_wrap">
			<h2 class="">이벤트 글쓰기</h2>
				<form name="notice" method="post" enctype="multipart/form-data" action="/eventwrite" onsubmit="return check()">
				<table class="bord_table">
					<caption class="sr-only">이벤트 입력 표</caption>
					<colgroup>
						<col width="20%">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>제목</th>
							<td><input type="text" name="title" class="title"></td>
						</tr>
						<tr>
						<th>첨부</th>
						<td><input type="file" name="uploadfile" id="uploadfile" multiple></td>
						<div class="img_wrap">
						<img alt="" src="" style="width:50px;">
					</div>
					</tr>
					</tbody>
				</table>
				<div class="btn_wrap">
					<input type="submit" value="保存" class="btn_ok">&nbsp;&nbsp;
					<input type="reset" value="書き直し" class="btn_reset">&nbsp;&nbsp;
					<input type="button" value="目録" class="btn_list"
						onClick="location.href='/event';">
				</div>
			</form>
		</div>
	</div>
	
		<script>
	var regex = new RegExp("(.*?)\.(jpg|png|gif)$");
	var maxSize = 20971520; // 20MB
	
		function check() {

			if (notice.title.value == "") {
				alert("タイトルを入力してください。");
				notice.title.focus();
				return false;
			}

				var inputFile = $("input[name='uploadfile']");
				var files = inputFile[0].files; //첨부된 파일
				console.log(files);
				for(var i=0; i < files.length; i++) {
					if(!checExtension(files[i].name, files[i].size)) {
						return false;
					}
				}
			return true;
		}
	
		function checExtension(fileName, fileSize) {
			if(fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}
			if(!regex.test(fileName)) {
				alert("해당 파일의 종류는 업로드 할 수 없습니다");
				return false;
			}
			return true;
		}
	</script>

</body>
</html>
<%@ include file="../footer.jsp"%>
