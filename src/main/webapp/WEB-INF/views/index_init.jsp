<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html>
<head>
<c:set var="basePath" value="${pageContext.request.contextPath }" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>COFFEE KONG.</title>
<style>
</style>
</head>
<body>
	<br />
	<div class="container">
		<div id="coffeeCarousel" class="carousel slide" data-ride="carousel" style="height:400px !important;">
		    <ol class="carousel-indicators">
		      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		      <li data-target="#myCarousel" data-slide-to="1"></li>
		      <li data-target="#myCarousel" data-slide-to="2"></li>
		      <li data-target="#myCarousel" data-slide-to="3"></li>
		    </ol>
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<a href="">
						<img src="/resources/dist/img/coffee-beans.jpg" alt="">
					</a>
				</div>
				<div class="item">
					<img src="/resources/dist/img/coffee-grind.jpg" alt="">
				</div>
				<div class="item">
					<img src="/resources/dist/img/coffee-cup.jpg" alt="">
				</div>
				<div class="item">
					<img src="/resources/dist/img/coffee-ground.jpg" alt="">
				</div>
			</div>
			<!-- Left and right controls -->
			<a class="left carousel-control" href="#coffeeCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#coffeeCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<hr />
		<div class="row">
			
		</div>
	</div>
	<c:if test="${content eq 'login' && login == null}">
		<script>$('#loginModal').modal();</script>
	</c:if>
	
</body>
</html>