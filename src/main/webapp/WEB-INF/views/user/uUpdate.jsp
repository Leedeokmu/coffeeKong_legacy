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
<body>
	<div class="hor_center"><h3>EDIT YOUR INFORMATION</h3></div><br />
	<div class="container hor_center">
		<form action="" method="POST" class="form-horizontal" name="uupdate" style="width:50em">
			<input type="hidden" name="u_email" value="${login.u_email}" />
			<div class="">
				<div class="form-group ver_center">
					<label for="email" class="control-label col-md-2">EMAIL</label>&nbsp;
					<div class="col-md-10">	${login.u_email }</div>
				</div>
				<div class="form-group ver_center">
					<label for="fname" class="control-label col-md-2">FIRST NAME</label>&nbsp;
					<div class="col-md-10">	<input type="text" name="u_fname" class="form-control" value="${login.u_fname }"/></div>
				</div>
				<div class="form-group ver_center">
					<label for="lname" class="control-label col-md-2">LAST NAME</label>&nbsp;
					<div class="col-md-10"><input type="text" name="u_lname" class="form-control" value="${login.u_lname }" /></div>
				</div>
				<div class="form-group ver_center">
					<label for="pw" class="control-label col-md-2">PASSWORD</label>&nbsp;
					<div class="col-md-10"><input type="password" class="form-control" name="u_pwd"/></div>
				</div>
				<div class="form-group ver_center">
					<label for="pwconfirm" class="control-label col-md-2">CONFIRM</label>&nbsp;
					<div class="col-md-10"><input type="password" class="form-control" name="pwdconfirm"/></div>
				</div>
				<div class="hor_center">
				<div class="btn-group">
					<input type="submit" value="ACCEPT" class="btn btn-default" id="uu_accept"/>
					<a href="/index" class="btn btn-default">BACK TO MAIN</a>
				</div>
				</div>
			</div>
		</form>
	</div>
	<script>
	
// 					$('#uu_accept').on('click', function(){
// 						if($('#pw').val() != $('#pwconfirm').val()){
// 							alert('password not equal.\ncheck password.');
// 							return;
// 						}else{
// 							uuForm.action="${basePath }/uUpdateSaveCtrl";
// 							uuForm.submit();
// 						}
// 					});
				</script>
	
</body>
</html>