<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:set var="basePath" value="${pageContext.request.contextPath }"/>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>WELCOME TO COFFEE KONG.</title>
</head>
<c:choose>
	<c:when test="${param.content == null || param.content == '' }">
		<c:set var="content" value="/coffeeKong/index_init.jsp"/>	
	</c:when>
	<c:when test="${param.content.equals('join')}">
		<c:set var="content" value="/coffeeKong/join.jsp"/>
	</c:when>
	<c:when test="${param.content.equals('login')}">
		<c:set var="content" value="/coffeeKong/login.jsp"/>
	</c:when>
	<c:when test="${param.content.equals('intro')}">
		<c:set var="content" value="/coffeeKong/information/intro.jsp"/>
	</c:when>
	<c:when test="${param.content.equals('location')}">
		<c:set var="content" value="/coffeeKong/information/location.jsp"/>
	</c:when>
	<c:when test="${param.content.equals('contact')}">
		<c:set var="content" value="/coffeeKong/information/contact.jsp"/>
	</c:when>
	<c:when test="${param.content.equals('uupdate')}">
		<c:set var="content" value="/coffeeKong/user/uUpdate.jsp"/>
	</c:when>
	<c:when test="${param.content.equals('uucompl')}">
		<c:set var="content" value="/coffeeKong/user/uUpdateComplete.jsp"/>
	</c:when>
	<c:when test="${param.content.equals('uolist')}">
		<c:set var="content" value="/coffeeKong/user/uOrderList.jsp"/>
	</c:when>
	<c:when test="${param.content.equals('uodetail')}">
		<c:set var="content" value="/coffeeKong/user/uOrderDetail.jsp"/>
	</c:when>
	<c:when test="${param.content.equals('uresign')}">
		<c:set var="content" value="/coffeeKong/user/uResign.jsp"/>
	</c:when>
	<c:when test="${param.content.equals('urcompl')}">
		<c:set var="content" value="/coffeeKong/user/uResignComplete.jsp"/>
	</c:when>
	<c:when test="${param.content.equals('cart')}">
		<c:set var="content" value="/coffeeKong/user/cart.jsp"/>
	</c:when>
</c:choose>
<body>
	<div>
	<!-- header start-->
		<div id="header">
			<jsp:include page="/coffeeKong/header.jsp"/>
		</div>
	<!-- header end-->
	<!-- content start -->
		<div id="content">
			<jsp:include page="${content }"/>
		</div>
	<!-- content end -->
	<!-- footer start -->
		<div id="footer">
			<jsp:include page="/coffeeKong/footer.jsp"/>
		</div>
	<!-- footer start -->
	</div>
</body>
</html>