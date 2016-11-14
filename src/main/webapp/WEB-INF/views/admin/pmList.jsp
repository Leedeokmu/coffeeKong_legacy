<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>COFFEE KONG.</title>
</head>
<body>
	<div class="container-fluid a_article" style="margin-left:30px;margin-right:30px;">
		<div class="a_title text-center"><h2>PRODUCT LIST</h2></div><br /><br />
		
		<div class="row text-center">
			<div class="col-md-1"><span>ID</span></div>
			<div class="col-md-2"><span></span></div>
			<div class="col-md-3"><span>NAME</span></div>
			<div class="col-md-2"><span>CATEGORY</span></div>
			<div class="col-md-2"><span>PRICE</span></div>
			<div class="col-md-2"><span>REGISTERED</span></div>
			
		</div><hr />
		<c:forEach var="pvo" items="${list}">
			<div class="row ver_center text-center">
				<div class="col-md-1"><span>${pvo.p_id }</span></div>
				<div class="col-md-2"><span><a href="/manage/product/detail${pmk.makeSearch(pmk.cri.page) }&pid=${pvo.p_id}"><img src="${pvo.p_img }" alt="img" style="width:5em"/></a></span></div>
				<div class="col-md-3 h_nav"><span><a href="/manage/product/detail${pmk.makeSearch(pmk.cri.page) }&pid=${pvo.p_id}">${pvo.p_name }</a></span></div>
				<div class="col-md-2"><span>${pvo.p_category}</span></div>
				<div class="col-md-2"><span>${pvo.p_price }</span></div>
				<div class="col-md-2"><span>${pvo.p_rdate }</span></div>
			</div>
			<hr />
		</c:forEach>
		<div class="row hor_right h_nav" style="margin-right:5em">
			<h4><a href="/manage/product/insert${pmk.makeSearch(pmk.cri.page) }" class="btn btn-default btn-lg">INSERT PRODUCT</a></h4>
		</div>
		<div class="row text-center">
			<ul class="pagination">
				<c:if test ="${pmk.prev }">
					<li><a href="/manage/product/list${pmk.makeSearch(pmk.startPage - 1) }">&laquo;</a></li>
				</c:if>
				<c:forEach begin="${pmk.startPage }" end="${pmk.endPage }" var="idx">
					<li <c:out value="${pmk.cri.page == idx? 'class=active' : '' }"/>>
						<a href="/manage/product/list${pmk.makeSearch(idx)}">${idx }</a>
					</li>
				</c:forEach>
				<c:if test ="${pmk.next && pmk.endPage > 0}">
					<li><a href="/manage/product/list${pmk.makeSearch(pmk.endPage + 1) }">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
		<div class="row hor_center form-inline">
			<select name="searchType" class="form-control">
				<option value="nothing" <c:out value="${cri.searchType == null ? 'selnected' : '' }"/>>--------------</option>
				<option value="prodNm" <c:out value="${cri.searchType  eq 'prodNm' ? 'selected' : '' }"/>>Product Name</option>
				<option value="category" <c:out value="${cri.searchType  eq 'category' ? 'selected' : '' }"/>>Category</option>
				
			</select>
			<input type="search" class="form-control" name="keyword" value="${cri.keyword }">
			<button id="searchBtn" class="btn btn-default">Search</button>
		</div>
	</div>
	
	<script>
		$(document).ready(function(){
			function search(){
				self.location = "/manage/product/list" +'${pmk.makeQuery(1)}'
				+"&searchType=" +$('select[name="searchType"]').val()
				+"&keyword="+$('input[type="search"]').val().toLowerCase();
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
	</script>
</body>
</html>