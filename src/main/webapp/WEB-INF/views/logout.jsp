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

<title>Insert title here</title>
<link href="${basePath}/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<%
	session.invalidate();
%>
<body>
<% 	response.sendRedirect("../index.html"); %>

<script src="http://code.jquery.com/jquery-3.1.1.js" integrity="sha256-16cdPddA6VdVInumRGo6IbivbERE8p7CQR3HzTBuELA=" crossorigin="anonymous"></script>
<script src="${basePath}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</body>
</html>