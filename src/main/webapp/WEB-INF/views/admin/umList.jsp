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
<script type="text/javascript">
	function goPage(pageNum){
		umpForm.curPageNum.value = pageNum;
		umpForm.action = "${basePath}/umListCtrl";
		umpForm.submit();
	}
</script>
</head>
<body>
	<div class="a_title text-center"><h2><span>USER LIST</span></h2></div><br /><br />
	<div class="container a_article">
		<div class="row text-center">
			<div class="col-md-3"><span>EMAIL</span></div>
			<div class="col-md-3"><span>FIRST NAME</span></div>
			<div class="col-md-3"><span>LAST NAME</span></div>
			<div class="col-md-3"><span>POINT</span></div>
		</div>
		<hr>
		<c:forEach var="vo" items="${userList }">
			<div class="row text-center">
				<div class="col-md-3"><a href="${basePath }/umDetailCtrl?email=${vo.u_email }" class="btn btn-default">${vo.u_email }</a></div>
				<div class="col-md-3">${vo.u_fname }</div>
				<div class="col-md-3">${vo.u_lname }</div>
				<div class="col-md-3">${vo.u_point }</div>
			</div>
			<hr />
		</c:forEach>
		<form action="" name="umpForm">
			<div>
				<jsp:include page="/coffeeKong/common/paging.jsp" flush="true">
					<jsp:param name="firstPageNum" value="${paging.firstPageNum }"/>
					<jsp:param name="finalPageNum" value="${paging.finalPageNum }"/>
					<jsp:param name="prevPageNum" value="${paging.prevPageNum }"/>
					<jsp:param name="nextPageNum" value="${paging.nextPageNum }"/>
					<jsp:param name="startPageNum" value="${paging.startPageNum }"/>
					<jsp:param name="endPageNum" value="${paging.endPageNum }"/>
					<jsp:param name="curPageNum" value="${paging.curPageNum }"/>
				</jsp:include>	
			</div>
		</form>
	</div>
</body>
</html>