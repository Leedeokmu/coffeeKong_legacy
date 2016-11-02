<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<c:set var="basePath" value="${pageContext.request.contextPath }"/>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
</head>
<c:set var="oVo" value="${orderVo }"/>
<c:set var="pVo" value="${orderVo.pvo }"/>
<body>
	<div class="a_title text-center"><h2>ORDER INFORMATION</h2></div><br />
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
					<span class="col-md-3">${oVo.o_state }</span>	
					<span class="col-md-9">${oVo.o_state }</span>
				</div>
				<div class="row">
					<span class="col-md-3">PRICE</span>
					<span class="col-md-9"><strong>$${oVo.o_price }</strong></span>
				</div>
			</div>
		</div>
		</div><hr />
		<div class="hor_center">
		<div class="row">
			<div>
				<h3>DELIVERY INFORMATION</h3>
			</div>
			<div class="row">
				<span class="col-md-3">NAME</span>				
				<span class="col-md-9">${oVo.o_rfname }&nbsp;${oVo.o_rlname }</span>
			</div>
			<div class="row">
				<span class="col-md-3">PHONE</span>
				<span class="col-md-9">${oVo.o_phone }</span>
			</div>
			<div class="row">
				<span class="col-md-3">POST CODE</span>
				<span class="col-md-9">${oVo.o_postcode }&nbsp;&nbsp;&nbsp;</span>
			</div>
			<div class="row">
				<span class="col-md-3">ADDRESS</span>
				<span class="col-md-9">${oVo.o_addr }</span>
			</div>
		</div>
		</div>
		<hr />
		<div>
			<a href="${basePath }/uoListCtrl" class="btn btn-default">BACK</a>
		</div>
	</div>
</body>
</html>