<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<c:set var="basePath" value="${pageContext.request.contextPath }"/>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
</head>
<body>
	<div class="a_title text-center"><h2>PRODUCTS IN YOUR CART</h2></div><br />
	<form action="${basePath }/orderCtrl" method="POST">
	<div class="container a_article">
		<div class="hor_center">
			<div class="row">
				<div class="col-md-5">
					<img src="${pVo.p_img }" alt="img" class="img-responsive thumbnail" />
				</div>
				<div class="col-md-7" style="margin-top:5em">
					<div class="row">
						<span class="col-md-3">NAME</span>
						<span class="col-md-9">${pVo.p_name }</span>
					</div>
					<div class="row">
						<span class="col-md-3">CATEGORY</span>
						<span class="col-md-9">${pVo.p_category }</span>
					</div>
					<div class="row">
						<span class="col-md-3">TYPE</span>
						<span class="col-md-9">${cart.type }</span>
					</div>
					<div class="row">
						<span class="col-md-3">QUNETYTY</span>
						<span class="col-md-9">${cart.qty}</span>
					</div>
					<div class="row">
						<span class="col-md-3">SIZE</span>
						<span class="col-md-9">${cart.sz }</span>
					</div>
					<div class="row">
						<span class="col-md-3">PRICE</span>
						<span class="col-md-9"><strong>$${cart.price }</strong></span>
					</div>
				</div>
			</div>
		</div>
		<hr />
		<div class="hor_center">
			<input type="submit" value="CHECK OUT" class="btn btn-default"/>
		</div>
	</div>
	</form>
</body>
</html>