<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../header.jsp"%>
<link href="/resources/css/event.css" rel="stylesheet">
<div class="container-fluid" style="border-bottom:1px solid #ccc;">
	<div class="title">
		<a href="/event">Event</a>
	</div>
		<div class="select_menu" style="padding-bottom:2%;">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs" role="tablist" id="detail_nav">
			    <li role="presentation" class="active"><a href="#event" id="event1" aria-controls="event" role="tab" data-toggle="tab" style="color:#ccc; padding:0 50px;">Event</a></li>
			    <li role="presentation"><a href="#notice" id="notice1" aria-controls="notice" role="tab" data-toggle="tab" style="color:#ccc; padding:0 50px;">Notice</a></li>
			</ul>
		</div>
</div>
<div class="event_content" style="margin-top:4%; margin-bottom:13%;">
	<div class="container">
		<!-- Tab panes -->
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="event">
			<c:forEach var = "alist" items = "${alist }">
				<!--  -->
		        <div class="event_box">
		           <c:forEach var="imglist" items="${alist.eventAttachList }" varStatus="status">
                  	<c:if test="${status.first }">
	        		<a href="/eventview?bno=${alist.bno }"><img src="/photo/${imglist.uploadpath}/${imglist.uuid}_${imglist.uploadfile}" alt="" style="width:320px; height:300px;"></a>
	        		</c:if>
                  	</c:forEach>
	        		<div class="event_price">
	        			<p id="name">${alist.title }</p>
	        		</div>
	        	</div>
	        	<!--  -->
			</c:forEach>
			<div>
				<c:choose>
				<c:when test="${user.role eq 'admin' }">
				<button onclick="location='/eventwrite'" class="btn2">挙げる</button>
				</c:when>
				</c:choose>
			</div>
			</div>
			<div role="tabpanel" class="tab-pane" id="notice">
				<%@ include file="notice.jsp" %>
			</div>
		</div>
	</div>
</div>

<script>
	$(function() {
		$("#event1").css("color", "#000");
		$("#notice1").attr("disabled", "true")

		$("#event1").on("click", function() {
			$(this).css("color", "#000");
			$("#notice1").css("color", "#ccc");
			$(this).attr("disabled", "true");
			$("#notice1").removeAttr("disabled");
		})
		$("#notice1").on("click", function() {
			$("#event1").css("color", "#ccc");
			$(this).css("color", "#000");
			$(this).attr("disabled", "true");
			$("#event1").removeAttr("disabled");
		})
	})
</script>

<%@ include file="../footer.jsp"%>
