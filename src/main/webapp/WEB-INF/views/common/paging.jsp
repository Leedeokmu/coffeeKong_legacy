<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<c:set var="basePath" value="${pageContext.request.contextPath }"/>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<input type="hidden" name="curPageNum" value="${param.curPageNum }" />
	<nav class="text-center">
		<div align="center">
			<c:choose>
				<c:when test="${param.curPageNum <= 1 }">
					&laquo;&nbsp;&nbsp;&nbsp;
				</c:when>
				<c:otherwise>
					<a href="javascript:goPage(${param.prevPageNum })" area-label="Previous">&laquo;</a>&nbsp;&nbsp;&nbsp;
				</c:otherwise>
			</c:choose>
			
			
			<c:forEach var="i" begin="${param.startPageNum }" end="${param.endPageNum }" step="1">
				<c:choose>
					<c:when test="${i eq param.curPageNum }">
						&nbsp; ${i } &nbsp;
					</c:when>
					<c:otherwise>
						&nbsp; <a href="javascript:goPage(${i })">${i }</a> &nbsp;
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${param.curPageNum eq param.finalPageNum }">
					&nbsp;&nbsp;&nbsp;&raquo;
				</c:when>
				<c:otherwise>
					&nbsp;&nbsp;&nbsp;<a href="javascript:goPage(${param.nextPageNum })" area-label="Next">&raquo;</a>
				</c:otherwise>
			</c:choose>
		</div>	
	</nav>
</body>
</html>