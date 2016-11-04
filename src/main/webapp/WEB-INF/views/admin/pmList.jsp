<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="basePath" value="${pageContext.request.contextPath}" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script type="text/javascript">
	function goPage(pageNum){
		pmForm.curPageNum.value = pageNum;
		pmForm.action = "${basePath}/pmListCtrl";
		pmForm.submit();
	}
</script>
</head>
<body>
<div class="a_title text-center"><h2>PRODUCT LIST</h2></div><br /><br />
	<div class="container-fluid a_article" style="margin-left:30px;margin-right:30px;">
		<div class="row text-center">
			<div class="col-md-1"><span></span></div>
			<div class="col-md-3"><span>NAME</span></div>
			<div class="col-md-2"><span>PRICE</span></div>
			<div class="col-md-2"><span>DATE</span></div>
			<div class="col-md-2"><span></span></div>
			<div class="col-md-2 h_nav"><span><a href="${basePath}/coffeeKong/admin/adminPage.jsp?content=pminsert">[post]</a></span></div>
		</div><hr />
		<c:forEach var="vo" items="${products}">
			<div class="row ver_center text-center">
				<div class="col-md-1"><span><a href="pmDetailCtrl?pId=${vo.p_id}"><img src="${vo.p_img }" alt="img" class="img-responsive thumbnail"/></a></span></div>
				<div class="col-md-3 h_nav"><span><a href="pmDetailCtrl?pId=${vo.p_id}">${vo.p_name }</a></span></div>
				<div class="col-md-2"><span>${vo.p_price }</span></div>
				<div class="col-md-2"><span>${vo.p_rdate }</span></div>
				<div class="col-md-2 h_nav"><span><a href="pmUpdateCtrl?pId=${vo.p_id}">[edit]</a></span></div>
				<div class="col-md-2 h_nav"><span><a href="pmDeleteCtrl?pId=${vo.p_id}">[delete]</a></span></div>
			</div>
			<hr />
		</c:forEach>
	</div>
</body>
</html>