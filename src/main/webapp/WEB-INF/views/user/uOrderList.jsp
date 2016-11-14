<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>COFFEE KONG.</title>
</head>
<body>
	<div class="container-fluid" style="margin-left:30px;margin-right:30px">
	<div class="u_title hor_center"><h2>YOUR ORDERS</h2></div><br />
		<div class="row hor_center">
				<div class="col-md-2" class="text-center"><span>ORDER NO</span></div>
				<div class="col-md-10" class="text-center"><span>PRODUCT INFORMATION</span></div>
		</div>
		<hr >
		<c:choose>
			<c:when test="${search eq 'off' }">
			<c:forEach var="ovo" items="${list }">
				<c:if test="${fn:length(ovo.opvo) > 0 }">
					<div class="row all_center">
						<div class="col-md-2 h_nav text-center">${ovo.o_id }<br /><a href="/user/order/detail/${ovo.o_id }${pmk.makeSearch(pmk.cri.page) }" class="h_nav"><span>[ORDER DETAIL]</span></a></div>
						<div class="col-md-9">
						<c:forEach var="opvo" items="${ovo.opvo }">	
							<div class="row">
								<div class="col-md-3"><a href="/product/detail${pmk.makeSearch(pmk.cri.page) }&pid=${opvo.p_id }"><img src="${opvo.p_img }" style="width:5em" alt="img" /></a></div>
								<div class="col-md-3 h_nav"><a href="/product/detail${pmk.makeSearch(pmk.cri.page) }&pid=${opvo.p_id }"><span>${opvo.p_name }</span></a></div>
								<div class="col-md-3"><span>${opvo.op_type }</span></div>
								<div class="col-md-1"><span>${opvo.op_qty }</span></div>
								<div class="col-md-2"><span>${opvo.op_sz}</span></div>
							</div>
						</c:forEach>
						</div>
						<div class="col-md-1"><span><b>$${ovo.o_price }</b></span></div>
					</div>
					<hr>
				</c:if>
			</c:forEach>
			</c:when>
			<c:when test="${search eq 'on' }">
			<c:forEach var="ovo" items="${list }">
				<c:if test="${fn:length(ovo.opvo) > 0 }">
				<div class="row ver_center">
					<div class="col-md-2 h_nav text-center">${ovo.o_id }<br /><a href="/user/order/detail/${ovo.o_id }${pmk.makeSearch(pmk.cri.page) }" class="h_nav"><span>[ORDER DETAIL]</span></a></div>
					<div class="col-md-10">
					<c:forEach var="opvo" items="${ovo.opvo }">	
						<div class="row">
							<div class="col-md-3"><a href="/product/detail${pmk.makeSearch(pmk.cri.page) }&pid=${opvo.p_id }"><img src="${opvo.p_img }" style="width:5em" alt="img" /></a></div>
							<div class="col-md-3 h_nav"><a href="/product/detail${pmk.makeSearch(pmk.cri.page) }&pid=${opvo.p_id }"><span>${opvo.p_name }</span></a></div>
							<div class="col-md-2"><span>${opvo.op_type }</span></div>
							<div class="col-md-1"><span>${opvo.op_qty }</span></div>
							<div class="col-md-2"><span>${opvo.op_sz}</span></div>
							<div class="col-md-1"><span><b>$${opvo.op_price }</b></span></div>
						</div>
					</c:forEach>
					</div>
				</div>
				<hr>
				</c:if>
			</c:forEach>
			</c:when>
		</c:choose>
		<div class="row text-center">
			<ul class="pagination">
				<c:if test ="${pmk.prev }">
					<li><a href="/user/order/list${pmk.makeSearch(pmk.startPage - 1) }">&laquo;</a></li>
				</c:if>
				<c:forEach begin="${pmk.startPage }" end="${pmk.endPage }" var="idx">
					<li <c:out value="${pmk.cri.page == idx? 'class=active' : '' }"/>>
						<a href="/user/order/list${pmk.makeSearch(idx)}">${idx }</a>
					</li>
				</c:forEach>
				<c:if test ="${pmk.next && pmk.endPage > 0}">
					<li><a href="/user/order/list${pmk.makeSearch(pmk.endPage + 1) }">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
		<div class="row hor_center form-inline">
			<select name="searchType" class="form-control">
				<option value="nothing" <c:out value="${cri.searchType == null ? 'selnected' : '' }"/>>--------------</option>
				<option value="prodNm" <c:out value="${cri.searchType  eq 'prodNm' ? 'selected' : '' }"/>>Name</option>
			</select>
			<input type="search" class="form-control" name="keyword" value="${cri.keyword }">
			<button id="searchBtn" class="btn btn-default">Search</button>
		</div>
	</div>
	<form id="oList">
		<input type="hidden" name="page" value="${pmk.cri.perPageNum}">
		<input type="hidden" name="perPageNum" value="${pmk.cri.perPageNum}">
	</form>
	<script>
		$(document).ready(function(){
			function search(){
				self.location = "/user/order/list" +'${pmk.makeQuery(1)}'
				+"&searchType=" +$("select option:selected").val()
				+"&keyword="+$('input[name="keyword"]').val().toLowerCase();
			}
			
			$('#searchBtn').on("click", function(event){
				search();
			});
			$('input[name="keyword"]').on("keyup", function(event) {
    			if (event.keyCode == 13) {
    				search();
    			}
			});
			
		});
// 			 $(".pagination li a").on("click", function(event){
// 				event.preventDefault();
				
// 				var targetPage = $(this).attr("href");
				
// 				var jobForm = $("#jobForm");
// 				jobForm.find("[name='page']").val(targetPage);
// 				jobForm.attr("action","/user/order/list").attr("method", "get");
// 				jobForm.submit();		
// 			});
	</script>
	
</body>
</html>