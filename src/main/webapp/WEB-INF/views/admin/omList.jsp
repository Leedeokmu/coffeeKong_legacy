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
<script type="text/javascript">	
	function goPage(pageNum){
		ompForm.curPageNum.value = pageNum;
		ompForm.action = "${basePath}/omListCtrl";
		ompForm.submit();
	}
</script>
</head>
<body>
	<div class="a_title text-center"><h2>ORDER LIST</h2></div><br /><br />
	<div class="container-fluid a_article" style="margin-left:30px;margin-right:30px;">
		<div class="row text-center">
			<div class="col-md-2"><span>ORDER NUMBER</span></div>
			<div class="col-md-1"><span></span></div>
			<div class="col-md-1"><span>NAME</span></div>
			<div class="col-md-2"><span>CATEGORY</span></div>
			<div class="col-md-1"><span>TYPE</span></div>
			<div class="col-md-1"><span>QUENTITY</span></div>
			<div class="col-md-1"><span>SIZE</span></div>
			<div class="col-md-1"><span>PRICE</span></div>
			<div class="col-md-2"><span>ORDER USER</span></div>
		</div><hr />
		<c:forEach var="oVo" items="${orderList }">
			<c:set var="pVo" value="${oVo.pvo }"/>
			<div class="row ver_center text-center">
				<div class="col-md-2"><a href="${basePath }/omDetailCtrl?oid=${oVo.o_id }" class="btn btn-default"><span>No.${oVo.o_id }</span></a></div>
				<div class="col-md-1"><a href="${basePath }/omDetailCtrl?oid=${oVo.o_id }"><img src="${pVo.p_img }" alt="img" class="img-responsive thumbnail"/></a></div>
				<div class="col-md-1"><span>${pVo.p_name }</span></div>
				<div class="col-md-2"><span>${pVo.p_category }</span></div>
				<div class="col-md-1"><span>${oVo.o_type }</span></div>
				<div class="col-md-1"><span>${oVo.o_qty }</span></div>
				<div class="col-md-1"><span>${oVo.o_sz}</span></div>
				<div class="col-md-1"><span>${oVo.o_price }</span></div>
				<div class="col-md-2"><span>${oVo.u_email }</span></div>
			</div>
			<hr />
		</c:forEach>
	</div>
</body>
</html>