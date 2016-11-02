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

<body>
	<div class="a_title text-center"><h2><span>USER INFORMATION</span></h2></div><br />
	<div class="container">
		<div>
			<div class="row">
				<span class="col-md-3">EMAIL</span>
				<span class="col-md-9">${userVo.u_email }</span>
			</div><hr />
			<div class="row">
				<span class="col-md-3">FIRST NAME</span>
				<span class="col-md-9">${userVo.u_fname }</span>
			</div><hr />
			<div class="row">
				<span class="col-md-3">LAST NAME</span>
				<span class="col-md-9">${userVo.u_lname }</span>
			</div><hr />
			<div class="row">
				<span class="col-md-3">POINT</span>
				<span class="col-md-9">${userVo.u_point }</span>
			</div>
		</div><br />
		<div>
			<div class="hor_center">
				<div class="btn-group">
					<a href="${basePath }/umUpdateCtrl?email=${userVo.u_email }" class="btn btn-default">UPDATE</a>
					<a href="#umdModal" data-toggle="modal" class="btn btn-default">DELETE</a>
				</div>
				<div id="umdModal" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h3 class="modal-title text-center">COMFIRM DELETING</h3>
						</div>
						<div class="modal-body text-center">
							<h3>DELETE THIS USER? CHECK ONCE MORE.</h3><br />
						</div>
						<div class="modal-footer">
							<div class="btn-group">
								<a href="${basePath }/umDeleteCtrl?email=${userVo.u_email}" class="btn btn-default">ACCEPT</a>
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							</div>
        				
      					</div>
					</div>
				</div>
			</div>
			</div>
		</div>
		
		
<!-- 		<br /><br /> -->
<!-- 		<div> -->
<!-- 			<div> -->
<!-- 				<span>ORDER ID</span> -->
<%-- 				<span>${userVo.u_email }</span> --%>
<!-- 			</div> -->
<!-- 			<div> -->
<!-- 				<span>PRODUCT NAME</span> -->
<%-- 				<span>${userVo.u_email }</span> --%>
<!-- 			</div> -->
<!-- 			<div> -->
<!-- 				<span>ORDER ID</span> -->
<%-- 				<span>${userVo.u_email }</span> --%>
<!-- 			</div> -->
<!-- 			<div> -->
<!-- 				<span>ORDER ID</span> -->
<%-- 				<span>${userVo.u_email }</span> --%>
<!-- 			</div> -->
<!-- 			<div> -->
<!-- 				<span>ORDER ID</span> -->
<%-- 				<span>${userVo.u_email }</span> --%>
<!-- 			</div> -->
<!-- 			<div> -->
<!-- 				<span>ORDER ID</span> -->
<%-- 				<span>${userVo.u_email }</span> --%>
<!-- 			</div> -->
<!-- 		</div> -->
	</div>
</body>
</html>