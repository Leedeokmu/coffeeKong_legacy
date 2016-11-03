<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<c:set var="basePath" value="${pageContext.request.contextPath }"/>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>WELCOME MANAGER</title>
<link rel="stylesheet" href="${basePath}/css/style.css" />
<link href="${basePath}/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${basePath }/js/script.js"></script>
</head>
<c:choose>
	<c:when test="${param.content ==null || param.content == ''}">
		<c:set var="content" value="/coffeeKong/content.jsp" />
	</c:when>
	<c:when test="${param.content.equals('umlist') }">
		<c:set var="content" value="/coffeeKong/admin/umList.jsp" />
	</c:when>
	<c:when test="${param.content.equals('umdetail') }">
		<c:set var="content" value="/coffeeKong/admin/umDetail.jsp" />
	</c:when>
	<c:when test="${param.content.equals('umupdate') }">
		<c:set var="content" value="/coffeeKong/admin/umUpdate.jsp" />
	</c:when>
	<c:when test="${param.content.equals('pmlist') }">
		<c:set var="content" value="/coffeeKong/admin/pmList.jsp" />
	</c:when>
	<c:when test="${param.content.equals('pminsert') }">
		<c:set var="content" value="/coffeeKong/admin/pmInsert.jsp" />
	</c:when>
	<c:when test="${param.content.equals('pmdetail') }">
		<c:set var="content" value="/coffeeKong/admin/pmDetail.jsp" />
	</c:when>
	<c:when test="${param.content.equals('pmupdate') }">
		<c:set var="content" value="/coffeeKong/admin/pmUpdate.jsp" />
	</c:when>
	<c:when test="${param.content.equals('omlist') }">
		<c:set var="content" value="/coffeeKong/admin/omList.jsp" />
	</c:when>
	<c:when test="${param.content.equals('omdetail') }">
		<c:set var="content" value="/coffeeKong/admin/omDetail.jsp" />
	</c:when>
	<c:when test="${param.content.equals('omupdate') }">
		<c:set var="content" value="/coffeeKong/admin/omUpdate.jsp" />
	</c:when>
</c:choose>
<c:set var="gId" value="${id}"/>
<body>
<div class="container">
	<!-- header start-->
	<div class="row ver_center header">
		<div class="col-md-7 h_title">
			<span class="h3"><strong><a href="${basePath }/umListCtrl">COFFEE KONG</a></strong></span>
		</div>
		<div class="col-md-5 h_nav">
			<c:catch>
				<c:choose>
					<c:when test="${gId.equals('admin@coffeeKong.com')}">
						<ul class="list-inline">
							<li><a href="${basePath }/umListCtrl">MANAGE USER</a></li>
							<li><a href="${basePath }/pmListCtrl">MANAGE PRODUCT</a></li>
							<li><a href="${basePath }/omListCtrl">MANAGE ORDER</a></li>
							<li><a href="${basePath }/coffeeKong/logout.jsp">LOGOUT</a></li>
						</ul>
					</c:when>
					<c:otherwise>s
						<h1>YOU JUST SILLY HACKER, DUDE.</h1>
						<c:set var="content" value="/coffeeKong/content.jsp" />
					</c:otherwise>
				</c:choose>
			</c:catch>
		</div>
	</div>
</div>
	<!-- header end-->
	
	<!-- content start -->
	<div id="content">
		<jsp:include page="${content }"/>
	</div>
	<!-- content end -->
	
	<!-- footer start -->
	<div id="footer">
		<jsp:include page="../footer.jsp"/>
	</div>
	<!-- footer end -->
<script src="http://code.jquery.com/jquery-3.1.1.js" integrity="sha256-16cdPddA6VdVInumRGo6IbivbERE8p7CQR3HzTBuELA=" crossorigin="anonymous"></script>
<script src="${basePath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</body>
</html>