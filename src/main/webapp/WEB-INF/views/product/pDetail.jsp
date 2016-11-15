<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>COFFEE KONG.</title>
</head>
<style>
	.jumbotron{
		background-color: white;
	}
</style>
<body>
	<div class="container">
		<form method="POST" action="/user/tocart" name="tocart">
		<input type="hidden" name="p_id" value="${pvo.p_id}">
		<input type="hidden" name="p_name" value="${pvo.p_name }">
		<input type="hidden" name="p_category" value="${pvo.p_category}">
		<input type="hidden" name="p_img" value="${pvo.p_img }">
		<input type="hidden" name="p_price" value="${pvo.p_price }">
		<input type="hidden" name="qty" id="pQty">
		<input type="hidden" name="sub_price">
		<div class="row  u_article">
			<div class="col-md-6 all_center">
				<img src="${pvo.p_img }"style="width:25em;height:25em"/>
			</div>
			
			<div class="col-md-6">
				<div class="row">
					<span class="col-md-6 h3">NAME</span>
					<span class="col-md-6 h3">${pvo.p_name }</span>
				</div>
				<div class="row">
					<span class="col-md-6 h3">PRICE</span>
					<span class="col-md-6 h3">$${pvo.p_price}</span>
				</div>
				<div class="row">
					<span class="col-md-6 h3">QUANTITY</span>
					<span class="col-md-6 h3">
						<button type="button" id="minus" class="btn btn-default btn-sm" onClick="decrease()">-</button>
							<b class="qty">1</b>
						<button type="button" id="plus" class="btn btn-default btn-sm" onClick="increase()">+</button>
					</span>	
				</div>
				<div class="row">
					<span class="col-md-6 h3">TOTAL PRICE</span>
					<span class="col-md-6 h3">$<b id="total"></b></span>
				</div>
				<c:choose>
				<c:when test="${pvo.p_category eq 'SingleOrigins' || pvo.p_category eq 'Blends' ||pvo.p_category eq 'Decafs' ||pvo.p_category eq 'Light' ||pvo.p_category eq 'Medium' ||pvo.p_category eq 'Dark' ||pvo.p_category eq 'ColdBrew'}">	
					<div class="row">
						<span class="col-md-6 h3">SIZE</span>
						<div class="col-md-6">
							<select name="sz" class="form-control" onChange="selectEvent(this)">
							  <option value="0.5kg" selected>0.5kg</option>
							  <option value="1kg">1kg</option>
							  <option value="1.5kg">1.5kg</option>
							  <option value="2kg">2kg</option>
							</select>
						</div>
					</div>
					<div class="row">
						<span class="col-md-6 h3">TYPE</span>
						<div class="col-md-6">
							<select name="type" class="form-control">
							  <option value="Whole bean">Whole bean</option>
							  <option value="Drip">Drip</option>
							  <option value="Espresso">Espresso</option>
							</select>
						</div>
					</div>
				</c:when>
				</c:choose>
				<br />
				<div class="row hor_center h_nav">
					<a href="#" id="buy"><h3>TO CART</h3></a>
				</div>
			</div>
		</div>
		</form>			
		<div class="row">
			<hr>
				<p style="padding:2em">${pvo.p_content}</p>
			<hr>
		</div>
<!-- 			review section			 -->
		<div class="row u_title" style="margin-left:2em"><h3>Customer Review</h3></div>
		<div class="u_article">
		<c:choose>
		<c:when test="${login == null }">
			<div class="row h_nav">
				<span>Please <a href="#loginModal" data-toggle="modal">login</a> to review this product.</span>
			</div>
		</c:when>
		<c:otherwise>
			<div class="row jumbotron">
				<form action="/product/review" method="post">
					<div class="">
						<h4><span><b>POST REVIEW</b></span></h4>
					</div>
					<div class="form-group">
						<label for="reviewContent" class="control-label">CONTENT</label>
						<textarea name="r_content" id="reviewContent" class="form-control" cols="30" rows="3"></textarea>
					</div>
					<div class="star-input">
						<span class="input">
					    	<input type="radio" name="r_grade" id="p1" value="one"><label for="p1">0.5</label>
						    <input type="radio" name="r_grade" id="p2" value="two"><label for="p2">1</label>
						    <input type="radio" name="r_grade" id="p3" value="three"><label for="p3">1.5</label>
						    <input type="radio" name="r_grade" id="p4" value="four"><label for="p4">2</label>
						    <input type="radio" name="r_grade" id="p5" value="five"><label for="p5">2.5</label>
						    <input type="radio" name="r_grade" id="p6" value="six"><label for="p6">3</label>
						    <input type="radio" name="r_grade" id="p7" value="seven"><label for="p7">3.5</label>
						    <input type="radio" name="r_grade" id="p8" value="eight"><label for="p8">4</label>
						    <input type="radio" name="r_grade" id="p9" value="nine"><label for="p9">4.5</label>
						    <input type="radio" name="r_grade" id="p10" value="ten"><label for="p10">5</label>
						</span>
						<output for="star-input" style="margin-top:-8px;"></output>
					</div>
					<div class="hor_center">
						<input type="submit" class="btn btn-default" value="POST"/>
					</div>
<!-- 					<div class='star-rating'><span id="p1"></span></div> -->
				</form>
			</div>
		</c:otherwise>
		</c:choose>
		<hr>
		<div class="reviewDiv"></div>
		<div class='text-center'>
			<ul id="pagination" class="pagination pagination-sm no-margin "></ul>
		</div>
	</div>
	<div id="isCartModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title text-center">CART</h3>
				</div>
				<div class="modal-body">
					<div class="hor_center" style="margin:5em">
						<div><h4>WANT TO SEE PRODUCTS IN CART?</h4></div>
					</div>
				</div>
				<div class="modal-footer">
					<div><a href="/user/cart" class="btn btn-default btn-lg">GO</a></div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<div><span class="cart"></span></div>
</body>
<script type="text/javascript">
	var p_price="${pvo.p_price}";
	var qty=1;
	var total=0;
	var type=1;
	
	function calPrice(){
		total = p_price*qty*type;
		$('#total').text(total.toFixed(2));
	}
	function increase(){
		if(qty>100){
			qty=100;
			alert("the maximum of qty is 100");
		}
		qty++;
		$('b.qty').text(qty);
		calPrice();
	}
	function decrease(){
		qty--;
		if(qty<1) qty=1;
		$('b.qty').text(qty);
		calPrice();
	}
	function selectEvent(selectObj) {
	    if(selectObj.value == "0.5kg"){
	    	type=1;
	    }else if(selectObj.value == "1kg"){
	    	type=2;
	    }else if(selectObj.value == "1.5kg"){
	    	type=3;
	    }else{
	    	type=4;
	    }
	    calPrice();
	}
	
	$('#buy').on("click", function(event){
		event.preventDefault();
		$('input[name="qty"]').attr("value",qty);
		$('input[name="sub_price"]').attr("value",total);
		
		var form = $('form[name="tocart"]');
		var data = form_to_json(form);
		
		$.ajax({
			type:'POST',
			url: '/user/tocart',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dateType: 'json',
			data: JSON.stringify(data),
			success : function(result){
				if(result == "Success"){
					$('#isCartModal').modal();
				}else if(result == "Fail"){
					
				}
			}
			,
		 	error: function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});
	});

	$(document).ready(function(){
		calPrice();
	})
	
	
	
	
	
	</script>

</html>