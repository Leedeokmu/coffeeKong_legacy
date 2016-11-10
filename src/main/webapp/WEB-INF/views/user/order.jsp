<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="basePath" value="${pageContext.request.contextPath }"/>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="oSaveCtrl" name="oForm">
<input type="hidden" name="uEmail" value="${uVo.u_email }"/>
<input type="hidden" name="pId" value="${pVo.p_id }"/>
<input type="hidden" name="qty" value="${qty}"/>
<input type="hidden" name="sz" value="${sz}"/>
<input type="hidden" name="type" value="${type}"/>
<input type="hidden" name="total" value="${total}"/>
	<div class="container">
		<div>
			<h3>Ordered Product Info</h3>
			<hr>
			<div style="float: left; margin: 10px">
				<div>
					<a href="pDetailCtrl?pId=${pVo.p_id}"><img src="${pVo.p_img }" width="150" height="150" alt="productIcon" /></a>
				</div>
			</div>
			<div style="float: left; margin: 10px;margin-top:50px;margin-left:100px;">
				<div>name</div>
				<div>
					<a href="pDetailCtrl?pId=${pVo.p_id}">${pVo.p_name }</a>
				</div>
			</div>
			<div style="float: left; margin: 10px;margin-top:50px;margin-left:50px;">
				<div>total</div>
				<div>${total }</div>
			</div>
			<div style="float: left; margin: 10px;margin-top:50px;margin-left:50px;">
				<div>qty</div>
				<div>${qty }</div>
			</div>
			<c:choose>
			<c:when test="${pVo.p_category eq 'SingleOrigins' || pVo.p_category eq 'Blends' ||pVo.p_category eq 'Decafs' ||pVo.p_category eq 'Light' ||pVo.p_category eq 'Medium' ||pVo.p_category eq 'Dark' ||pVo.p_category eq 'ColdBrew'}">	
				<div>
					<div style="float: left; margin: 10px;margin-top:50px;margin-left:50px;">
						<div>type</div>
						<div>${type }</div>
					</div>
					<div style="float: left; margin: 10px;margin-top:50px;margin-left:50px;">
						<div>size</div>
						<div>${sz }</div>
					</div>
				</div>
			</c:when>
			</c:choose>
		<div style="clear:both;">
			<hr>
			<h3>Ordered Product Info</h3>
			<hr>
			<div>
				<div style="float:left;width:80px;">orderer</div>
				<div style="float:left;">${uVo.u_fname} ${uVo.u_lname}</div>
			</div>
			<div style="clear:both;">
				<div style="float:left;;width:80px;">email</div>
				<div style="float:left;">${uVo.u_email }</div>
			</div>
		</div>
		<div style="clear:both;">
			<hr>
			<h3>Receiver Info</h3>
			<hr>
			<div>
				<div style="float:left;width:80px;">receiver</div>
				<div style="float:left;"><input type="text" name="rLname" placeholder="last name"/><input type="text" name="rFname" placeholder="first name"/></div>
			</div>
			<div style="clear:both;">
				<div style="float:left;;width:80px;">post code</div>
				<div style="float:left;"><input type="text" name="rPost" maxlength="100" size="100"/></div>
			</div>
			<div style="clear:both;">
				<div style="float:left;;width:80px;">address</div>
				<div style="float:left;"><input type="text" name="rAddr" maxlength="100" size="100"/></div>
			</div>
			<div style="clear:both;">
				<div style="float:left;;width:80px;">phone</div>
				<div style="float:left;">
					<select id="phone1" name="phone1">
					    <option value="011">011</option>
					    <option value="016">016</option>
					    <option value="017">017</option>
					    <option value="019">019</option>
					    <option value="010" selected>010</option>
					</select>
					<input type="number" id="phone2" name="phone2" size="4" onkeypress="onlyNumber();" />
					<input type="number" id="phone3" name="phone3" size="4" onkeypress="onlyNumber();" />
				</div>
			</div>
		</div>
		<div style="clear:both;">
			<hr>
				<p><button type="button" onclick="order()">ORDER</button></p>
			<hr>
		</div>
	</div>
</form>
</body>
<script type="text/javascript">
function order(){
     if (document.getElementById("phone2").value.length != 4) {
         alert("you must enter 4 digits in the phone blanks");
         oForm.mobile2.focus();
         return false;
     }
     if (document.getElementById("phone3").value.length != 4) {
         alert("you must enter 4 digits in the phone blanks");
         oForm.mobile3.focus();
         return false;
     }
	oForm.submit();
}
</script>
</html>