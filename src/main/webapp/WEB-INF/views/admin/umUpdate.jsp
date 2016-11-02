<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<c:set var="basePath" value="${pageContext.request.contextPath }" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<div class="a_title text-center"><h2><span>MODIFY USER INFORMATION</span></h2></div><br />
	<div class="container">
		<form action="${basePath }/umuSaveCtrl" class="form-horizontal" method="POST" name="umuForm">
			<input type="hidden" name="email" value="${userVo.u_email}"/>
			<div>
				<div class="form-group ver_center">
					<label for="email" class="control-label col-md-3">EMAIL</label>
					<div class="col-md-9"><span>${userVo.u_email }</span></div>
				</div>
				<div class="form-group ver_center">
					<label for="fname" class="control-label col-md-3">FIRST NAME</label>&nbsp;
					<div class="col-md-9"><input type="text" name="fname" class="form-control" value="${userVo.u_fname }" /></div>
				</div>
				<div class="form-group ver_center">
					<label for="lname" class="control-label col-md-3">LAST NAME</label>&nbsp;
					<div class="col-md-9"><input type="text" name="lname" class="form-control" value="${userVo.u_lname }" /></div>
				</div>
				<div class="form-group ver_center">
					<label for="pw" class="control-label col-md-3">PASSWORD</label>&nbsp;
					<div class="col-md-9"><input type="password" class="form-control" name="pw" /></div>
				</div>
				<div class="hor_center">	
					<div class="btn-group">
						<input type="button" class="btn btn-default" value="ACCEPT" id="umu_submit"/>&nbsp;
						<a href="${basePath }/umDetailCtrl?email=${userVo.u_email}" class="btn btn-default" >BACK</a>
					</div>
				</div>
			</div>
			<script>
				$('#umu_submit').on('click', function(){
					if($('input[name=fname]').val() == "" || $('input[name=lname]').val() == "" || $('input[name=pw]').val() == ""){
						alert("FNAME / LNAME / PW IS EMPTY.");
						return;
					}else{
						umuForm.submit();
					}
				});
			</script>
			
		</form>
	</div>
</body>
</html>
