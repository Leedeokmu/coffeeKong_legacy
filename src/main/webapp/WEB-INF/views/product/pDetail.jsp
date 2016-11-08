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
<title>Insert title here</title>
</head>
<c:set var="list" value="${reviews }" />
<body>
	<form method="POST" action="/user/tocart" name="tocart">
		<input type="hidden" name="p_id" value="${pvo.p_id}">
		<input type="hidden" name="p_name" value="${pvo.p_name }">
		<input type="hidden" name="p_img" value="${pvo.p_img }">
		<input type="hidden" name="p_price" value="${pvo.p_price }">
		<input type="hidden" name="qty" id="pQty">
		<input type="hidden" name="sub_price">
		
		<div class="container">
			<br>
			<div style="margin:2px;float:left;">
				<img src="${pvo.p_img }" width="400" height="400" alt="productIcon"/>	
			</div>
			<div style="margin:10px;float:left;margin-left:150px">
				<div>
					<h3>Name: ${pvo.p_name }</h3>
				</div>
				<div>
					<h3>Unit Price: <b id="price">${pvo.p_price}</b></h3>	
				</div>
				<div>
					<h3>Quantity:<button type="button" id="minus" onClick="decrease()">-</button> <b class="qty">1</b> <button type="button" id="plus" onClick="increase()">+</button></h3>
				</div>
				<div>
					<h3>TOTAL PRICE :<b id="total"></b></h3>
				</div>
				<c:choose>
					<c:when test="${pvo.p_category eq 'SingleOrigins' || pvo.p_category eq 'Blends' ||pvo.p_category eq 'Decafs' ||pvo.p_category eq 'Light' ||pvo.p_category eq 'Medium' ||pvo.p_category eq 'Dark' ||pvo.p_category eq 'ColdBrew'}">	
						<div>
							<div>
							Size:
							</div>
							<select name="sz" onChange="selectEvent(this)">
							  <option value="0.5kg" selected>0.5kg</option>
							  <option value="1kg">1kg</option>
							  <option value="1.5kg">1.5kg</option>
							  <option value="2kg">2kg</option>
							</select>
						</div>
						<div>
							<div>
							Type:
							</div>
							<select name="type">
							  <option value="Whole bean">Whole bean</option>
							  <option value="Drip">Drip</option>
							  <option value="Espresso">Espresso</option>
							</select>
						</div>
					</c:when>
				</c:choose>
				<div>
					<br />
					<input type="button" id="buy" class="btn btn-success btn-lg" value="TO CART"/>
				</div>
			</div>
			<div style="clear:both;text-align:center;">
				<hr>
					<h3>Product Info</h3>
				<hr>
				<p>${pvo.p_content}</p>
			</div>
			
<!-- 			review section			 -->
			<div style="clear:both;text-align:center;">
				<hr>
					<h3>Review</h3><div style="margin-left:400px;margin-top:-31px"><a href="reviewCtrl?pId=${pvo.p_id}">[WRITE]</a></div>
				<hr>
				<div>in the recent order<hr></div>
				<div>
					<c:forEach var="rvo" items="${list}">
						<div>
							<div>${rvo.u_email }</div>
							<div><span class='star-rating'><span id="${rvo.r_grade }"></span></span></div>
							<div>${rvo.r_date }&nbsp;&nbsp;&nbsp;${pvo.p_name }</div>
							<div><br>${rvo.r_content }</div>
							<div>
								<c:choose>
									<c:when test="${rvo.r_img1 eq 'null'}"></c:when>
									<c:otherwise>
										<img src="${rvo.r_img1 }" width="100" height="100" alt="reviewIcon"/>	
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${rvo.r_img2 eq 'null'}"></c:when>
									<c:otherwise>
										<img src="${rvo.r_img2 }" width="100" height="100" alt="reviewIcon"/>	
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${rvo.r_img3 eq 'null'}"></c:when>
									<c:otherwise>
										<img src="${rvo.r_img3 }" width="100" height="100" alt="reviewIcon"/>	
									</c:otherwise>
								</c:choose>
							</div>
							<div><a href="#">reply</a></div>
							<hr>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div id="isCartModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h3 class="modal-title">CART</h3>
					</div>
					<div class="modal-body">
						<div class="hor_center">
							<div><h3>GO CART?</h3></div>
						</div>
						<div class="hor_center">
							<div><a href="/user/cart" class="btn btn-default btn-lg">CART</a></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<div><span class="cart"></span></div>
</body>
<script type="text/javascript">
	var p_price="${pvo.p_price}";
	var qty=1;
	var total=0;
	var type=1;
	
	function calPrice(){
		total = p_price*qty*type;
		$('#total').text(p_price*qty*type);
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
</script>

</html>