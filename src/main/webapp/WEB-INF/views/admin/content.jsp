<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>COFFEE KONG.</title>
</head>
<style>
	body{
		height:1000px;
	}
</style>
<body>
	<div class="container">
	<c:choose>
		<c:when test="${mgr != null }">
			<div><h2>WELCOME MASTER.</h2></div>
		</c:when>
		<c:otherwise>
			<div><h2>LOGIN PLEASE</h2></div>
			<div><h4><a href="/manage/login">LOGIN PLEASE</a></h4></div>
		</c:otherwise>
	</c:choose>
	</div>
</body>
</html>