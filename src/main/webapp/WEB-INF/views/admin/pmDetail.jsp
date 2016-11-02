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
<title>Insert title here</title>
</head>
<c:set var="vo" value="${aProduct}"/>

<body>
<div class="container">
	<div style="clear:both;text-align:center;">
		<hr>
			<h2>Detail Info</h2>
		<hr>
	</div>
	<div style="margin:2px;float:left;">
		<div style="margin:10px;float:left;"><img src="${vo.p_img }" width="400" height="400" alt="productIcon"/></div>	
	</div>
	<div style="margin:10px;float:left;margin-left:150px;margin-top:55px">
		<div>
			<h3>ID: ${vo.p_id }</h3>
		</div>
		<div>
			<h3>Category: ${vo.p_category }</h3>
		</div>
		<div>
			<h3>Name: ${vo.p_name}</h3>	
		</div>
		<div>
			<h3>Price: ${vo.p_price }</h3>	
		</div>
		<div>
			<h3>Date of manufacture: ${vo.p_mdate }</h3>	
		</div>
		<div>
			<h3>Posted date: ${vo.p_rdate }</h3>	
		</div>
	</div>
	<div style="clear:both;text-align:center;">
		<hr>
			<h3>Content</h3>
		<hr>
		<p>${vo.p_content}</p>
	</div>
</div>
</body>
</html>