<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
</head>
<body>
	<div class="a_title text-center"><h2>PRODUCTS IN YOUR CART</h2></div><br />
	<div class="container a_article">
		<c:forEach var="cvo" items="${cart}" varStatus="index" begin="0" step="1">
			<form action="/user/cart/update" role="form" name="tocart<c:out value="${index }"/>">
				<input type="hidden" name="c_num" value="${cvo.c_num }"/>
				<input type="hidden" name="sub_price" />
				<input type="hidden" name="qty" />
				
				<div class="hor_center">
					<div class="row">
						<div class="col-md-5">
							<img src="${cvo.p_img }" alt="img" class="img-responsive thumbnail" />
						</div>
						<div class="col-md-7" style="margin-top:5em">
							<div class="row">
								<span class="col-md-3">NAME</span>
								<span class="col-md-9">${cvo.p_name }</span>
							</div>
							<div class="row">
								<span class="col-md-3">TYPE</span>
								<span class="col-md-9">
									<select name="type" id="type<c:out value="${index }"/>">
										<option value="Whole bean" <c:out value="${cart.type eq 'Whole bean'? selected : ''}"/>>Whole bean</option>
										<option value="Drip" <c:out value="${cart.type eq 'Drip'? selected : ''}"/>>Drip</option>
										<option value="Espresso" <c:out value="${cart.type eq 'Espresso'? selected : ''}"/>>Espresso</option>
									</select>
								</span>
							</div>
							<div class="row">
								<span class="col-md-3">QUNETYTY</span>
								<span class="col-md-9"><button type="button" id="minus" class="btn btn-default btn-sm" onClick="decrease(this)">-</button>&nbsp;<span id="qty<c:out value="${index }"/>">${cvo.qty}</span>&nbsp;<button type="button" class="btn btn-default btn-sm" id="plus" onClick="increase(this)">+</button></span>
							</div>
							<div class="row">
								<span class="col-md-3">SIZE</span>
								<span class="col-md-9">
									<select name="sz" onChange="defSz(this)" id="sz<c:out value="${index }"/>">
										<option value="0.5kg" <c:out value="${cart.sz eq '0.5kg'? selected : ''}"/>>0.5kg</option>
										<option value="1kg" <c:out value="${cart.sz eq '1kg'? selected : ''}"/>>1kg</option>
										<option value="1.5kg" <c:out value="${cart.sz eq '1.5kg'? selected : ''}"/>>1.5kg</option>
										<option value="2kg" <c:out value="${cart.sz eq '2kg'? selected : ''}"/>>2kg</option>
									</select>
								</span>
							</div>
							<div class="row">
								<span class="col-md-3">PRICE</span>
								<span class="col-md-9">$<strong id="price<c:out value="${index }"/>">${cvo.p_price }</strong></span>
							</div>
							<div class="row">
								<span class="col-md-3">SUB PRICE</span>
								<span class="col-md-9">$<strong id="subprice<c:out value="${index }"/>">${cvo.sub_price }</strong></span>
							</div>
						</div>
					</div>
				</div>
				<hr />
				<div class="hor_center">
					<input type="submit" value="UPDATE CART" id="btn<c:out value="${index }"/>"/>
				</div>
			</form>
		</c:forEach>
		<div>
			<a href="/order" class="btn btn-success btn-lg">CHECKOUT</a>
		</div>
	</div>
	<script>
	function calPrice(className){
		var delim = className.substr(className.length-1);
		var formName = 'tocart'+delim;
		
		var price = parseInt($(formName).find('#price'+delim).text());
		var qty = parseInt($(formName).find('#qty'+delim).text());
		var type = getSz($(formName).find('#sz'+delim));
		
		var total = p_price*qty*type;
		$('#subprice'+qty).text(p_price*qty*type);
	}
	function increase(obj){
		var qty = $(obj).siblings('span').text();
		if(qty>100){
			qty=100;
			alert("the maximum of qty is 100");
		}
		qty++;
		$(obj).siblings('span').text(qty);
		calPrice(obj.attr("class"));
	}
	function decrease(obj){
		var qty = $(obj).siblings('span').text();
		qty--;
		if(qty<1) qty=1;
		$(obj).siblings('span').text(qty);
		calPrice(obj.sibliings('span').attr("class"));
	}
	function getSz(Obj) {
	    if(Obj.value == "0.5kg"){
	    	var	type=1;
	    }else if(Obj.value == "1kg"){
	    	var type=2;
	    }else if(Obj.value == "1.5kg"){
	    	var type=3;
	    }else{
	    	var type=4;
	    }
	    return type;
	}
	
	function defSz(selectObj) {
	    calPrice(selectObj.attr("class"));
	}
	
	$('input[type="submit"]').on("click", function(event){
		event.preventDefault();
		
		var num = $(this).id.substr($(this).id.legnth-1);
		var form = $('input[name="tocart'+num+'"]');
		var qty = form.find('#qty'+num).text();
		var subprice = form.find('#subprice'+num).text();
		
		form.find('input[name="qty"]').attr("value",qty);
		form.find('input[name="sub_price"]').attr("value",subprice);
		
    	var data = form_to_json(form);
		
		$.ajax({
    		type:'POST',
    		url: '/user/cart/update',
    		headers : {
    			"Content-Type" : "application/json",
    			"X-HTTP-Method-Override" : "POST"
    		},
    		dateType: 'json',
    		data: JSON.stringify(data),
    		success : function(result){
    			if(result == "Success"){
    				window.location.reload()
    			}else if(result == "Fail"){
    				
    			}
    		}
    		,
    	 	error: function(request,status,error){
    	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    	    }
    	});
	});	
	
	$('form[role="form"]').on("submit", function(event){
			event.preventDefault();
			
			
			
	})
	</script>
</body>
</html>