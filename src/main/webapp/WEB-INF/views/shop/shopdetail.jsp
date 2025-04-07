<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link href="/resources/css/shopdetail.css" rel="stylesheet">

<div class="shop_detail">
	<div class="container">
		<div class="row">
			<div class="col-md-6" style="height:370px;">
				<div class="photo">
					<img src="/photo/${vo.menuAttachVo.uploadpath }/${vo.menuAttachVo.uuid}_${vo.menuAttachVo.uploadfile}" style="width:90%; height:370px;">
				</div>
			</div>
			<div class="col-md-6" style="left:5%;">
				<div class="top">
					<p>${vo.pro_name}</p>
					<p id="price" style="display:inline-block;">${vo.pro_price }</p>￥
				</div>
				<div class="mid">
					<label for="howsend">配送方法</label> 택배<br>
					<label for="cost">送料</label>　無料<br>
					<div class="total" 
						style="display:inline-block; font-size: 25px; font-weight: bold; text-align: right; margin-bottom: 20px;">1
					</div>
					<div class="quanbutton">
						<button class="minus" type="button">-</button>
						<input type="text" name="quantity" value="1" class="quantity" style="width:30px;">
						<button class="plus" type="button">+</button>
					</div>
				</div>
				<div class="bottom">
					<button type="button" class="btn btn-default" id="btn_cart" style="width:100%; height:40px; font-weight:700; border:1px solid #000;">カートに入れる</button>
					<button type="button" class="btn btn-default" id="btn_purchase" style="width:100%; height:40px; font-weight:700; border:1px solid #000; margin-top:15px;">購入する</button>
				</div>
			</div>
		</div>
		<div class="detail_tab">
		<div class="choice">
		  <!-- Nav tabs -->
		  <ul class="nav nav-tabs" role="tablist" id="detail_nav">
		    <li role="presentation" class="active"><a href="#info" id="info1" aria-controls="info" role="tab" data-toggle="tab" style="color:#ccc; padding:0 100px;">詳細情報</a></li>
		    <li role="presentation"><a href="#review" id="review1" aria-controls="review" role="tab" data-toggle="tab" style="color:#ccc; padding:0 100px; border-right:2px solid #000; border-left:2px solid #000;">レビュー</a></li>
		    <li role="presentation"><a href="#qna" id="qna1" aria-controls="qna" role="tab" data-toggle="tab" style="color:#ccc; padding:0 100px;">Q/A</a></li>
		  </ul>
		</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="tab_content" style="position:relative; border-top:1px solid #ccc;">
			<!-- Tab panes -->
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="info">
					<p style="margin:10% 0; text-align:center;">${vo.pro_contents }</p>
				</div>
				<div role="tabpanel" class="tab-pane" id="review">
					<%@ include file="../shop/review.jsp" %>
				</div>
				<div role="tabpanel" class="tab-pane" id="qna">
					<%@ include file="../shop/qna.jsp" %>
				</div>
			</div>
		</div>
	</div>
</div>
<script>

	$(function() {
		$("#info1").css("color","#000");
		$("#info1").attr("disabled","true")
		
		$("#info1").on("click",function() {
			$(this).css("color","#000");
			$(this).attr("disabled","true")
			$("#review1").css("color","#ccc");
			$("#qna1").css("color","#ccc");
		})
		$("#review1").on("click",function() {
			$(this).css("color","#000");
			$(this).attr("disabled","true")
			$("#info1").css("color","#ccc");
			$("#qna1").css("color","#ccc");
		})
		$("#qna1").on("click",function() {
			$(this).css("color","#000");
			$(this).attr("disabled","true")
			$("#review1").css("color","#ccc");
			$("#info1").css("color","#ccc");
		})
	})
</script>
<script>
	var amount=0;
	$(function() {//jqery는[ 선택자 , 함수 ]실행 방식 
		var total = function(n){//jqery **함수 만드는 방법  var 변수 선언 n은 넘어오는 변수값을 받는 변수 
		var price= '${vo.pro_price}';
		//priceid요소중  data-로 시작하는 data집합중에서(dataset) price값(가격)을 가져와라
		amount = $(".quantity").attr("value");//jqery방식  .""=클래스  ---즉amount에 문자로 1이 저장됨 
		//클래스이름이 quantity인 value속성에 저장된 값을 가져와라
		amount= parseInt(amount);//j qery는 모두스트링이기떄문에 정수로 변환한것 그래서 숫자1이 저장됨  
		amount=amount+n;
		if(amount<1){
			amount=1;
			alert("最低購入数量は1個です");
		}
		var tot = price*amount;//총액
		$(".quantity").attr("value",amount); //value에다가 amount 값을 넣어라 
		//클래스 이름이 quantity인 value속성에 초기값으로 amount를 넣어라
		var regexp= /\B(?=(\d{3})+(?!\d))/g; //숫자3자리씩에다가 ,를 삽입하는 식 
		//스크립트 정규 표현식  id형식 이메일 형식 지정 할때 사용 
		var tot= tot.toString().replace(regexp,',');
		//tot에 저장된 값을 문자열로 변환regexp정규 표현식에 ,로 바꿔서 다시 total에 저장하라 
		$(".total").html("全 "+amount+" 個");
		$("#price").html(tot)
		}
		
		total(0);// total함수 호출할때 
		$(".plus").on("click", function(){//plus라는 이름의 (버튼)를 클릭했을때 
			total(1);
		})
		$(".minus").on("click", function(){
			total(-1);
		})
		
		$("#btn_cart").on("click",function() {
			if('${user.id}'==""){
				alert("ログインしてください。");
				location.href="/login";
				return;
			}
				var pro_code = '${vo.pro_code}';
				var id = '${user.id}';
				var quantity = amount;
				var price = ${vo.pro_price};
				var tot_price = quantity*price;
				$.ajax({
					type:"post",
					url:"/cart",
					data:JSON.stringify({"pro_code":pro_code,"id":id,"amount":quantity,"tot_price":tot_price}),
					contentType:'application/json',
					success:function(data){ 
						if(data == "ok") {						
							alert("カートに入れました。");
						}
						
					},error:function() {
						alert("통신 실패");
					}
			})
		}) //카트 등록
		
		$("#btn_purchase").on("click",function() {
				var pro_code = '${vo.pro_code}';
				var id = '${user.id}';
				var quantity = amount;
				var price = ${vo.pro_price};
				var tot_price = quantity*price;
				$.ajax({
					type:"post",
					url:"/cart",
					data:JSON.stringify({"pro_code":pro_code,"id":id,"amount":quantity,"tot_price":tot_price}),
					contentType:'application/json',
					success:function(data){ 
						if(data == "ok") {
							location='/purchase?id=${user.id}'
						}
						
					},error:function() {
						alert("통신 실패");
					}
			})
		}) //구입
	})
</script>
<%@ include file="../footer.jsp" %>