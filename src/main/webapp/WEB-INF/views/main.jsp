<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp" %>
<div class="mainpage">
<div class="first_box">
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="width:82%; height:550px; margin:0 auto;">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="/resources/images/banner1.jpg" alt="...">
      <div class="carousel-caption">
      </div>
    </div>
    <div class="item">
      <img src="/resources/images/banner2.jpg" alt="...">
      <div class="carousel-caption">
      </div>
    </div>
      <div class="item">
      <img src="/resources/images/banner3.jpg" alt="...">
      <div class="carousel-caption">
      </div>
    </div>
      <div class="item">
      <img src="/resources/images/banner4.jpg" alt="...">
      <div class="carousel-caption">
      </div>
    </div>
  </div>
</div>
  <!-- Controls -->
  	<div class="thumbnail_bno">
	<img src="/resources/images/thumbnail.png" style="width:130px; height:40px;">
	<p id="th_no">01</p>
	</div>
  
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev" id="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next" id="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<div class="second_box">
	<div class="container-fluid">
		<div class="best_title" style="margin:12% 0 4% 0;">
			<h1 style="font-weight:800; text-align:center;">The Best Menu</h1>
		</div>
		<div class="menu_photo" style="position:relative;">
			<div class="menu_scroll-container">
				<c:forEach var="list" items="${blist}">
		    	<!-- 베스트 메뉴는 7개까지 -->
		    	<!-- -->
	    		<div class="menu_scroll-content" id="show_drink">
		        	<div class="menu_box">
		        		<a href="/shop/shopdetail?pro_code=${list.pro_code }"><img src="/photo/${list.menuAttachVo.uploadpath }/${list.menuAttachVo.uuid}_${list.menuAttachVo.uploadfile}" style="width:294x; height:294px;"></a>
		        		<div class="menu_price">
		        			<p id="name">${list.pro_name }</p>
		        			<p id="price"><fmt:formatNumber type="number" pattern="#,###" value="${list.pro_price}" /></p>
		        		</div>
	    			</div>
	    		</div>
	        	<!-- -->
				</c:forEach>
			</div>
    		<img src="/resources/images/best_prev.png" class="menu_prev">
    		<img src="/resources/images/best_next.png" class="menu_next">
		</div>
	</div>
</div>
<div class="third_box">
	<div class="container-fluid">
		<div class="shop_title" style="margin:9% 0 4% 0;">
			<h1 style="font-weight:800; text-align:center;">Online Shop</h1>
		</div>
		<div class="shop_photo" style="position:relative;">
			<div class="shop_scroll-container">
				<c:forEach var="list" items="${slist}">
	    		<div class="shop_scroll-content"> 
	    			<!-- 온라인샵 메뉴는 7개까지 -->
	        		<div class="shop_box">
	        			<a href="/shop/shopdetail?pro_code=${list.pro_code }"><img src="/photo/${list.menuAttachVo.uploadpath }/${list.menuAttachVo.uuid}_${list.menuAttachVo.uploadfile}" style="width:294x; height:294px;"></a>
	        			<div class="shop_price">
	        				<p id="name">${list.pro_name }</p>
	        				<p id="price">${list.pro_price }￥</p>
	        			</div>
	        		</div>
	        		
	    		</div>
	    		</c:forEach>
			</div>
    		<img src="/resources/images/best_prev.png" class="shop_prev">
    		<img src="/resources/images/best_next.png" class="shop_next">
		</div>
	</div>
</div>
<div class="fourth_box">
	<div class="container-fluid">
		<div class="event_title" style="margin:12% 0 4% 0;">
			<h1 style="font-weight:800; text-align:center;">Event&News</h1>
		</div>
		<div class="event_photo" style="position:relative;">
			<div class="event_scroll-container">
				<c:forEach var="elist" items="${elist}">
	    		<div class="event_scroll-content"> 
	    			<!-- 이벤트 메뉴는 6개까지 -->
	        		<div class="event_box">
	        			<img src="/photo/${elist.uploadpath }/${elist.uuid}_${elist.uploadfile}" style="width:320px; height:370px;">
	        			<div class="event_price">
	        			</div>
	        		</div>
	    		</div>
				</c:forEach>
			</div>
    		<img src="/resources/images/best_prev.png" class="event_prev">
    		<img src="/resources/images/best_next.png" class="event_next">
		</div>
	</div>
</div>
</div>
<script>
	$(function() {
		
		$('.event_next').click(function() {
		    $('.event_scroll-container').animate({
		        scrollLeft: '+=800'
		    }, 500);
		});

		$('.event_prev').click(function() {
		    $('.event_scroll-container').animate({
		        scrollLeft: '-=800'
		    }, 500);
		});
		
		$('.shop_next').click(function() {
		    $('.shop_scroll-container').animate({
		        scrollLeft: '+=800'
		    }, 500);
		});

		$('.shop_prev').click(function() {
		    $('.shop_scroll-container').animate({
		        scrollLeft: '-=800'
		    }, 500);
		});
		
		$('.menu_next').click(function() {
		    $('.menu_scroll-container').animate({
		        scrollLeft: '+=900'
		    }, 500);
		});

		$('.menu_prev').click(function() {
		    $('.menu_scroll-container').animate({
		        scrollLeft: '-=900'
		    }, 500);
		});
		
		var no = 1; // 대문 이미지 좌우 버튼
		$("#prev").on("click",function() {
			if(no==1){
				no = 4;
				$("#th_no").html("0"+no);
			}
			else if(no!=1) {
				no -= 1;
				$("#th_no").html("0"+no);
			}
			$("#prev").css("display","none");
			$("#next").css("display","none");
			setTimeout(function() {
			$("#prev").css("display","block");
			$("#next").css("display","block");
			}, 700);
		})
		$("#next").on("click",function() {
			if(no==4){
				no = 1;
				$("#th_no").html("0"+no);
			}
			else if(no!=4) {
				no += 1;
				$("#th_no").html("0"+no);
			}
			$("#prev").css("display","none");
			$("#next").css("display","none");
			setTimeout(function() {
			$("#prev").css("display","block");
			$("#next").css("display","block");
			}, 700);
		})
	})
</script>
<%@ include file="footer.jsp" %>
