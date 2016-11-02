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
<title>COFFEE KONG.</title>
</head>
<c:set var="basePath" value="${pageContext.request.contextPath }"/>
<c:choose>
	<c:when test="${param.content ==null || param.content == ''}">
		<c:set var="content" value="/coffeeKong/content.jsp" />
	</c:when>
	<c:when test="${param.content.equals('plist') }">
		<c:set var="content" value="/coffeeKong/product/pList.jsp" />
	</c:when>
	<c:when test="${param.content.equals('pdetail') }">
		<c:set var="content" value="/coffeeKong/product/pDetail.jsp" />
	</c:when>
	<c:when test="${param.content.equals('order') }">
		<c:set var="content" value="/coffeeKong/product/order.jsp" />
	</c:when>
	<c:when test="${param.content.equals('ocompl') }">
		<c:set var="content" value="/coffeeKong/product/orderComplete.jsp" />
	</c:when>
	<c:when test="${param.content.equals('preview') }">
		<c:set var="content" value="/coffeeKong/product/review.jsp" />
	</c:when>
</c:choose>
<body>

<div id="container">
<!-- header start-->
	<div id="header"><jsp:include page="/coffeeKong/product/header.jsp"/></div>
<!-- header end-->

<!-- content start -->
	<div id="content"><jsp:include page="${content }"/></div>
<!-- content start -->

<!-- footer start -->
	<div id="footer"><jsp:include page="/coffeeKong/footer.jsp"/></div>
<!-- footer start -->
</div>
</body>
</html>