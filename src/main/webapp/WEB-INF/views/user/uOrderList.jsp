<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<c:set var="basePath" value="${pageContext.request.contextPath }"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function goPage(pageNum){
		uopForm.curPageNum.value = pageNum;
		uopForm.action = "${basePath}/uoListCtrl";
		uopForm.submit();
	}
</script>
<c:set var="basePath" value="${pageContext.request.contextPath }"/>
<body>
	<div class="u_title text-center"><h2>ORDER</h2></div><br />
	<div class="container-fluid" style="margin-left:30px;margin-right:30px">
		<div class="row">
				<div class="col-md-2"><span>ORDER NUMBER</span></div>
				<div class="col-md-1"><span></span></div>
				<div class="col-md-1"><span>NAME</span></div>
				<div class="col-md-2"><span>CATEGORY</span></div>
				<div class="col-md-1"><span>TYPE</span></div>
				<div class="col-md-1"><span>QUENTITY</span></div>
				<div class="col-md-1"><span>SIZE</span></div>
				<div class="col-md-1"><span>PRICE</span></div>
				<div class="col-md-2"><span>USER</span></div>	
		</div>
		<hr >
		<c:forEach var="oVo" items="${orderList }">
			<c:set var="pVo" value="${oVo.pvo }"/>
			<div class="row">
				<div class="col-md-2"><a href="${basePath }/uoDetailCtrl?oid=${oVo.o_id }" class="btn btn-default"><span>No. ${oVo.o_id }</span></a></div>
				<div class="col-md-1"><a href="${basePath }/uoDetailCtrl?oid=${oVo.o_id }"><img src="${pVo.p_img }" alt="img" class="img-responsive" style="width:70%;height:50%"/></a></div>
				<div class="col-md-1"><span>${pVo.p_name }</span></div>
				<div class="col-md-2"><span>${pVo.p_category }</span></div>
				<div class="col-md-1"><span>${oVo.o_type }</span></div>
				<div class="col-md-1"><span>${oVo.o_qty }</span></div>
				<div class="col-md-1"><span>${oVo.o_sz}</span></div>
				<div class="col-md-1"><span>${oVo.o_price }</span></div>
				<div class="col-md-2"><span>${oVo.u_email }</span></div>
			</div>
			<hr>
		</c:forEach>
	</div>
	
</body>
</html>