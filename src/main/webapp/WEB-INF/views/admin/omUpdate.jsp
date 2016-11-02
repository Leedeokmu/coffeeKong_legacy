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
<title>Insert title here</title>
</head>
<c:set var="oVo" value="${orderVo }"/>
<c:set var="pVo" value="${orderVo.pvo }"/>
<body>
	<div class="a_title text-center"><h3>MODIFY ORDER INFORMATION</h3></div><br />
	<form action="${basePath }/omuSaveCtrl" method="POST" class="form-horizontal">
	<input type="hidden" name="oid" value="${oVo.o_id}"/>
	<div class="container a_article">
		<div>
			<div class="form-group ver_center">
				<label for="pname" class="control-label col-md-3">PRODUCT NAME</label>
				<div class="col-md-9"><input type="text" class="form-control" name="pname" id="pname" value="${pVo.p_name }"/></div>
			</div>
			<div class="form-group ver_center">
				<label for="state" class="control-label col-md-3">STATE</label>
				<div class="col-md-9"><input type="text" class="form-control" name="state" id="state" value="${oVo.o_state}" readonly="readonly"/></div>
			</div>
			<div class="form-group ver_center">
				<label for="price" class="control-label col-md-3">PRICE</label>
				<div class="col-md-9"><input type="text" class="form-control" name="price" id="price" value="$${oVo.o_price}"/></div>
			</div>
		</div>
		<div>
			<div class="text-center">
				<span><h3>DELIVERY INFORMATION</h3></span>
			</div>
			<div class="form-group">
				<label for="omu_rfname" class="control-label col-md-3">FIRST NAME</label>
				<div class="col-md-9"><input type="text" class="form-control"name="rfname" id="omu_rfname" value="${oVo.o_rfname }"/></div>
			</div>
			<div class="form-group">
				<label for="omu_lfname" class="control-label col-md-3">LAST NAME</label>
				<div class="col-md-9"><input type="text" class="form-control"name="rlname" id="omu_lfname" value="${oVo.o_rlname }"/></div>
			</div>
			<div class="form-group">
				<label for="omu_phone" class="control-label col-md-3">PHONE</label>
				<div class="col-md-9"><input type="text" class="form-control" name="phone" id="omu_phone" value="${oVo.o_phone }"/></div>
			</div>
			<div class="form-group">
				<label for="omu_postcode" class="control-label col-md-3">POST CODE</label>
				<div class="col-md-9"><input type="text" class="form-control"name="postcode" id="omu_postcode" value="${oVo.o_postcode }"/></div>
			</div>
			<div class="form-group">
				<label for="omu_addr" class="control-label col-md-3">ADDRESS</label>
				<div class="col-md-9"><textarea name="addr" class="form-control" id="" cols="30" rows="2" id="omu_addr">${oVo.o_addr }</textarea></div>
			</div>
		</div>
		<div class="hor_center">
			<div class="btn-group">
				<input type="submit" class="btn btn-default" value="ACCEPT"/>
				<a href="${basePath }/omDetailCtrl?oid=${oVo.o_id}" class="btn btn-default">BACK</a>
			</div>
		</div>
	</div>
	</form>
</body>
</html>