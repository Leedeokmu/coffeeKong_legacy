<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>WELCOME MANAGER</title>
<link rel="stylesheet" href="/resources/css/style.css" />
<link rel="stylesheet" href="/resources/css/image.css" />
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-3.1.1.js"
	integrity="sha256-16cdPddA6VdVInumRGo6IbivbERE8p7CQR3HzTBuELA="
	crossorigin="anonymous"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<script src="http://malsup.github.io/min/jquery.form.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.min.js"></script>
<script src="/resources/js/script.js"></script>
</head>
<c:choose>
	<c:when test="${content == null || content == ''}">
		<c:set var="content" value="./content.jsp" />
	</c:when>
	<c:when test="${content.equals('login') }">
		<c:set var="content" value="./login.jsp" />
	</c:when>
	<c:when test="${content.equals('umlist') }">
		<c:set var="content" value="./umList.jsp" />
	</c:when>
	<c:when test="${content.equals('umdetail') }">
		<c:set var="content" value="./umDetail.jsp" />
	</c:when>
	<c:when test="${content.equals('umupdate') }">
		<c:set var="content" value="./umUpdate.jsp" />
	</c:when>
	<c:when test="${content.equals('pmlist') }">
		<c:set var="content" value="./pmList.jsp" />
	</c:when>
	<c:when test="${content.equals('pminsert') }">
		<c:set var="content" value="./pmInsert.jsp" />
	</c:when>
	<c:when test="${content.equals('pmdetail') }">
		<c:set var="content" value="./pmDetail.jsp" />
	</c:when>
	<c:when test="${content.equals('pmupdate') }">
		<c:set var="content" value="./pmUpdate.jsp" />
	</c:when>
	<c:when test="${content.equals('omlist') }">
		<c:set var="content" value="./omList.jsp" />
	</c:when>
	<c:when test="${content.equals('omdetail') }">
		<c:set var="content" value="./omDetail.jsp" />
	</c:when>
	<c:when test="${content.equals('omupdate') }">
		<c:set var="content" value="./omUpdate.jsp" />
	</c:when>
</c:choose>
<body>
	<!-- header start-->
	<div class="container">
		<div class="row ver_center header">
			<div class="col-md-4 h_title">
				<span class="h3"><strong><a href="/manage">COFFEE KONG</a></strong></span>
			</div>
			<div class="col-md-8 h_nav">
				<c:catch>
					<c:choose>
						<c:when test="${mgr != null}">
							<ul class="list-inline">
								<li>${mgr.m_email }</li>
								<li><a href="/manage/user/list">MANAGE USER</a></li>
								<li><a href="/manage/product/list">MANAGE PRODUCT</a></li>
								<li><a href="/manage/order/list">MANAGE ORDER</a></li>
								<li><a href="/logout">LOGOUT</a></li>
							</ul>
						</c:when>
						<c:otherwise>
							<h1>LOGIN PLEASE.</h1>
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
	
</body>
</html>