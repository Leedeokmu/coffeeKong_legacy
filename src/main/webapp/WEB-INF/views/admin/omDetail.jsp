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
<title>COFFEE KONG.</title>
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
					<span class="col-md-3">STATE</span>	
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
		<div class="hor_center">
			<div class="btn-group">
				<a href="${basePath }/omUpdateCtrl?oid=${oVo.o_id}" class="btn btn-default">MODIFY</a>
				<a href="#omdModal" data-toggle="modal" class="btn btn-default">DELETE</a>
				<a href="${basePath }/omListCtrl" class="btn btn-default">BACK</a>
			</div>
			<div id="omdModal" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h3 class="modal-title text-center">COMFIRM DELETING</h3>
						</div>
						<div class="modal-body text-center">
							<h3>DELETE THIS ORDER? CHECK ONCE MORE.</h3><br />
						</div>
						<div class="modal-footer">
							<div class="btn-group">
								<a href="${basePath }/omDeleteCtrl?oid=${oVo.o_id}" class="btn btn-default">ACCEPT</a>
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							</div>
        				
      					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>