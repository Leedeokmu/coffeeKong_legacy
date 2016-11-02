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
<title>COFFEE KONG.</title>
</head>
<style>
	.intro_img{
		display:flex;
		justify-content: center;
	}
</style>
<body>
	<div class="container">
		<div class="intro_img">
			<img src="${basePath }/coffeeKong/img/happy.jpg" class="img-responsive img-rounded" alt="happy" style="border:1px solid #aaaaaa;width:50%;height:50%"/>
		</div>
		<div class="text-center u_title">
			<h2 class="text-center">WE ARE THE WORLD!</h2>
		</div>
		<div class="u_article">
			<p style="font-size:125%">
	We are the world coffee publisher.
	'You know coffee?'
	My father asked me in my childhood days.
	Always thinking 'what is coffee?'
	I always respect these aspact of coffee.
			</p>
			<p style="font-size:150%">Welcome our fantasy.</p>
		</div>
	</div>
</body>
</html>