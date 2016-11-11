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
	<div class="u_title text-center"><h2>ORDER</h2></div><br />
		<div class="row">
				<div class="col-md-2"><span>ORDER No</span></div>
				<div class="col-md-5"><span>NAME</span></div>
				<div class="col-md-2"><span>TYPE</span></div>
				<div class="col-md-1"><span>QUENTITY</span></div>
				<div class="col-md-1"><span>SIZE</span></div>
				<div class="col-md-1"><span>PRICE</span></div>
		</div>
		<hr >
		<c:forEach var="ovo" items="${orderList }">
			<c:set var="opvoList" value="${ovo.opvo }"/>
			<div class="row">
				<div class="col-md-2"><a href="/user/order/detail" class="btn btn-default"><span>${ovo.o_id }</span></a></div>
				<c:forEach var="opvo" items="${opvoList }">
					<div class="col-md-5">
						<div class="row" style="width:10em">
							<div class="col-md-6"><a href="/user/order/detail/${ovo.o_id }"><img src="${opvo.p_img }" alt="img" class="img-responsive"/></a></div>
							<div class="col-md-6"><a href="/user/order/detail/${ovo.o_id }"><span>${opvo.p_name }</span></a></div>
						</div>
					</div>
					<div class="col-md-2"><span>${opvo.op_type }</span></div>
					<div class="col-md-1"><span>${opvo.op_qty }</span></div>
					<div class="col-md-1"><span>${opvo.op_sz}</span></div>
					<div class="col-md-1"><span><b>$${opvo.op_price }</b></span></div>
				</c:forEach>
			</div>
			<hr>
		</c:forEach>
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
		<div class="row">
			<div class="hor_center">
				<select name="searchType">
					<option value="nothing" <c:out value="${cri.searchType == null ? 'selnected' : '' }"/>>--------------</option>
					<option value="prodNm" <c:out value="${cri.searchType  eq 'prodNm' ? 'selected' : '' }"/>>Name</option>
				</select>
				<input type="search" class="form-control" name="keyword" value="${cri.keyword }">
				<button id="searchBtn" class="btn btn-default">Search</button>
			</div>			
		</div>
	</div>
	<form id="oList">
		<input type="hidden" name="page" value="${pmk.cri.perPageNum}">
		<input type="hidden" name="perPageNum" value="${pmk.cri.perPageNum}">
	</form>
	<script>
		$(document).ready(function(){
			$('#searchBtn').on("click", function(event){
				self.location = "/user/order/list" +'${pmk.makeQuery(1)}'
				+"&searchType=" +$("select option:selected").val()
				+"&keyword="+$('input[name="keyword"]').val();
			})		
			
// 			 $(".pagination li a").on("click", function(event){
// 				event.preventDefault();
				
// 				var targetPage = $(this).attr("href");
				
// 				var jobForm = $("#jobForm");
// 				jobForm.find("[name='page']").val(targetPage);
// 				jobForm.attr("action","/user/order/list").attr("method", "get");
// 				jobForm.submit();		
// 			});
		})
	</script>
	
</body>
</html>