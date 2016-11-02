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
<title>COFFEE KONG.</title>
<title>Insert title here</title>
<link href="${basePath}/bootstrap-3.3.7-dist/css/my-css.css" rel="stylesheet">
</head>
<c:set var="vo" value="${aProduct}"/>
<c:set var="list" value="${reviews }" />
<body>
	<form method="POST" action="${basePath }/cInsertCtrl" name="uForm">
		<input type="hidden" name="pId" value="${vo.p_id}">
		<input type="hidden" name="gId" value="${id}">
		<input type="hidden" name="pTotal" id="pTotal">
		<input type="hidden" name="pQty" id="pQty">
		<div class="container">
			<br>
			<div style="margin:2px;float:left;">
				<img src="${vo.p_img }" width="400" height="400" alt="productIcon"/>	
			</div>
			<div style="margin:10px;float:left;margin-left:150px">
				<div>
					<h3>Name: ${vo.p_name }</h3>
				</div>
				<div>
					<h3>Price: <b id="price">${vo.p_price}</b></h3>	
				</div>
				<div>
					<h3>Quantity:<button type="button" id="minus" onClick="decrease()">-</button> <b class="qty">1</b> <button type="button" id="plus" onClick="increase()">+</button></h3>
				</div>
				<div>
					<h3>Total price(qty):<b id="total"></b></h3>
				</div>
				<c:choose>
					<c:when test="${vo.p_category eq 'SingleOrigins' || vo.p_category eq 'Blends' ||vo.p_category eq 'Decafs' ||vo.p_category eq 'Light' ||vo.p_category eq 'Medium' ||vo.p_category eq 'Dark' ||vo.p_category eq 'ColdBrew'}">	
						<div>
							<div>
							Size:
							</div>
							<select name="iSz" onChange="javascript:selectEvent(this)">
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
							<select name="iType">
							  <option value="Whole bean">Whole bean</option>
							  <option value="Drip">Drip</option>
							  <option value="Espresso">Espresso</option>
							</select>
						</div>
					</c:when>
				</c:choose>
				<div>
					<br />
					<a href="javascript:buy()">[ADD TO CART]</a>&nbsp;&nbsp;
				</div>
			</div>
			<div style="clear:both;text-align:center;">
				<hr>
					<h3>Product Info</h3>
				<hr>
				<p>${vo.p_content}</p>
			</div>
			
			<div style="clear:both;text-align:center;">
				<hr>
					<h3>Review</h3><div style="margin-left:400px;margin-top:-31px"><a href="reviewCtrl?pId=${vo.p_id}">[WRITE]</a></div>
				<hr>
				<div>in the recent order<hr></div>
				<div>
					<c:forEach var="rVo" items="${list}">
						<div>
							<div>${rVo.u_email }</div>
							<div><span class='star-rating'><span id="${rVo.r_grade }"></span></span></div>
							<div>${rVo.r_date }&nbsp;&nbsp;&nbsp;${vo.p_name }</div>
							<div><br>${rVo.r_content }</div>
							<div>
								<c:choose>
									<c:when test="${rVo.r_img1 eq 'null'}"></c:when>
									<c:otherwise>
										<img src="${rVo.r_img1 }" width="100" height="100" alt="reviewIcon"/>	
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${rVo.r_img2 eq 'null'}"></c:when>
									<c:otherwise>
										<img src="${rVo.r_img2 }" width="100" height="100" alt="reviewIcon"/>	
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${rVo.r_img3 eq 'null'}"></c:when>
									<c:otherwise>
										<img src="${rVo.r_img3 }" width="100" height="100" alt="reviewIcon"/>	
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
	</form>
</body>
<script type="text/javascript">
var p_price="${vo.p_price}";
var qty=1;
var total=0;
var type=1;
console.log(p_price);
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
calPrice();
function buy(){
	$(pTotal).attr("value",total);
	$(pQty).attr("value",qty);
	uForm.submit();
}
</script>

</html>