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
<c:set var="basePath" value="${pageContext.request.contextPath }" />
<body>
	<div class="container">
	<div class="alert alert-warning">
		<h2>YOU REALLY RESIGN FROM OUR SITE?</h2>
	</div><br />
	<div class="hor_center">
		<form action="${basePath }/uResignCtrl" method="POST">
			<div>
				<label for="resign_pw">ENTER YOUR PASSWORD</label>
				<input type="password" class="form-control" name="pw" id="resign_pw"/>
			</div><br />
			<c:if test="${param.match.equals('no')}">
				<div>
					<span>PASSWORD NOT MATCHED.</span>
				</div>
			</c:if>
			<div class="hor_center">
				<input type="submit" class="btn btn-warning btn-sm" value="submit"/>
			</div>
		</form>
	</div>
	</div>
</body>
</html>