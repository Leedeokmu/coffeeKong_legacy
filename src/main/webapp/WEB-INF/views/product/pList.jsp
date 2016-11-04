<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:set var="basePath" value="${pageContext.request.contextPath }"/>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>COFFEE KONG.</title>
</head>
<c:set var="basePath" value="${pageContext.request.contextPath }"/>
<body>
<div class="container bg-3 text-center">
<div class="row">
	<c:forEach var="vo" items="${list}" varStatus="status">
		<div class="col-sm-1"></div>
		<div class="col-sm-3">
		    <div class="imageWrapper">
		    	<a href="${vo.p_id}">
		    		<img src="${vo.p_img }" class="img-responsive thumbnail" style="width:300px;height:300px" alt="Image">
		    	</a>
		    	<a href="${vo.p_id}" class="cornerLink">$${vo.p_price }</a>
		    	<div class="h_nav" style="font-size:125%"><a href="${vo.p_id}">${vo.p_name}</a></div>
		    </div>
		    <br><br><br><br>
    	</div>
	</c:forEach>
	<form id="plistForm">
		<input type="hidden" name="pid" value=""/>
	</form>
	<script>
		$('.imageWrapper').on("click", 'a',function(event){
			event.preventDefault();
			
			var target = $(this).attr("href");
			var plistForm = $("#plistForm");
			plistForm.find("[name='pid']").val(target);
			plistForm.attr("action","/product/detail");
			plistForm.attr("method", "POST");
			plistForm.submit();
		})
	</script>
	</div>
</div>
</body>
</html>